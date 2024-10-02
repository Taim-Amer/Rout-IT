
class LevelModel {
  int? id;
  String? level;
  int? technologyId;
  String? createdAt;
  String? updatedAt;

  LevelModel(
      {this.id, this.level, this.technologyId, this.createdAt, this.updatedAt});

  LevelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    level = json['level'];
    technologyId = json['technology_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}