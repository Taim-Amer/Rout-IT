class StudentProfileModel {
  String? status;
  Student? student;

  StudentProfileModel({this.status, this.student});

  StudentProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    student =
    json['student'] != null ? Student.fromJson(json['student']) : null;
  }
}

class Student {
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

  Student(
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

  Student.fromJson(Map<String, dynamic> json) {
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
}