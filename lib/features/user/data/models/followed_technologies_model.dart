class FollowedTechnologiesModel {
  String? status;
  List<FollowedTechnologies>? followedTechnologies;

  FollowedTechnologiesModel({this.status, this.followedTechnologies});

  FollowedTechnologiesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['followedTechnologies'] != null) {
      followedTechnologies = <FollowedTechnologies>[];
      json['followedTechnologies'].forEach((v) {
        followedTechnologies!.add(FollowedTechnologies.fromJson(v));
      });
    }
  }

}

class FollowedTechnologies {
  int? id;
  int? technologyCategoryId;
  String? name;
  String? nameAr;
  String? description;
  String? descriptionAr;
  String? image;
  Null? videos;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  FollowedTechnologies(
      {this.id,
        this.technologyCategoryId,
        this.name,
        this.nameAr,
        this.description,
        this.descriptionAr,
        this.image,
        this.videos,
        this.createdAt,
        this.updatedAt,
        this.pivot});

  FollowedTechnologies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    technologyCategoryId = json['technology_category_id'];
    name = json['name'];
    nameAr = json['name_ar'];
    description = json['description'];
    descriptionAr = json['description_ar'];
    image = json['image'];
    videos = json['videos'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }

}

class Pivot {
  int? mobileUserId;
  int? technologyId;

  Pivot({this.mobileUserId, this.technologyId});

  Pivot.fromJson(Map<String, dynamic> json) {
    mobileUserId = json['mobile_user_id'];
    technologyId = json['technology_id'];
  }

}