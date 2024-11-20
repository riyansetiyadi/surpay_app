import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:surpay_app/widgets/drawer/main_drawer.dart';
import 'package:surpay_app/widgets/navigation_bar/user_bottom_bar.dart';
import 'package:surpay_app/widgets/navigation_bar/user_app_bar.dart';

class SurveyAktifScreen extends StatefulWidget {
  const SurveyAktifScreen({super.key});

  @override
  State<SurveyAktifScreen> createState() => _SurveyAktifScreenState();
}

class _SurveyAktifScreenState extends State<SurveyAktifScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UserAppBar(),
      drawer: const MainDrawer(),
      bottomNavigationBar: const UserBottomBar(
        initiateIndex: 1,
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Cari',
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 200, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text(
                    'Cari',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
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
                    const Text('Judul Survey',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Deskripsi survey',
                        style: TextStyle(fontSize: 18)),
                    const SizedBox(
                      height: 16,
                    ),
                    const Divider(
                      color: Color.fromARGB(177, 106, 106, 106),
                      thickness: 0.5,
                    ),
                    const Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Poin : ',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 18),
                            ),
                            Text(
                              '5000',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 18),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Undian :',
                              style: TextStyle(color: Colors.red, fontSize: 18),
                            ),
                            Text(
                              '',
                              style: TextStyle(color: Colors.red, fontSize: 18),
                            )
                          ],
                        ),
                      ],
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
                        context.push('/survey-page');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 255, 200, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Text(
                        'Ikuti Survey',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
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
