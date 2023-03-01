class ResetPasswordModel {
  bool? success;
  List? data;
  String? message;

  ResetPasswordModel({this.success, this.data, this.message});

  ResetPasswordModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'];
    message = json['message'];
  }
}
