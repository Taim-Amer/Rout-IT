class ToggleFollowTechnologyModel {
  String? status;
  String? message;

  ToggleFollowTechnologyModel({this.status, this.message});

  ToggleFollowTechnologyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}