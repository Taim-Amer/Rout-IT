class LoginModel {
  Data? data;

  LoginModel({this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  String? token;
  String? name;
  String? message;
  int? userId;

  Data({this.token, this.name, this.message, this.userId});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    name = json['name'];
    message = json['message'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['name'] = this.name;
    data['message'] = this.message;
    return data;
  }
}
