import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiSurpayService {
  static const String _addressUrl =
      'https://www.niniekkurniairani.my.id/surpay_web/api';

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

    final responseString = await response.stream.bytesToString();
    if (response.statusCode == 200 || response.statusCode == 400) {
      // final responseString = await response.stream.bytesToString();
      final responseJson = jsonDecode(responseString);
      return responseJson;
    } else {
      throw response.statusCode;
    }
  }

  Future updateUserData(String token,
      {String? fullname, String? password, String? referrerCode}) async {
    var headers = {
      'Authorization': 'Bearer $token',
    };
    var request = http.Request('PUT', Uri.parse('$_addressUrl/updateuser.php'));
    request.body = json.encode({
      "nama_lengkap": fullname,
      "password": password,
      "referrer_code": referrerCode,
    });

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

  Future postAnswerSurvey(
    String token,
    String idSurvey,
    String numberSurvey,
    String answer,
    String comment,
  ) async {
    var headers = {
      'Authorization': 'Bearer $token',
    };
    var request =
        http.Request('POST', Uri.parse('$_addressUrl/jawabsurvey.php'));
    request.body = json.encode({
      "idsurvey": idSurvey,
      "nomer": numberSurvey,
      "jawaban": answer,
      "komentar": comment
    });
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

  Future postTarikDana(
    String token,
    String money,
    String bankAccountNumber,
    String bankAccountFullname,
    String bankName,
  ) async {
    var headers = {
      'Authorization': 'Bearer $token',
    };
    var request = http.Request('POST', Uri.parse('$_addressUrl/tarikdana.php'));
    request.body = json.encode({
      "jumlah": money,
      "rekening": bankAccountNumber,
      "namarekening": bankAccountFullname,
      "bank": bankName,
    });

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
    var request =
        http.Request('GET', Uri.parse('$_addressUrl/riwayatdashboard.php'));

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
