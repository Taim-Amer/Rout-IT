class VerificationCodeModel {
  String? message;
  VerificationCodeModel({this.message});
  VerificationCodeModel.fromJson(Map<String, dynamic> json) {
    message = json["message"];
  }
}
