class FollowedCompaniesModel {
  String? status;
  List<FollowedCompanies>? followedCompanies;

  FollowedCompaniesModel({this.status, this.followedCompanies});

  FollowedCompaniesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['followedCompanies'] != null) {
      followedCompanies = <FollowedCompanies>[];
      json['followedCompanies'].forEach((v) {
        followedCompanies!.add(new FollowedCompanies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.followedCompanies != null) {
      data['followedCompanies'] =
          this.followedCompanies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FollowedCompanies {
  int? id;
  String? name;
  String? email;
  String? password;
  String? location;
  String? image;
  String? description;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  FollowedCompanies(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.location,
      this.image,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  FollowedCompanies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    location = json['location'];
    image = json['image'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['location'] = this.location;
    data['image'] = this.image;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? mobileUserId;
  int? companyId;

  Pivot({this.mobileUserId, this.companyId});

  Pivot.fromJson(Map<String, dynamic> json) {
    mobileUserId = json['mobile_user_id'];
    companyId = json['company_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile_user_id'] = this.mobileUserId;
    data['company_id'] = this.companyId;
    return data;
  }
}
