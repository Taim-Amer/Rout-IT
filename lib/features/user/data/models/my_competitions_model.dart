class MyCompetitionModel {
  String? status;
  List<Competitions>? competitions;

  MyCompetitionModel({this.status, this.competitions});

  MyCompetitionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['competitions'] != null) {
      competitions = <Competitions>[];
      json['competitions'].forEach((v) {
        competitions!.add(new Competitions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.competitions != null) {
      data['competitions'] = this.competitions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Competitions {
  int? id;
  String? name;
  int? companyId;
  String? startDate;
  String? endDate;
  String? description;
  String? image;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Competitions(
      {this.id,
      this.name,
      this.companyId,
      this.startDate,
      this.endDate,
      this.description,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Competitions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    companyId = json['company_id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    description = json['description'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['company_id'] = this.companyId;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['description'] = this.description;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? mobileUserId;
  int? competitionId;
  String? projectLink;

  Pivot({this.mobileUserId, this.competitionId, this.projectLink});

  Pivot.fromJson(Map<String, dynamic> json) {
    mobileUserId = json['mobile_user_id'];
    competitionId = json['competition_id'];
    projectLink = json['project_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile_user_id'] = this.mobileUserId;
    data['competition_id'] = this.competitionId;
    data['project_link'] = this.projectLink;
    return data;
  }
}