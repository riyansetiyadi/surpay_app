import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:surpay_app/models/survey_question_model.dart';
import 'package:surpay_app/provider/auth_provider.dart';
import 'package:surpay_app/provider/survey_provider.dart';
import 'package:surpay_app/utils/result_state.dart';
import 'package:surpay_app/widgets/handle_error_refresh_widget.dart';

class DetailSurveyScreen extends StatefulWidget {
  final String? id;
  final String? surveyTitle;
  const DetailSurveyScreen({
    super.key,
    this.id,
    this.surveyTitle,
  });

  @override
  State<DetailSurveyScreen> createState() => _DetailSurveyScreenState();
}

class _DetailSurveyScreenState extends State<DetailSurveyScreen> {
  late TextEditingController _commentController;

  @override
  void initState() {
    super.initState();
    _commentController = TextEditingController();
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // leading: IconButton(
          //   icon: const Icon(Icons.arrow_back),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
          ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Consumer<SurveyProvider>(
          builder: (context, state, _) {
            switch (state.stateGetSurveyById) {
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
                          return questionCard(item, state);
                        },
                      ),
                      const SizedBox(
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
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8, right: 8),
                                  child: Text(
                                    'Komentar',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            TextFormField(
                              controller: _commentController,
                              maxLines: 3,
                              decoration: InputDecoration(
                                hintText: 'Beri Komentar',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          final result = await state.postAnswerSurvey(
                            state.detailSurvey,
                            _commentController.text,
                          );
                          if (result) {
                            if (context.mounted) {
                              final authRead = context.read<AuthProvider>();

                              await authRead.getUserData();

                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      state.apiResponsePostAnswerSurveyModel
                                              ?.message ??
                                          'Berhasil mengisi survey',
                                    ),
                                    duration: const Duration(seconds: 2),
                                  ),
                                );

                                Future.delayed(
                                  const Duration(seconds: 2),
                                  () {
                                    if (context.mounted) {
                                      context.push('/survey-aktif');
                                    }
                                  },
                                );
                              }
                            }
                          } else {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(
                                    state.apiResponsePostAnswerSurveyModel
                                            ?.message ??
                                        'Gagal mengisi survey',
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
                          backgroundColor:
                              const Color.fromARGB(255, 0, 64, 255),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Consumer<SurveyProvider>(
                          builder: (context, state, _) {
                            switch (state.statePostAnswerSurvey) {
                              case ResultState.loading:
                                return const SizedBox(
                                  width: 20.0,
                                  height: 20.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                  ),
                                );
                              case ResultState.initial:
                                return const Text(
                                  'Simpan',
                                  style: TextStyle(color: Colors.white),
                                );
                              case ResultState.error:
                                return const Text(
                                  'Simpan',
                                  style: TextStyle(color: Colors.white),
                                );
                              case ResultState.loaded:
                                return const Text(
                                  'Simpan',
                                  style: TextStyle(color: Colors.white),
                                );
                            }
                          },
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

  Card questionCard(SurveyQuestionModel survey, SurveyProvider state) {
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
            width: double.infinity,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
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
          if (survey.a != null && (survey.a?.isNotEmpty ?? false))
            RadioListTile<String>(
              title: Text(survey.a ?? ''),
              value: 'a',
              groupValue: survey.answer,
              onChanged: (String? value) {
                state.updateSurveyAnswer(
                  survey.id,
                  value,
                );
              },
            ),
          if (survey.b != null && (survey.b?.isNotEmpty ?? false))
            RadioListTile<String>(
              title: Text(survey.b ?? ''),
              value: 'b',
              groupValue: survey.answer,
              onChanged: (String? value) {
                state.updateSurveyAnswer(
                  survey.id,
                  value,
                );
              },
            ),
          if (survey.c != null && (survey.c?.isNotEmpty ?? false))
            RadioListTile<String>(
              title: Text(survey.c ?? ''),
              value: 'c',
              groupValue: survey.answer,
              onChanged: (String? value) {
                state.updateSurveyAnswer(
                  survey.id,
                  value,
                );
              },
            ),
          if (survey.d != null && (survey.d?.isNotEmpty ?? false))
            RadioListTile<String>(
              title: Text(survey.d ?? ''),
              value: 'd',
              groupValue: survey.answer,
              onChanged: (String? value) {
                state.updateSurveyAnswer(
                  survey.id,
                  value,
                );
              },
            ),
          if (survey.e != null && (survey.e?.isNotEmpty ?? false))
            RadioListTile<String>(
              title: Text(survey.e ?? ''),
              value: 'e',
              groupValue: survey.answer,
              onChanged: (String? value) {
                state.updateSurveyAnswer(
                  survey.id,
                  value,
                );
              },
            ),
        ],
      ),
    );
  }
}
