import 'package:flutter/material.dart';
import 'package:surpay_app/widgets/navigation_bar/main_bottom_bar.dart';

class SurveyAktifScreen extends StatefulWidget {
  const SurveyAktifScreen({super.key});

  @override
  State<SurveyAktifScreen> createState() => _SurveyAktifScreenState();
}

class _SurveyAktifScreenState extends State<SurveyAktifScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MainBottomBar(
        initiateIndex: 1,
      ),
      backgroundColor: Colors.grey[200],
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Saldo Anda :',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ' Rp. 7.500',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.red,
                                fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Cari',
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    ),
                  ),
                ),
                SizedBox(
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
            SizedBox(
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
                    Text('Judul Survey',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Deskripsi survey', style: TextStyle(fontSize: 18)),
                    SizedBox(
                      height: 16,
                    ),
                    Divider(
                      color: const Color.fromARGB(177, 106, 106, 106),
                      thickness: 0.5,
                    ),
                    Column(
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
                    Divider(
                      color: const Color.fromARGB(177, 106, 106, 106),
                      thickness: 0.5,
                    ),
                    SizedBox(
                      height: 10,
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
