import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:surpay_app/models/profile_model.dart';
import 'package:surpay_app/provider/auth_provider.dart';
import 'package:surpay_app/utils/result_state.dart';
import 'package:surpay_app/widgets/handle_error_refresh_widget.dart';
import 'package:surpay_app/widgets/drawer/main_drawer.dart';
import 'package:surpay_app/widgets/navigation_bar/user_bottom_bar.dart';
import 'package:surpay_app/widgets/navigation_bar/user_app_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _obscureText = true;
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _referrerCodeController = TextEditingController();
  final TextEditingController _referralCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final authRead = context.read<AuthProvider>();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        authRead.getUserData().whenComplete(() {
          _phoneNumberController.text = authRead.profile?.phoneNumber ?? "";
          _fullnameController.text = authRead.profile?.fullname ?? "";
          _passwordController.text = authRead.profile?.password ?? "";
          _referrerCodeController.text = authRead.profile?.referrerCode ?? "";
          _referralCodeController.text =
              authRead.profile?.referralCode ?? "bibi";
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UserAppBar(),
      drawer: const MainDrawer(),
      bottomNavigationBar: const UserBottomBar(
        initiateIndex: 4,
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Consumer<AuthProvider>(
          builder: (context, state, _) {
            switch (state.stateGetUser) {
              case ResultState.loading:
                return Center(
                  child: defaultTargetPlatform == TargetPlatform.iOS
                      ? const CupertinoActivityIndicator(
                          radius: 20.0,
                        )
                      : const CircularProgressIndicator(),
                );
              case ResultState.initial:
                return Center(
                  child: defaultTargetPlatform == TargetPlatform.iOS
                      ? const CupertinoActivityIndicator(
                          radius: 20.0,
                        )
                      : const CircularProgressIndicator(),
                );
              case ResultState.error:
                return ErrorRefresh(
                  errorTitle: state.apiResponseGetUserModel?.message,
                  onPressed: () async {
                    await state.getUserData();
                  },
                );
              case ResultState.loaded:
                return Column(
                  children: [
                    cardUbahData(state.profile),
                    cardReferralData(state.profile),
                  ],
                );
            }
          },
        ),
      ),
    );
  }

  Card cardUbahData(ProfileModel? profile) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ubah Profil',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'No Hp',
                  style: TextStyle(fontSize: 18),
                ),
                // const SizedBox(
                //   width: 90,
                // ),
                TextFormField(
                  controller: _phoneNumberController,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: '',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
            ),
            // const SizedBox(
            //   height: 16,
            // ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Nama Lengkap',
                  style: TextStyle(fontSize: 18),
                ),
                // const SizedBox(
                //   width: 20,
                // ),
                TextFormField(
                  controller: _fullnameController,
                  decoration: InputDecoration(
                    hintText: '',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
            ),
            // const SizedBox(
            //   height: 16,
            // ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Password',
                  style: TextStyle(fontSize: 18),
                ),
                // const SizedBox(
                //   width: 60,
                // ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    hintText: '',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.orange,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (profile?.referrerCode?.isEmpty ?? false)
                      ? 'Masukkan kode referral teman anda (optional)'
                      : 'Kode Referral yang Dipakai',
                  style: const TextStyle(fontSize: 18),
                  // softWrap: true,
                ),
                // const SizedBox(
                //   width: 60,
                // ),
                TextFormField(
                  controller: _referrerCodeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    suffixIcon: (profile?.referrerCode?.isEmpty ?? false)
                        ? null
                        : IconButton(
                            icon: const Icon(
                              Icons.paste,
                              color: Colors.orange,
                            ),
                            onPressed: () async {
                              _referrerCodeController.text =
                                  (await Clipboard.getData('text/plain'))
                                          ?.text ??
                                      '';
                              // Clipboard.setData(
                              //   ClipboardData(text: _referralCodeController.text),
                              // );
                            },
                          ),
                  ),
                ),
              ],
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            ElevatedButton(
              onPressed: () async {
                final authRead = context.read<AuthProvider>();
                bool result = await authRead.updateUserData(
                  fullname: _fullnameController.text,
                  password: _passwordController.text,
                  referrerCode: _referrerCodeController.text,
                );
                if (result) {
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.green,
                        content: Text(
                          authRead.apiResponseUpdateUserModel?.message ??
                              "Data berhasil diubah",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.white),
                        ),
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  }
                } else {
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          authRead.apiResponseUpdateUserModel?.message ??
                              "Data gagal diubah",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.white),
                        ),
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 60, 86, 255),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text(
                'Simpan',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card cardReferralData(ProfileModel? profile) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Kode Referral',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                TextFormField(
                  controller: _referralCodeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.copy,
                        color: Colors.orange,
                      ),
                      onPressed: () async {
                        Clipboard.setData(
                          ClipboardData(text: _referralCodeController.text),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Share.share(profile?.referralCode ?? '');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 60, 86, 255),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text(
                'Bagikan',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
