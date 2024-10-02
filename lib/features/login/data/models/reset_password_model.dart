class ResetPasswordModel {
  String? message;
  String? token;
  ResetPasswordModel(this.message, this.token);
  ResetPasswordModel.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    token = json["token"];
  }
}
