class Competitor {
  int? id;
  int? competitionId;
  int? mobileUserId;
  String? projectLink;
  String? createdAt;
  String? updatedAt;
  String? competitorName;
  String? competitorImage;

  Competitor(
      {this.id,
      this.competitionId,
      this.mobileUserId,
      this.projectLink,
      this.createdAt,
      this.updatedAt,
      this.competitorName,
      this.competitorImage});

  Competitor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    competitionId = json['competition_id'];
    mobileUserId = json['mobile_user_id'];
    projectLink = json['project_link'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    competitorName = json['competitor_name'];
    competitorImage = json['competitor_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['competition_id'] = this.competitionId;
    data['mobile_user_id'] = this.mobileUserId;
    data['project_link'] = this.projectLink;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['competitor_name'] = this.competitorName;
    data['competitor_image'] = this.competitorImage;
    return data;
  }
}