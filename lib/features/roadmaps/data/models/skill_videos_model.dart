class SkillVideosModel {
  String? message;
  List<SkillsVideos>? skillsVideos;

  SkillVideosModel({this.message, this.skillsVideos});

  SkillVideosModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['skillsVideos'] != null) {
      skillsVideos = <SkillsVideos>[];
      json['skillsVideos'].forEach((v) {
        skillsVideos!.add(SkillsVideos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    if (skillsVideos != null) {
      data['skillsVideos'] = skillsVideos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SkillsVideos {
  int? id;
  int? roadmapSkillId;
  String? title;
  String? video;
  String? createdAt;
  String? updatedAt;

  static const String defaultVideoUrl =
      "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8";

  SkillsVideos({
    this.id,
    this.roadmapSkillId,
    this.title,
    this.video,
    this.createdAt,
    this.updatedAt,
  });

  SkillsVideos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roadmapSkillId = json['roadmap_skill_id'];
    title = json['title'];
    video =
        json['video'] ?? defaultVideoUrl; // Use default URL if video is null
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['roadmap_skill_id'] = roadmapSkillId;
    data['title'] = title;
    data['video'] = video;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
