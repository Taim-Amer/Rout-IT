class RoadMapRankingModel {
  List<Ranking>? ranking;

  RoadMapRankingModel({this.ranking});

  RoadMapRankingModel.fromJson(Map<String, dynamic> json) {
    if (json['ranking'] != null) {
      ranking = <Ranking>[];
      json['ranking'].forEach((v) {
        ranking!.add(new Ranking.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ranking != null) {
      data['ranking'] = this.ranking!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ranking {
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
  Pivot? pivot;

  Ranking(
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
      this.updatedAt,
      this.pivot});

  Ranking.fromJson(Map<String, dynamic> json) {
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
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
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
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? roadmapId;
  int? mobileUserId;
  int? userXP;

  Pivot({this.roadmapId, this.mobileUserId, this.userXP});

  Pivot.fromJson(Map<String, dynamic> json) {
    roadmapId = json['roadmap_id'];
    mobileUserId = json['mobile_user_id'];
    userXP = json['userXP'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roadmap_id'] = this.roadmapId;
    data['mobile_user_id'] = this.mobileUserId;
    data['userXP'] = this.userXP;
    return data;
  }
}