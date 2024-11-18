import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiSurpayService {
  static const String _addressUrl = 'http://10.0.2.2/surpay_web/api';

  Future login(String phoneNumber, String password) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('$_addressUrl/login.php'));
    request.fields.addAll({'nohp': phoneNumber, 'password': password});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseString = await response.stream.bytesToString();
      final responseJson = jsonDecode(responseString);
      return responseJson;
    } else {
      throw Exception('Nomor hp atau password salah');
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

    // if (response.statusCode == 200) {
    final responseString = await response.stream.bytesToString();
    final responseJson = jsonDecode(responseString);
    print(responseJson);
    return responseJson;
    // } else {
    //   throw Exception('Gagal register');
    // }
  }

  Future getIndonesiaDistrict(String provinceId) async {
    var request = http.MultipartRequest(
      'GET',
      Uri.parse("$_addressUrl/list_kotakab/$provinceId.json"),
    );

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final responseString = await response.stream.bytesToString();
      final responseJson = jsonDecode(responseString);
      return responseJson;
    } else {
      throw Exception('Failed to fetch city');
    }
  }

  Future getIndonesiaSubdistrict(String cityId) async {
    var request = http.MultipartRequest(
      'GET',
      Uri.parse("$_addressUrl/kota_kab/$cityId.json"),
    );

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final responseString = await response.stream.bytesToString();
      final responseJson = jsonDecode(responseString);
      return responseJson;
    } else {
      throw Exception('Failed to fetch city');
    }
  }
}
