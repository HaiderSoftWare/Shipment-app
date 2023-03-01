class ForgetPasswordModel {
  bool? success;
  Data? data;
  String? message;

  ForgetPasswordModel({this.success, this.data, this.message});

  ForgetPasswordModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }
}

class Data {
  String? otp;

  Data({this.otp});

  Data.fromJson(Map<String, dynamic> json) {
    otp = json['otp'];
  }
}
