class WinnersModel {
  String? status;
  List<Winners>? winners;

  WinnersModel({this.status, this.winners});

  WinnersModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['winners'] != null) {
      winners = <Winners>[];
      json['winners'].forEach((v) {
        winners!.add(new Winners.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.winners != null) {
      data['winners'] = this.winners!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Winners {
  int? id;
  Null? competitionId;
  int? mobileUserId;
  String? projectLink;
  String? createdAt;
  String? updatedAt;
  int? competitorId;
  int? rank;
  String? email;
  String? password;
  int? verify;
  int? completed;
  String? name;
  String? image;
  String? birthDate;
  int? itStudent;
  String? university;
  String? bio;
  String? type;
  Null? rememberToken;

  Winners(
      {this.id,
      this.competitionId,
      this.mobileUserId,
      this.projectLink,
      this.createdAt,
      this.updatedAt,
      this.competitorId,
      this.rank,
      this.email,
      this.password,
      this.verify,
      this.completed,
      this.name,
      this.image,
      this.birthDate,
      this.itStudent,
      this.university,
      this.bio,
      this.type,
      this.rememberToken});

  Winners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    competitionId = json['competition_id'];
    mobileUserId = json['mobile_user_id'];
    projectLink = json['project_link'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    competitorId = json['competitor_id'];
    rank = json['rank'];
    email = json['email'];
    password = json['password'];
    verify = json['verify'];
    completed = json['completed'];
    name = json['name'];
    image = json['image'];
    birthDate = json['birth_date'];
    itStudent = json['it_student'];
    university = json['university'];
    bio = json['bio'];
    type = json['type'];
    rememberToken = json['remember_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['competition_id'] = this.competitionId;
    data['mobile_user_id'] = this.mobileUserId;
    data['project_link'] = this.projectLink;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['competitor_id'] = this.competitorId;
    data['rank'] = this.rank;
    data['email'] = this.email;
    data['password'] = this.password;
    data['verify'] = this.verify;
    data['completed'] = this.completed;
    data['name'] = this.name;
    data['image'] = this.image;
    data['birth_date'] = this.birthDate;
    data['it_student'] = this.itStudent;
    data['university'] = this.university;
    data['bio'] = this.bio;
    data['type'] = this.type;
    data['remember_token'] = this.rememberToken;
    return data;
  }
}