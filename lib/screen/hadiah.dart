import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surpay_app/models/hadiah_model.dart';
import 'package:surpay_app/provider/transaction_provider.dart';
import 'package:surpay_app/utils/number_format.dart';
import 'package:surpay_app/utils/result_state.dart';
import 'package:surpay_app/widgets/drawer/main_drawer.dart';
import 'package:surpay_app/widgets/handle_error_refresh_widget.dart';
import 'package:surpay_app/widgets/navigation_bar/user_bottom_bar.dart';
import 'package:surpay_app/widgets/navigation_bar/user_app_bar.dart';

class HadiahScreen extends StatefulWidget {
  const HadiahScreen({super.key});

  @override
  State<HadiahScreen> createState() => _HadiahScreenState();
}

class _HadiahScreenState extends State<HadiahScreen> {
  Map<String, String> translations = {
    "survey_reward": "Hadiah Survey",
    "withdrawal": "Penarikan",
    "reward_referral": "Hadiah referral",
  };

  @override
  void initState() {
    super.initState();
    final transactionRead = context.read<TransactionProvider>();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        transactionRead.getHadiah();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UserAppBar(),
      drawer: const MainDrawer(),
      bottomNavigationBar: const UserBottomBar(
        initiateIndex: 2,
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Consumer<TransactionProvider>(
          builder: (context, state, _) {
            switch (state.stateGetHadiah) {
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
                  onPressed: () async {
                    await state.getHadiah();
                  },
                );
              case ResultState.loaded:
                if (state.hadiahHistories != null) {
                  return Column(
                    children: [
                      ...state.hadiahHistories!.map(
                        (item) {
                          return hadiahCard(item);
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      // Card(
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(15.0),
                      //   ),
                      //   elevation: 8,
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Container(
                      //         decoration: const BoxDecoration(
                      //           color: Colors.grey,
                      //           borderRadius: BorderRadius.only(
                      //             topLeft: Radius.circular(15.0),
                      //             topRight: Radius.circular(15.0),
                      //           ),
                      //         ),
                      //         height: 40,
                      //         width: double.infinity,
                      //         child: const Center(
                      //           child: Padding(
                      //             padding: EdgeInsets.only(left: 8, right: 8),
                      //             child: Text(
                      //               'Komentar',
                      //               style: TextStyle(
                      //                   fontWeight: FontWeight.bold,
                      //                   fontSize: 20,
                      //                   color: Colors.white),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //       TextFormField(
                      //         maxLines: 3,
                      //         decoration: InputDecoration(
                      //           hintText: 'Beri Komentar',
                      //           border: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(10.0),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 8,
                      // ),
                      // ElevatedButton(
                      //   onPressed: () {},
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor:
                      //         const Color.fromARGB(255, 0, 64, 255),
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(5),
                      //     ),
                      //   ),
                      //   child: const Text(
                      //     'Simpan',
                      //     style: TextStyle(color: Colors.white, fontSize: 16),
                      //   ),
                      // ),
                    ],
                  );
                } else {
                  return ErrorRefresh(
                    onPressed: () async {
                      await state.getHadiah();
                    },
                  );
                }
            }
          },
        ),
      ),
    );
  }

  Card hadiahCard(HadiahModel hadiah) {
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
            if (hadiah.type != '')
              innerText('Tipe', translations[hadiah.type] ?? ''),
            if (hadiah.idSurvey != '') innerText('ID Survey', hadiah.idSurvey),
            if (hadiah.undian != '') innerText('Undian', hadiah.undian ?? ''),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Jam',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  hadiah.jam,
                  style: const TextStyle(fontSize: 18),
                )
              ],
            ),
            const Divider(
              color: Color.fromARGB(177, 106, 106, 106),
              thickness: 0.5,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Poin',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Text(
                    'Rp. ${formatMoneyNumber(hadiah.poin)}',
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            const Divider(
              color: Color.fromARGB(177, 106, 106, 106),
              thickness: 0.5,
            ),
          ],
        ),
      ),
    );
  }

  Padding innerText(String textTitle, String textBody) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textTitle,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(
            textBody,
            style: const TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}
