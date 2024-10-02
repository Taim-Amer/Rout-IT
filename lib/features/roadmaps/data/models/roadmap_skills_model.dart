class RoadMapSkillsModel {
  int? id;
  int? roadMapId;
  String? title;
  String? createdAt;
  String? updatedAt;

  RoadMapSkillsModel(
      {this.id, this.roadMapId, this.title, this.createdAt, this.updatedAt});

  RoadMapSkillsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roadMapId = json['roadmap_id'];
    title = json['title'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
