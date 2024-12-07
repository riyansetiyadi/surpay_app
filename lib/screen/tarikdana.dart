import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:surpay_app/provider/auth_provider.dart';
import 'package:surpay_app/provider/transaction_provider.dart';
import 'package:surpay_app/utils/number_format.dart';
import 'package:surpay_app/utils/result_state.dart';
import 'package:surpay_app/widgets/drawer/main_drawer.dart';
import 'package:surpay_app/widgets/navigation_bar/user_app_bar.dart';
import 'package:surpay_app/widgets/navigation_bar/user_bottom_bar.dart';

class TarikDanaScreen extends StatefulWidget {
  const TarikDanaScreen({super.key});

  @override
  State<TarikDanaScreen> createState() => _TarikDanaScreenState();
}

class _TarikDanaScreenState extends State<TarikDanaScreen> {
  final TextEditingController _jumlahController = TextEditingController();
  final TextEditingController _norekeningController = TextEditingController();
  final TextEditingController _namarekeningController = TextEditingController();
  final TextEditingController _namabankController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _jumlahController.addListener(() {
      final text = _jumlahController.text.replaceAll('.', '');
      if (text.isNotEmpty) {
        _jumlahController.value = TextEditingValue(
          text: formatMoneyNumber(int.parse(text)),
          selection: TextSelection.collapsed(
            offset: formatMoneyNumber(int.parse(text)).length,
          ),
        );
      }
    });

    _norekeningController.addListener(() {
      final text = _norekeningController.text;
      if (text.isNotEmpty) {
        _norekeningController.value = TextEditingValue(
          text: formatRekening(text),
          selection: TextSelection.collapsed(
            offset: formatRekening(text).length,
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _jumlahController.dispose();
    _norekeningController.dispose();
    _namabankController.dispose();
    _namarekeningController.dispose();
    super.dispose();
  }

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Jumlah yang ditarik'),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: _jumlahController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                suffixIcon: TextButton(
                  child: const Text('Max'),
                  onPressed: () async {
                    final authRead = context.read<AuthProvider>();
                    if (authRead.profile?.saldo != null) {
                      _jumlahController.text = authRead.profile!.saldo!;
                    }
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text('No Rekening'),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: _norekeningController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text('Nama Rekening'),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: _namarekeningController,
              decoration: const InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text('Nama Bank'),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: _namabankController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () async {
                final transactionRead = context.read<TransactionProvider>();
                final authRead = context.read<AuthProvider>();
                final result = await transactionRead.postWithdrawMoney(
                  _jumlahController.text.replaceAll('.', ''),
                  _norekeningController.text.replaceAll(RegExp(r'\D'), ''),
                  _namarekeningController.text,
                  _namabankController.text,
                );
                if (result) {
                  authRead.getUserData();

                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(transactionRead
                                .apiResponsePostWithdrawMoney?.message ??
                            'Berhasil menarik uang'),
                        duration: const Duration(seconds: 2),
                      ),
                    );

                    Future.delayed(
                      const Duration(seconds: 2),
                      () {
                        if (context.mounted) {
                          context.push('/penarikan');
                        }
                      },
                    );
                  }
                } else {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          transactionRead
                                  .apiResponsePostWithdrawMoney?.message ??
                              'Tarik dana gagal',
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
                backgroundColor: const Color.fromARGB(255, 0, 42, 255),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Consumer<TransactionProvider>(
                builder: (context, state, _) {
                  switch (state.statePostWithdrawMoney) {
                    case ResultState.loading:
                      return const SizedBox(
                        width: 20.0,
                        height: 20.0,
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      );
                    case ResultState.initial:
                      return const Text(
                        'Tarik Dana',
                        style: TextStyle(color: Colors.white),
                      );
                    case ResultState.error:
                      return const Text(
                        'Tarik Dana',
                        style: TextStyle(color: Colors.white),
                      );
                    case ResultState.loaded:
                      return const Text(
                        'Tarik Dana',
                        style: TextStyle(color: Colors.white),
                      );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
