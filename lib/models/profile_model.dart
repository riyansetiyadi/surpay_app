class ProfileModel {
  final String? token;
  final String? id;
  final String? phoneNumber;
  final String? fullname;
  final String? gender;
  final String? birthYear;
  final String? province;
  final String? district;
  final String? subdistrict;
  final String? village;
  final String? postalCode;
  final String? address;

  ProfileModel({
    this.token,
    this.id,
    this.fullname,
    this.birthYear,
    this.gender,
    this.phoneNumber,
    this.province,
    this.district,
    this.subdistrict,
    this.village,
    this.postalCode,
    this.address,
  });

  factory ProfileModel.fromApiJson(Map<String, dynamic> json, {String? token}) {
    return ProfileModel(
      token: token ?? json['data']['uniq_code'],
      id: json['data']['iduser'],
      phoneNumber: json['data']['nohp'],
      fullname: json['data']['nama_lengkap'],
      gender: json['data']['kelamin'],
      birthYear: json['data']['lahir'],
      province: json['data']['provinsi'],
      district: json['data']['kota'],
      subdistrict: json['data']['kecamatan'],
      village: json['data']['kelurahan'],
      postalCode: json['data']['kode_pos'],
      address: json['data']['alamat'],
    );
  }

  factory ProfileModel.fromLocalJson(Map<String, dynamic> json) {
    return ProfileModel(
      token: json['token'],
      fullname: json['fullname'],
      gender: json['gender'],
      phoneNumber: json['phoneNumber'],
      province: json['province'],
      district: json['city'],
      subdistrict: json['subdistrict'],
      village: json['village'],
      postalCode: json['postalCode'],
      address: json['address'],
    );
  }

  // Method to convert a Profile object to JSON
  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'fullname': fullname,
      'gender': gender,
      'phoneNumber': phoneNumber,
      'province': province,
      'city': district,
      'subdistrict': subdistrict,
      'village': village,
      'postalCode': postalCode,
      'address': address,
    };
  }
}