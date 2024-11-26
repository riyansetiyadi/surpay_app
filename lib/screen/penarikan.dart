import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:surpay_app/models/profile_model.dart';
import 'package:surpay_app/provider/auth_provider.dart';
import 'package:surpay_app/utils/result_state.dart';
import 'package:surpay_app/widgets/drawer/main_drawer.dart';
import 'package:surpay_app/widgets/handle_error_refresh_widget.dart';
import 'package:surpay_app/widgets/navigation_bar/user_bottom_bar.dart';
import 'package:surpay_app/widgets/navigation_bar/user_app_bar.dart';

class PenarikanScreen extends StatefulWidget {
  const PenarikanScreen({super.key});

  @override
  State<PenarikanScreen> createState() => _PenarikanScreenState();
}

class _PenarikanScreenState extends State<PenarikanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UserAppBar(),
      drawer: const MainDrawer(),
      bottomNavigationBar: const UserBottomBar(
        initiateIndex: 3,
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Consumer<AuthProvider>(
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
                    return cardSaldo(state.profile);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Card cardSaldo(ProfileModel? profile) {
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
            const Text('Total pendapatan dari :',
                style: TextStyle(fontSize: 18)),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                const Text(
                  'Nomor hp : ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  profile?.phoneNumber ?? '',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  'nama : ',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  profile?.fullname ?? '',
                  style: const TextStyle(fontSize: 18),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Color.fromARGB(177, 106, 106, 106),
              thickness: 0.5,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  const Text(
                    'Total Pendapatan :',
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                  Text(
                    profile?.saldo ?? '0',
                    style: const TextStyle(color: Colors.red, fontSize: 20),
                  )
                ],
              ),
            ),
            const Divider(
              color: Color.fromARGB(177, 106, 106, 106),
              thickness: 0.5,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                context.push('/tarik-dana');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 200, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text(
                'Tarik Dana',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
