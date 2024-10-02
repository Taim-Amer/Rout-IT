class GeneralSearchModel {
  String? status;
  Result? result;

  GeneralSearchModel({this.status, this.result});

  GeneralSearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  List<Students>? students;
  List<Experts>? experts;
  List<Companies>? companies;

  Result({this.students, this.experts, this.companies});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['students'] != null) {
      students = <Students>[];
      json['students'].forEach((v) {
        students!.add(new Students.fromJson(v));
      });
    }
    if (json['experts'] != null) {
      experts = <Experts>[];
      json['experts'].forEach((v) {
        experts!.add(new Experts.fromJson(v));
      });
    }
    if (json['companies'] != null) {
      companies = <Companies>[];
      json['companies'].forEach((v) {
        companies!.add(new Companies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.students != null) {
      data['students'] = this.students!.map((v) => v.toJson()).toList();
    }
    if (this.experts != null) {
      data['experts'] = this.experts!.map((v) => v.toJson()).toList();
    }
    if (this.companies != null) {
      data['companies'] = this.companies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Students {
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

  Students(
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

  Students.fromJson(Map<String, dynamic> json) {
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

class Experts {
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

  Experts(
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

  Experts.fromJson(Map<String, dynamic> json) {
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['password'] = this.password;
    data['image'] = this.image;
    data['bio'] = this.bio;
    data['type'] = this.type;
    data['remember_token'] = this.rememberToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Companies {
  int? id;
  String? name;
  String? email;
  String? password;
  String? location;
  String? image;
  String? description;
  String? createdAt;
  String? updatedAt;

  Companies(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.location,
      this.image,
      this.description,
      this.createdAt,
      this.updatedAt});

  Companies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    location = json['location'];
    image = json['image'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['location'] = this.location;
    data['image'] = this.image;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}