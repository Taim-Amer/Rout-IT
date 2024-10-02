class RoadMapSearchModel {
  String? message;
  List<Roadmaps>? roadmaps;

  RoadMapSearchModel({this.message, this.roadmaps});

  RoadMapSearchModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['roadmaps'] != null) {
      roadmaps = <Roadmaps>[];
      json['roadmaps'].forEach((v) {
        roadmaps!.add(new Roadmaps.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.roadmaps != null) {
      data['roadmaps'] = this.roadmaps!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Roadmaps {
  int? id;
  int? expertId;
  int? technologyLevelId;
  String? title;
  String? titleAr;
  String? description;
  String? descriptionAr;
  String? cover;
  Null? introductoryVideo;
  Null? targetCv;
  String? createdAt;
  String? updatedAt;

  Roadmaps(
      {this.id,
      this.expertId,
      this.technologyLevelId,
      this.title,
      this.titleAr,
      this.description,
      this.descriptionAr,
      this.cover,
      this.introductoryVideo,
      this.targetCv,
      this.createdAt,
      this.updatedAt});

  Roadmaps.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    expertId = json['expert_id'];
    technologyLevelId = json['technology_level_id'];
    title = json['title'];
    titleAr = json['title_ar'];
    description = json['description'];
    descriptionAr = json['description_ar'];
    cover = json['cover'];
    introductoryVideo = json['introductory_video'];
    targetCv = json['target_cv'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['expert_id'] = this.expertId;
    data['technology_level_id'] = this.technologyLevelId;
    data['title'] = this.title;
    data['title_ar'] = this.titleAr;
    data['description'] = this.description;
    data['description_ar'] = this.descriptionAr;
    data['cover'] = this.cover;
    data['introductory_video'] = this.introductoryVideo;
    data['target_cv'] = this.targetCv;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}