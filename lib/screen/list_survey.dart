import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:surpay_app/models/survey_model.dart';
import 'package:surpay_app/provider/survey_provider.dart';
import 'package:surpay_app/utils/number_format.dart';
import 'package:surpay_app/utils/result_state.dart';
import 'package:surpay_app/widgets/drawer/main_drawer.dart';
import 'package:surpay_app/widgets/handle_error_refresh_widget.dart';
import 'package:surpay_app/widgets/navigation_bar/user_bottom_bar.dart';
import 'package:surpay_app/widgets/navigation_bar/user_app_bar.dart';

class ListSurveyScreen extends StatefulWidget {
  const ListSurveyScreen({super.key});

  @override
  State<ListSurveyScreen> createState() => _ListSurveyScreenState();
}

class _ListSurveyScreenState extends State<ListSurveyScreen> {
  @override
  void initState() {
    super.initState();
    final surveyRead = context.read<SurveyProvider>();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        surveyRead.getListSurvey();
      },
    );
  }

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
            Consumer<SurveyProvider>(
              builder: (context, state, _) {
                switch (state.stateGetListSurvey) {
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
                        await state.getListSurvey();
                      },
                    );
                  case ResultState.loaded:
                    if (state.listSurvey != null) {
                      return Column(
                        children: [
                          ...state.listSurvey!.map(
                            (item) {
                              return cardSurvey(context, item, state);
                            },
                          )
                        ],
                      );
                    } else {
                      return ErrorRefresh(
                        onPressed: () async {
                          await state.getListSurvey();
                        },
                      );
                    }
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Card cardSurvey(
      BuildContext context, SurveyModel survey, SurveyProvider state) {
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
            Text(
              survey.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(survey.description, style: const TextStyle(fontSize: 18)),
            const SizedBox(
              height: 16,
            ),
            const Divider(
              color: Color.fromARGB(177, 106, 106, 106),
              thickness: 0.5,
            ),
            Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'Poin : ',
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                    Text(
                      formatMoneyNumber(survey.poin),
                      style: const TextStyle(color: Colors.blue, fontSize: 18),
                    )
                  ],
                ),
                if (survey.undian != '')
                  Row(
                    children: [
                      const Text(
                        'Undian :',
                        style: TextStyle(color: Colors.red, fontSize: 18),
                      ),
                      Text(
                        survey.undian,
                        style: const TextStyle(color: Colors.red, fontSize: 18),
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
                state.getSurveyById(survey.id.toString());
                context
                    .push('/survey-page?id=${survey.id}&title=${survey.title}');
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
    );
  }
}
