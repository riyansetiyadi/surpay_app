import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:surpay_app/db/auth_repository.dart';
import 'package:surpay_app/models/api_response_model.dart';
import 'package:surpay_app/models/dashboard_model.dart';
import 'package:surpay_app/models/hadiah_model.dart';
import 'package:surpay_app/models/province_district_model.dart';
import 'package:surpay_app/models/subdistrict_model.dart';
import 'package:surpay_app/services/api_surpay.dart';
import 'package:surpay_app/utils/result_state.dart';

class TransactionProvider extends ChangeNotifier {
  final AuthRepository authRepository;
  final ApiSurpayService apiSurpayService;

  TransactionProvider(this.apiSurpayService, this.authRepository);

  ResultState _resultStateGetDashboardHistory = ResultState.initial;
  ResultState get stateGetDashboardHistory => _resultStateGetDashboardHistory;

  ResultState _resultStateGetHadiah = ResultState.initial;
  ResultState get stateGetHadiah => _resultStateGetHadiah;

  String? message;
  ApiResponseModel? apiResponseGetDashboardHistory;
  ApiResponseModel? apiResponseGetHadiahModel;
  List<DashboardModel>? dashboardHistories;
  List<HadiahModel>? hadiahHistories;

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

  Future<bool> getHadiah() async {
    _resultStateGetHadiah = ResultState.loading;
    notifyListeners();

    try {
      String? token = await authRepository.getToken();
      final responseResult = await apiSurpayService.getListHadiah(token ?? '');
      apiResponseGetHadiahModel = ApiResponseModel.fromJson(responseResult);

      if (!(apiResponseGetHadiahModel?.error ?? false)) {
        hadiahHistories = (responseResult['data'] as List<dynamic>)
            .map((item) => HadiahModel.fromJson(item))
            .toList();
        _resultStateGetHadiah = ResultState.loaded;
        notifyListeners();
        return true;
      } else {
        _resultStateGetHadiah = ResultState.error;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _resultStateGetHadiah = ResultState.error;
      notifyListeners();
      return false;
    }
  }
}
