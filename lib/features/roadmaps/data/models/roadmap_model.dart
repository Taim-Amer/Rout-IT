class RoadMapModel {
  int? id;
  int? expertId;
  int? technologyLevelId;
  String? title;
  String? titleAr;
  String? description;
  String? descriptionAr;
  String? cover;
  String? introductoryVideo;
  String? targetCv;
  String? createdAt;
  String? updatedAt;
  Expert? expert;

  RoadMapModel(
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
      this.updatedAt,
      this.expert});

  RoadMapModel.fromJson(Map<String, dynamic> json) {
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
    expert =
        json['expert'] != null ? new Expert.fromJson(json['expert']) : null;
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
    if (this.expert != null) {
      data['expert'] = this.expert!.toJson();
    }
    return data;
  }
}

class Expert {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? password;
  String? image;
  String? bio;
  String? type;
  String? rememberToken;
  String? createdAt;
  String? updatedAt;

  Expert(
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

  Expert.fromJson(Map<String, dynamic> json) {
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