class ExpertProfileModel {
  String? status;
  Student? student;

  ExpertProfileModel({this.status, this.student});

  ExpertProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    student =
    json['student'] != null ? Student.fromJson(json['student']) : null;
  }
}

class Student {
  int? id;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  String? password;
  String? image;
  String? bio;
  String? type;
  Null? rememberToken;
  String? createdAt;
  String? updatedAt;

  Student(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.password,
        this.image,
        this.bio,
        this.type,
        this.rememberToken,
        this.createdAt,
        this.updatedAt});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    password = json['password'];
    image = json['image'];
    bio = json['bio'];
    type = json['type'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}