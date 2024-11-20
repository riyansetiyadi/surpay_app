class ApiResponseModel {
  final bool error;
  final String message;

  ApiResponseModel({
    required this.error,
    required this.message,
  });

  // Factory method untuk membuat instance dari JSON
  factory ApiResponseModel.fromJson(Map<String, dynamic> json) {
    return ApiResponseModel(
      error: json['error'] as bool,
      message: json['message'] as String,
    );
  }

  // Metode untuk mengonversi instance menjadi JSON
  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'message': message,
    };
  }
}
