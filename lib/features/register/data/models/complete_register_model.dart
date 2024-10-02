
class CompleteRegisterModel {
  String? message;
  CompleteRegisterModel({required this.message});
  CompleteRegisterModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}
