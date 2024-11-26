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

  AuthProvider(this.apiSurpayService, this.authRepository) {
    getUserData();
  }

  ResultState _resultStateLogin = ResultState.initial;
  ResultState get stateLogin => _resultStateLogin;

  ResultState _resultStateGetUser = ResultState.initial;
  ResultState get stateGetUser => _resultStateGetUser;

  ResultState _resultStateUpdateUser = ResultState.initial;
  ResultState get stateUpdateUser => _resultStateUpdateUser;

  String? message;
  ApiResponseModel? apiResponseGetUserModel;
  ApiResponseModel? apiResponseUpdateUserModel;
  ProfileModel? profile;

  List<ProvinceDistrictModel> districts = [];
  List<SubdistrictModel> subdistrictsComplete = [];
  List<String> subdistrictsUnique = [];
  List<SubdistrictModel> villages = [];

  Future<bool> login(String phoneNumber, String password) async {
    _resultStateLogin = ResultState.loading;
    notifyListeners();

    try {
      final responseResult =
          await apiSurpayService.login(phoneNumber, password);

      apiResponseGetUserModel = ApiResponseModel.fromJson(responseResult);

      if (!(apiResponseGetUserModel?.error ?? true)) {
        profile = ProfileModel.fromApiJson(responseResult);
        if (profile != null) await authRepository.saveProfile(profile!);
        _resultStateGetUser = ResultState.loaded;

        getUserData();

        notifyListeners();
        return true;
      } else {
        _resultStateLogin = ResultState.error;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _resultStateLogin = ResultState.error;
      apiResponseGetUserModel =
          ApiResponseModel(error: true, message: e.toString());
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
    _resultStateGetUser = ResultState.loading;
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
        _resultStateGetUser = ResultState.loaded;
        notifyListeners();
        return true;
      } else {
        _resultStateGetUser = ResultState.error;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _resultStateGetUser = ResultState.error;
      message = 'Gagal register';
      notifyListeners();
      return false;
    }
  }

  Future<bool> logout() async {
    try {
      _resultStateGetUser = ResultState.loading;
      notifyListeners();

      await authRepository.deleteProfile();

      _resultStateGetUser = ResultState.loaded;
      notifyListeners();

      return true;
    } catch (e) {
      _resultStateGetUser = ResultState.error;
      message = 'Gagal logout';
      notifyListeners();
      return false;
    }
  }

  Future<bool> getUserData() async {
    _resultStateGetUser = ResultState.loading;
    notifyListeners();

    try {
      String? token = await authRepository.getToken();
      final responseResult = await apiSurpayService.getUserData(token ?? '');
      apiResponseGetUserModel = ApiResponseModel.fromJson(responseResult);

      if (!(apiResponseGetUserModel?.error ?? true)) {
        profile = ProfileModel.fromApiJson(responseResult);
        _resultStateGetUser = ResultState.loaded;
        notifyListeners();
        return true;
      } else {
        _resultStateGetUser = ResultState.error;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _resultStateGetUser = ResultState.error;
      notifyListeners();
      return false;
    }
  }

  Future<bool> updateUserData({
    String? phoneNumber,
    String? fullname,
    String? password,
  }) async {
    _resultStateUpdateUser = ResultState.loading;
    notifyListeners();

    try {
      String? token = await authRepository.getToken();
      final responseResult = await apiSurpayService.updateUserData(
        token ?? '',
        phoneNumber: phoneNumber,
        fullname: fullname,
        password: password,
      );
      apiResponseUpdateUserModel = ApiResponseModel.fromJson(responseResult);

      if (!(apiResponseUpdateUserModel?.error ?? false)) {
        profile = ProfileModel.fromApiJson(responseResult);
        _resultStateUpdateUser = ResultState.loaded;
        notifyListeners();
        return true;
      } else {
        _resultStateUpdateUser = ResultState.error;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _resultStateUpdateUser = ResultState.error;
      notifyListeners();
      return false;
    }
  }
}
