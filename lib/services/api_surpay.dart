import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiSurpayService {
  static const String _addressUrl = 'http://10.0.2.2/surpay_web/api';

  Future login(String phoneNumber, String password) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('$_addressUrl/login.php'));
    request.fields.addAll({'nohp': phoneNumber, 'password': password});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 400) {
      final responseString = await response.stream.bytesToString();
      final responseJson = jsonDecode(responseString);
      return responseJson;
    } else {
      throw response.reasonPhrase.toString();
    }
  }

  Future register(
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
    var request =
        http.MultipartRequest('POST', Uri.parse('$_addressUrl/register.php'));
    request.fields.addAll({
      'nohp': phoneNumber,
      'password': password,
      'nama_lengkap': fullname,
      'tahun_lahir': birthYear,
      'jenis_kelamin': gender,
      'provinsi': province,
      'kota': district,
      'kecamatan': subdistrict,
      'kelurahan': village,
      'kode_pos': postalCode,
      'alamat': address
    });

    http.StreamedResponse response = await request.send();

    final responseString = await response.stream.bytesToString();
    final responseJson = jsonDecode(responseString);
    return responseJson;
  }

  Future getUserData(
    String token,
  ) async {
    var headers = {
      'Authorization': 'Bearer $token',
    };
    var request =
        http.Request('GET', Uri.parse('$_addressUrl/userprofile.php'));

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 400) {
      final responseString = await response.stream.bytesToString();
      final responseJson = jsonDecode(responseString);
      return responseJson;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future updateUserData(
    String token, {
    String? phoneNumber,
    String? fullname,
    String? password,
  }) async {
    var headers = {
      'Authorization': 'Bearer $token',
    };
    var request =
        http.Request('GET', Uri.parse('$_addressUrl/userprofile.php'));

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 400) {
      final responseString = await response.stream.bytesToString();
      final responseJson = jsonDecode(responseString);
      return responseJson;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future getAllSurvey(
    String token,
  ) async {
    var headers = {
      'Authorization': 'Bearer $token',
    };
    var request = http.Request('GET', Uri.parse('$_addressUrl/listsurvey.php'));

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 400) {
      final responseString = await response.stream.bytesToString();
      final responseJson = jsonDecode(responseString);
      return responseJson;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future getDetailSurvey(
    String token,
    String id,
  ) async {
    var headers = {
      'Authorization': 'Bearer $token',
    };
    var request =
        http.Request('GET', Uri.parse('$_addressUrl/detailsurvey.php/$id'));

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 400) {
      final responseString = await response.stream.bytesToString();
      final responseJson = jsonDecode(responseString);
      return responseJson;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future getListHadiah(
    String token,
  ) async {
    var headers = {
      'Authorization': 'Bearer $token',
    };
    var request = http.Request('GET', Uri.parse('$_addressUrl/listhadiah.php'));

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 400) {
      final responseString = await response.stream.bytesToString();
      final responseJson = jsonDecode(responseString);
      return responseJson;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future getPenarikan(
    String token,
  ) async {
    var headers = {
      'Authorization': 'Bearer $token',
    };
    var request = http.Request('GET', Uri.parse('$_addressUrl/penarikan.php'));

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 400) {
      final responseString = await response.stream.bytesToString();
      final responseJson = jsonDecode(responseString);
      return responseJson;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future getRiwayatDashboard(
    String token,
  ) async {
    var headers = {
      'Authorization': 'Bearer $token',
    };
    var request = http.Request('GET', Uri.parse('$_addressUrl/riwayatdashboard.php'));

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 400) {
      final responseString = await response.stream.bytesToString();
      final responseJson = jsonDecode(responseString);
      return responseJson;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future getTarikDana(
    String token,
  ) async {
    var headers = {
      'Authorization': 'Bearer $token',
    };
    var request = http.Request('POST', Uri.parse('$_addressUrl/.php'));

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 400) {
      final responseString = await response.stream.bytesToString();
      final responseJson = jsonDecode(responseString);
      return responseJson;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
