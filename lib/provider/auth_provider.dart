import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:surpay_app/models/profile_model.dart';
import 'package:surpay_app/models/province_district_model.dart';
import 'package:surpay_app/models/subdistrict_model.dart';
import 'package:surpay_app/services/api_surpay.dart';
import 'package:surpay_app/utils/result_state.dart';

class AuthProvider extends ChangeNotifier {
  final ApiSurpayService apiSurpayService;

  AuthProvider(this.apiSurpayService);

  ResultState _resultState = ResultState.initial;
  ResultState get state => _resultState;

  String? message;
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
      profile = ProfileModel.fromApiJson(responseResult);
      message = 'Berhasil login';
      _resultState = ResultState.loaded;
      notifyListeners();
      return true;
    } catch (e) {
      _resultState = ResultState.error;
      message = 'Gagal login';
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

  Future<ProvinceDistrictModel?> getDistrictByName(String? districtName) async {
    try {
      return districts.firstWhere((district) => district.name == districtName);
    } catch (e) {
      return null;
    }
  }

  Future<SubdistrictModel?> getVillageByName(String? villageName) async {
    try {
      return villages.firstWhere((village) => village.kelurahan == villageName);
    } catch (e) {
      return null;
    }
  }

  Future<bool> getDistrict(String idProvince) async {
    _resultState = ResultState.loading;
    notifyListeners();

    try {
      final responseResult =
          await apiSurpayService.getIndonesiaDistrict(idProvince);
      districts = parseProvincesDistricts(responseResult);
      message = 'Berhasil mendapatkan kabupaten/kota';
      _resultState = ResultState.loaded;
      notifyListeners();
      return true;
    } catch (e) {
      _resultState = ResultState.error;
      message = 'Gagal mendapatkan kabupaten/kota';
      notifyListeners();
      return false;
    }
  }

  Future<bool> getSubdistrict(String idDistrict) async {
    _resultState = ResultState.loading;
    notifyListeners();

    try {
      final responseResult =
          await apiSurpayService.getIndonesiaSubdistrict(idDistrict);
      subdistrictsComplete = parseSubdistricts(responseResult);
      subdistrictsUnique = subdistrictsComplete
          .map((subdistrict) => subdistrict.kecamatan)
          .toSet()
          .toList();
      message = 'Berhasil mendapatkan kecamatan';
      _resultState = ResultState.loaded;
      notifyListeners();
      return true;
    } catch (e) {
      _resultState = ResultState.error;
      message = 'Gagal mendapatkan kecamatan';
      notifyListeners();
      return false;
    }
  }

  Future<bool> getVillage(String nameSubdistrict) async {
    _resultState = ResultState.loading;
    notifyListeners();

    try {
      villages = subdistrictsComplete
          .where((subdistrict) => subdistrict.kecamatan == nameSubdistrict)
          .toList();
      message = 'Berhasil mendapatkan desa/kelurahan';
      _resultState = ResultState.loaded;
      notifyListeners();
      return true;
    } catch (e) {
      _resultState = ResultState.error;
      message = 'Gagal mendapatkan desa/kelurahan';
      notifyListeners();
      return false;
    }
  }
}
