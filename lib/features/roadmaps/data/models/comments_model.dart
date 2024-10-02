class CommentsModel {
  String? status;
  List<Comments>? comments;

  CommentsModel({this.status, this.comments});

  CommentsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Comments {
  int? id;
  int? roadmapSkillId;
  String? comment;
  Null? createdAt;
  Null? updatedAt;
  int? mobileUserId;
  String? birthDate;
  int? itStudent;
  String? university;
  String? name;
  String? image;
  String? bio;
  int? expertId;

  Comments(
      {this.id,
      this.roadmapSkillId,
      this.comment,
      this.createdAt,
      this.updatedAt,
      this.mobileUserId,
      this.birthDate,
      this.itStudent,
      this.university,
      this.name,
      this.image,
      this.bio,
      this.expertId});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roadmapSkillId = json['roadmap_skill_id'];
    comment = json['comment'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    mobileUserId = json['mobile_user_id'];
    birthDate = json['birth_date'];
    itStudent = json['it_student'];
    university = json['university'];
    name = json['name'];
    image = json['image'];
    bio = json['bio'];
    expertId = json['expert_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['roadmap_skill_id'] = this.roadmapSkillId;
    data['comment'] = this.comment;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['mobile_user_id'] = this.mobileUserId;
    data['birth_date'] = this.birthDate;
    data['it_student'] = this.itStudent;
    data['university'] = this.university;
    data['name'] = this.name;
    data['image'] = this.image;
    data['bio'] = this.bio;
    data['expert_id'] = this.expertId;
    return data;
  }
}