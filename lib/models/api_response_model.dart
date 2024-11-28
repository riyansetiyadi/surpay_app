class ApiResponseModel {
  final bool error;
  final String message;
  final int? responsecode;

  ApiResponseModel({
    required this.error,
    required this.message,
    this.responsecode,
  });

  // Factory method untuk membuat instance dari JSON
  factory ApiResponseModel.fromJson(Map<String, dynamic> json) {
    return ApiResponseModel(
      error: json['error'] as bool,
      message: json['message'] as String,
      responsecode: json['responsecode'] as int?,
    );
  }

  // Metode untuk mengonversi instance menjadi JSON
  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'message': message,
      'responsecode': responsecode,
    };
  }
}
