import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:surpay_app/db/auth_repository.dart';
import 'package:surpay_app/models/api_response_model.dart';
import 'package:surpay_app/models/subdistrict_model.dart';
import 'package:surpay_app/models/survey_model.dart';
import 'package:surpay_app/models/survey_question_model.dart';
import 'package:surpay_app/services/api_surpay.dart';
import 'package:surpay_app/utils/result_state.dart';

class SurveyProvider extends ChangeNotifier {
  final AuthRepository authRepository;
  final ApiSurpayService apiSurpayService;

  SurveyProvider(this.apiSurpayService, this.authRepository);

  ResultState _resultStateGetListSurvey = ResultState.initial;
  ResultState get stateGetListSurvey => _resultStateGetListSurvey;

  ResultState _resultStategetSurveyById = ResultState.initial;
  ResultState get stateGetSurveyById => _resultStategetSurveyById;

  ResultState _resultStatePostAnswerSurvey = ResultState.initial;
  ResultState get statePostAnswerSurvey => _resultStatePostAnswerSurvey;

  String? message;
  ApiResponseModel? apiResponseGetListSurveyModel;
  ApiResponseModel? apiResponseGetDetailSurveyModel;
  ApiResponseModel? apiResponsePostAnswerSurveyModel;
  List<SurveyModel>? listSurvey;
  List<SurveyQuestionModel>? detailSurvey;

  List<SubdistrictModel> subdistrictsComplete = [];
  List<String> subdistrictsUnique = [];
  List<SubdistrictModel> villages = [];

  Future<bool> getListSurvey() async {
    _resultStateGetListSurvey = ResultState.loading;
    notifyListeners();

    try {
      String? token = await authRepository.getToken();
      final responseResult = await apiSurpayService.getAllSurvey(token ?? '');
      apiResponseGetListSurveyModel = ApiResponseModel.fromJson(responseResult);

      if (!(apiResponseGetListSurveyModel?.error ?? true)) {
        listSurvey = (responseResult['data'] as List<dynamic>)
            .map((item) => SurveyModel.fromJson(item))
            .toList();
        _resultStateGetListSurvey = ResultState.loaded;
        notifyListeners();
        return true;
      } else {
        _resultStateGetListSurvey = ResultState.error;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _resultStateGetListSurvey = ResultState.error;
      notifyListeners();
      return false;
    }
  }

  Future<bool> getSurveyById(String id) async {
    _resultStategetSurveyById = ResultState.loading;
    notifyListeners();

    try {
      String? token = await authRepository.getToken();
      final responseResult =
          await apiSurpayService.getDetailSurvey(token ?? '', id);
      apiResponseGetDetailSurveyModel =
          ApiResponseModel.fromJson(responseResult);

      if (!(apiResponseGetDetailSurveyModel?.error ?? false)) {
        detailSurvey = (responseResult['data'] as List<dynamic>)
            .map((item) => SurveyQuestionModel.fromJson(item))
            .toList();
        _resultStategetSurveyById = ResultState.loaded;
        notifyListeners();
        return true;
      } else {
        _resultStategetSurveyById = ResultState.error;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _resultStategetSurveyById = ResultState.error;
      notifyListeners();
      return false;
    }
  }

  void updateSurveyAnswer(int id, String? answer) {
    detailSurvey?.firstWhere((element) => element.id == id).answer = answer;
    notifyListeners();
  }

  Future<bool> postAnswerSurvey(
      List<SurveyQuestionModel>? surveys, String comment) async {
    _resultStatePostAnswerSurvey = ResultState.loading;
    notifyListeners();

    try {
      String? token = await authRepository.getToken();

      if (surveys != null) {
        for (SurveyQuestionModel question in surveys) {
          dynamic responseResult = await apiSurpayService.postAnswerSurvey(
            token ?? '',
            question.idSurvey.toString(),
            question.nomer.toString(),
            question.answer ?? '',
            comment,
          );

          apiResponsePostAnswerSurveyModel =
              ApiResponseModel.fromJson(responseResult);

          if (apiResponsePostAnswerSurveyModel?.error ?? true) {
            _resultStatePostAnswerSurvey = ResultState.error;
            notifyListeners();
            return false;
          }
        }
        _resultStatePostAnswerSurvey = ResultState.loaded;
        notifyListeners();
        return true;
      } else {
        apiResponsePostAnswerSurveyModel = ApiResponseModel(
          error: true,
          message: 'Survey tidak valid',
        );
        _resultStatePostAnswerSurvey = ResultState.error;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _resultStatePostAnswerSurvey = ResultState.error;
      notifyListeners();
      return false;
    }
  }
}
