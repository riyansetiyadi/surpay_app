import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surpay_app/provider/transaction_provider.dart';
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
            const Text('No Rekening'),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: _norekeningController,
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
              onPressed: () {},
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
