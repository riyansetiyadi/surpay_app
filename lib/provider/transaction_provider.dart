import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:surpay_app/db/auth_repository.dart';
import 'package:surpay_app/models/api_response_model.dart';
import 'package:surpay_app/models/dashboard_model.dart';
import 'package:surpay_app/models/province_district_model.dart';
import 'package:surpay_app/models/subdistrict_model.dart';
import 'package:surpay_app/models/survey_question_model.dart';
import 'package:surpay_app/services/api_surpay.dart';
import 'package:surpay_app/utils/result_state.dart';

class TransactionProvider extends ChangeNotifier {
  final AuthRepository authRepository;
  final ApiSurpayService apiSurpayService;

  TransactionProvider(this.apiSurpayService, this.authRepository);

  ResultState _resultStateGetDashboardHistory = ResultState.initial;
  ResultState get stateGetDashboardHistory => _resultStateGetDashboardHistory;

  ResultState _resultStategetSurveyById = ResultState.initial;
  ResultState get stateGetUserById => _resultStategetSurveyById;

  String? message;
  ApiResponseModel? apiResponseGetDashboardHistory;
  ApiResponseModel? apiResponseGetDetailSurveyModel;
  List<DashboardModel>? dashboardHistories;
  List<SurveyQuestionModel>? detailSurvey;

  List<ProvinceDistrictModel> districts = [];
  List<SubdistrictModel> subdistrictsComplete = [];
  List<String> subdistrictsUnique = [];
  List<SubdistrictModel> villages = [];

  Future<bool> getDashboardHistory() async {
    _resultStateGetDashboardHistory = ResultState.loading;
    notifyListeners();

    try {
      String? token = await authRepository.getToken();
      final responseResult =
          await apiSurpayService.getRiwayatDashboard(token ?? '');
      apiResponseGetDashboardHistory =
          ApiResponseModel.fromJson(responseResult);

      if (!(apiResponseGetDashboardHistory?.error ?? true)) {
        dashboardHistories = (responseResult['data'] as List<dynamic>)
            .map((item) => DashboardModel.fromJson(item))
            .toList();
        _resultStateGetDashboardHistory = ResultState.loaded;
        notifyListeners();
        return true;
      } else {
        _resultStateGetDashboardHistory = ResultState.error;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _resultStateGetDashboardHistory = ResultState.error;
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
}
