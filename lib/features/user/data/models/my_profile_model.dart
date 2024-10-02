class MyProfile {
  String? status;
  User? user;

  MyProfile({this.status, this.user});

  MyProfile.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? email;
  int? verify;
  int? completed;
  String? name;
  String? image;
  String? birthDate;
  int? itStudent;
  String? university;
  String? bio;
  String? type;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.email,
      this.verify,
      this.completed,
      this.name,
      this.image,
      this.birthDate,
      this.itStudent,
      this.university,
      this.bio,
      this.type,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    verify = json['verify'];
    completed = json['completed'];
    name = json['name'];
    image = json['image'];
    birthDate = json['birth_date'];
    itStudent = json['it_student'];
    university = json['university'];
    bio = json['bio'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['verify'] = this.verify;
    data['completed'] = this.completed;
    data['name'] = this.name;
    data['image'] = this.image;
    data['birth_date'] = this.birthDate;
    data['it_student'] = this.itStudent;
    data['university'] = this.university;
    data['bio'] = this.bio;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}