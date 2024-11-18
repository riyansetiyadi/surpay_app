import 'package:flutter/material.dart';
import 'package:surpay_app/widgets/navigation_bar/main_bottom_bar.dart';

class HadiahScreen extends StatefulWidget {
  const HadiahScreen({super.key});

  @override
  State<HadiahScreen> createState() => _HadiahScreenState();
}

class _HadiahScreenState extends State<HadiahScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MainBottomBar(
        initiateIndex: 2,
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
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  scrollDirection:Axis.horizontal,
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('ID Survey', style: TextStyle(fontWeight: FontWeight.bold),)),
                        DataColumn(label: Text('Poin', style: TextStyle(fontWeight: FontWeight.bold),)),
                        DataColumn(label: Text('Undian', style: TextStyle(fontWeight: FontWeight.bold),)),
                        DataColumn(label: Text('Jam', style: TextStyle(fontWeight: FontWeight.bold),)),
                      ],
                    rows: const [
                      DataRow(cells: [
                        DataCell(Text('1')),
                        DataCell(Text('5000')),
                        DataCell(Text('')),
                        DataCell(Text('2024-11-18 08:38:36')),
                      ]),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
