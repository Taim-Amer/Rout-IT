class CompanyProfileModel {
  String? status;
  Company? company;

  CompanyProfileModel({this.status, this.company});

  CompanyProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    company =
        json['company'] != null ? new Company.fromJson(json['company']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    return data;
  }
}

class Company {
  int? id;
  String? name;
  String? email;
  String? password;
  String? location;
  String? image;
  String? description;
  String? createdAt;
  String? updatedAt;
  List<Competitions>? competitions;

  Company(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.location,
      this.image,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.competitions});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    location = json['location'];
    image = json['image'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['competitions'] != null) {
      competitions = <Competitions>[];
      json['competitions'].forEach((v) {
        competitions!.add(new Competitions.fromJson(v));
      });
    }
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
    if (this.competitions != null) {
      data['competitions'] = this.competitions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Competitions {
  int? id;
  String? name;
  int? companyId;
  String? startDate;
  String? endDate;
  String? description;
  String? image;
  String? createdAt;
  String? updatedAt;

  Competitions(
      {this.id,
      this.name,
      this.companyId,
      this.startDate,
      this.endDate,
      this.description,
      this.image,
      this.createdAt,
      this.updatedAt});

  Competitions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    companyId = json['company_id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    description = json['description'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['company_id'] = this.companyId;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['description'] = this.description;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}