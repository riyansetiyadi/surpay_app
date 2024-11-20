import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:surpay_app/db/auth_repository.dart';
import 'package:surpay_app/models/api_response_model.dart';
import 'package:surpay_app/models/profile_model.dart';
import 'package:surpay_app/models/province_district_model.dart';
import 'package:surpay_app/models/subdistrict_model.dart';
import 'package:surpay_app/services/api_surpay.dart';
import 'package:surpay_app/utils/result_state.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepository authRepository;
  final ApiSurpayService apiSurpayService;

  AuthProvider(this.apiSurpayService, this.authRepository);

  ResultState _resultState = ResultState.initial;
  ResultState get state => _resultState;

  String? message;
  ApiResponseModel? apiResponseModel;
  ProfileModel? profile;

  List<ProvinceDistrictModel> districts = [];
  List<SubdistrictModel> subdistrictsComplete = [];
  List<String> subdistrictsUnique = [];
  List<SubdistrictModel> villages = [];

  Future<bool> login(String phoneNumber, String password) async {
    _resultState = ResultState.loading;
    notifyListeners();

    try {
      final responseResult =
          await apiSurpayService.login(phoneNumber, password);

      apiResponseModel = ApiResponseModel.fromJson(responseResult);

      if (!(apiResponseModel?.error ?? true)) {
        profile = ProfileModel.fromApiJson(responseResult);
        if (profile != null) await authRepository.saveProfile(profile!);
        _resultState = ResultState.loaded;
        notifyListeners();
        return true;
      } else {
        _resultState = ResultState.error;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _resultState = ResultState.error;
      apiResponseModel = ApiResponseModel(error: true, message: e.toString());
      notifyListeners();
      return false;
    }
  }

  Future<bool> register(
    String phoneNumber,
    String password,
    String fullname,
    String birthYear,
    String gender,
    String province,
    String district,
    String subdistrict,
    String village,
    String postalCode,
    String address,
  ) async {
    _resultState = ResultState.loading;
    notifyListeners();

    try {
      final responseResult = await apiSurpayService.register(
        phoneNumber,
        password,
        fullname,
        birthYear,
        gender,
        province,
        district,
        subdistrict,
        village,
        postalCode,
        address,
      );
      message = responseResult['message'];
      if (!responseResult['error']) {
        profile = ProfileModel.fromApiJson(responseResult);
        _resultState = ResultState.loaded;
        notifyListeners();
        return true;
      } else {
        _resultState = ResultState.error;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _resultState = ResultState.error;
      message = 'Gagal register';
      notifyListeners();
      return false;
    }
  }

  Future<bool> logout() async {
    try {
      _resultState = ResultState.loading;
      notifyListeners();

      await authRepository.deleteProfile();

      _resultState = ResultState.loaded;
      notifyListeners();

      return true;
    } catch (e) {
      _resultState = ResultState.error;
      message = 'Gagal logout';
      notifyListeners();
      return false;
    }
  }

  Future<bool> getUserData() async {
    _resultState = ResultState.loading;
    notifyListeners();

    try {
      String? token = await authRepository.getToken();
      final responseResult = await apiSurpayService.getUserData(token ?? '');
      apiResponseModel = ApiResponseModel.fromJson(responseResult);

      if (!(apiResponseModel?.error ?? true)) {
        profile = ProfileModel.fromApiJson(responseResult);
        _resultState = ResultState.loaded;
        notifyListeners();
        return true;
      } else {
        _resultState = ResultState.error;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _resultState = ResultState.error;
      notifyListeners();
      return false;
    }
  }

  Future<bool> updateUserData({
    String? phoneNumber,
    String? fullname,
    String? password,
  }) async {
    _resultState = ResultState.loading;
    notifyListeners();

    try {
      String? token = await authRepository.getToken();
      final responseResult = await apiSurpayService.getUserData(token ?? '');
      apiResponseModel = ApiResponseModel.fromJson(responseResult);

      if (!(apiResponseModel?.error ?? true)) {
        profile = ProfileModel.fromApiJson(responseResult);
        _resultState = ResultState.loaded;
        notifyListeners();
        return true;
      } else {
        _resultState = ResultState.error;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _resultState = ResultState.error;
      notifyListeners();
      return false;
    }
  }
}
