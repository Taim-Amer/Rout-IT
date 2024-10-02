class SkillsArticlesModel {
  String? message;
  List<SkillsArticles>? skillsArticles;

  SkillsArticlesModel({this.message, this.skillsArticles});

  SkillsArticlesModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['skillsArticles'] != null) {
      skillsArticles = <SkillsArticles>[];
      json['skillsArticles'].forEach((v) {
        skillsArticles!.add(new SkillsArticles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.skillsArticles != null) {
      data['skillsArticles'] =
          this.skillsArticles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SkillsArticles {
  int? id;
  int? roadmapSkillId;
  String? title;
  String? createdAt;
  String? updatedAt;

  SkillsArticles(
      {this.id,
      this.roadmapSkillId,
      this.title,
      this.createdAt,
      this.updatedAt});

  SkillsArticles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roadmapSkillId = json['roadmap_skill_id'];
    title = json['title'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['roadmap_skill_id'] = this.roadmapSkillId;
    data['title'] = this.title;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
