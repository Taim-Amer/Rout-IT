class ToggleFollowExpertModel {
  String? status;
  String? message;

  ToggleFollowExpertModel({this.status, this.message});

  ToggleFollowExpertModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}