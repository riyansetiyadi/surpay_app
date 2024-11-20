import 'package:flutter/material.dart';
import 'package:surpay_app/widgets/drawer/main_drawer.dart';
import 'package:surpay_app/widgets/navigation_bar/user_app_bar.dart';
import 'package:surpay_app/widgets/navigation_bar/main_bottom_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UserAppBar(),
      drawer: const MainDrawer(),
      bottomNavigationBar: const MainBottomBar(
        initiateIndex: 0,
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tanggal ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          '18/11/2024',
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Nama Lengkap',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text('Budi', style: TextStyle(fontSize: 18))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Keterangan',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'mencairkan dana',
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Divider(
                      color: const Color.fromARGB(177, 106, 106, 106),
                      thickness: 0.5,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Jumlah',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Text(
                            'Rp. 5000',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: const Color.fromARGB(177, 106, 106, 106),
                      thickness: 0.5,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
