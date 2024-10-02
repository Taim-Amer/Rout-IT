class ForgetPasswordModel {
  String? message;
  ForgetPasswordModel(this.message);
  ForgetPasswordModel.fromJson(Map<String, dynamic> json) {
    message = json["message"];
  }
}
