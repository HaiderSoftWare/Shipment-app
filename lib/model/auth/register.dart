class RegisterModel {
  bool? success;
  Data? data;
  String? message;

  RegisterModel({this.success, this.data, this.message});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }
}

class Data {
  int? id;
  String? phone;
  String? email;
  String? otp;

  Data({this.id, this.phone, this.email, this.otp});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    email = json['email'];
    otp = json['otp'];
  }
}
