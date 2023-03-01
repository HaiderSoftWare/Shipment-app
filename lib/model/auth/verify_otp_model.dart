class VerifyOTPModel {
  bool? success;

  String? message;

  VerifyOTPModel({this.success, this.message});

  VerifyOTPModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];

    message = json['message'];
  }
}
