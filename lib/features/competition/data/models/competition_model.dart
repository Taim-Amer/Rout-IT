class Competitio {
  String? status;
  List<Competitions>? competitions;

  Competitio({this.status, this.competitions});

  Competitio.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['competitions'] != null) {
      competitions = <Competitions>[];
      json['competitions'].forEach((v) {
        competitions!.add(new Competitions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
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
  String? companyImage;
  String? companyName;
  bool? isFinished;

  Competitions(
      {this.id,
      this.name,
      this.companyId,
      this.startDate,
      this.endDate,
      this.description,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.companyImage,
      this.companyName,
      this.isFinished});

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
    companyImage = json['company_image'];
    companyName = json['company_name'];
    isFinished = json['isFinished'];
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
    data['company_image'] = this.companyImage;
    data['company_name'] = this.companyName;
    data['isFinished'] = this.isFinished;
    return data;
  }
}