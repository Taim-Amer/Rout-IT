class ToggleFollowCompanyModel {
  String? status;
  String? message;

  ToggleFollowCompanyModel({this.status, this.message});

  ToggleFollowCompanyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}