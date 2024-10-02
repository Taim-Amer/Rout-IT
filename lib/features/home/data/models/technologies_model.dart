class TechnologiesModel {
  int? id;
  int? technologyCategoryId;
  String? name;
  String? nameAr;
  String? description;
  String? descriptionAr;
  String? image;
  String? videos;
  String? createdAt;
  String? updatedAt;

  TechnologiesModel({
    this.id,
    this.technologyCategoryId,
    this.name,
    this.nameAr,
    this.description,
    this.descriptionAr,
    this.image,
    this.videos,
    this.createdAt,
    this.updatedAt,
  });

  TechnologiesModel.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['technology_category_id'] = this.technologyCategoryId;
    data['name'] = this.name;
    data['name_ar'] = this.nameAr;
    data['description'] = this.description;
    data['description_ar'] = this.descriptionAr;
    data['image'] = this.image;
    data['videos'] = this.videos;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
