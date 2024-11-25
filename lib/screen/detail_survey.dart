import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surpay_app/models/survey_question_model.dart';
import 'package:surpay_app/provider/survey_provider.dart';
import 'package:surpay_app/utils/result_state.dart';
import 'package:surpay_app/widgets/drawer/main_drawer.dart';
import 'package:surpay_app/widgets/handle_error_refresh_widget.dart';
import 'package:surpay_app/widgets/navigation_bar/user_app_bar.dart';

class DetailSurveyScreen extends StatefulWidget {
  final String? id;
  const DetailSurveyScreen({
    super.key,
    this.id,
  });

  @override
  State<DetailSurveyScreen> createState() => _DetailSurveyScreenState();
}

class _DetailSurveyScreenState extends State<DetailSurveyScreen> {
  int? _selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Consumer<SurveyProvider>(
          builder: (context, state, _) {
            switch (state.stateGetUserById) {
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
                    await state.getSurveyById(widget.id ?? '');
                  },
                );
              case ResultState.loaded:
                if (state.detailSurvey != null) {
                  return Column(
                    children: [
                      ...state.detailSurvey!.map(
                        (item) {
                          return questionCard(item);
                        },
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15.0),
                                  topRight: Radius.circular(15.0),
                                ),
                              ),
                              height: 40,
                              width: double.infinity,
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8, right: 8),
                                  child: Text(
                                    'Komentar',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            TextFormField(
                              maxLines: 3,
                              decoration: InputDecoration(
                                hintText: 'Beri Komentar',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 0, 64, 255),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: const Text(
                          'Simpan',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ],
                  );
                } else {
                  return ErrorRefresh(
                    onPressed: () async {
                      await state.getSurveyById(widget.id ?? '');
                    },
                  );
                }
            }
          },
        ),
      ),
    );
  }

  Card questionCard(SurveyQuestionModel survey) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
            ),
            height: 40,
            width: double.infinity,
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Text(
                  survey.pertanyaan,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          if (survey.a != null)
            RadioListTile<int>(
              title: Text(survey.a ?? ''),
              value: 0,
              groupValue: _selectedValue,
              onChanged: (int? value) {
                setState(() {
                  _selectedValue = value;
                });
              },
            ),
          if (survey.b != null)
            RadioListTile<int>(
              title: Text(survey.b ?? ''),
              value: 1,
              groupValue: _selectedValue,
              onChanged: (int? value) {
                setState(() {
                  _selectedValue = value;
                });
              },
            ),
          if (survey.c != null)
            RadioListTile<int>(
              title: Text(survey.c ?? ''),
              value: 2,
              groupValue: _selectedValue,
              onChanged: (int? value) {
                setState(() {
                  _selectedValue = value;
                });
              },
            ),
          if (survey.d != null)
            RadioListTile<int>(
              title: Text(survey.d ?? ''),
              value: 3,
              groupValue: _selectedValue,
              onChanged: (int? value) {
                setState(() {
                  _selectedValue = value;
                });
              },
            ),
          if (survey.e != null)
            RadioListTile<int>(
              title: Text(survey.e ?? ''),
              value: 4,
              groupValue: _selectedValue,
              onChanged: (int? value) {
                setState(() {
                  _selectedValue = value;
                });
              },
            ),
        ],
      ),
    );
  }
}
