class FollowedExpertsModel {
  String? status;
  List<FollowedExperts>? followedExperts;

  FollowedExpertsModel({this.status, this.followedExperts});

  FollowedExpertsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['followedExperts'] != null) {
      followedExperts = <FollowedExperts>[];
      json['followedExperts'].forEach((v) {
        followedExperts!.add(FollowedExperts.fromJson(v));
      });
    }
  }
}

class FollowedExperts {
  int? id;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  String? password;
  String? image;
  String? bio;
  String? type;
  Null? rememberToken;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  FollowedExperts(
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
        this.updatedAt,
        this.pivot});

  FollowedExperts.fromJson(Map<String, dynamic> json) {
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
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }
}

class Pivot {
  int? mobileUserId;
  int? expertId;

  Pivot({this.mobileUserId, this.expertId});

  Pivot.fromJson(Map<String, dynamic> json) {
    mobileUserId = json['mobile_user_id'];
    expertId = json['expert_id'];
  }
}