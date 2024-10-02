
class ResetPasswordCodeModel {
  String? message;
  ResetPasswordCodeModel(this.message);
  ResetPasswordCodeModel.fromJson(Map<String, dynamic> json) {
    message = json["message"];
  }
}
