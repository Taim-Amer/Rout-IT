class TechnologyCategoryModel {
  int? id;
  String? name;
  String? nameAr;
  String? description;
  String? descriptionAr;
  String? image;
  String? createdAt;
  String? updatedAt;

  TechnologyCategoryModel(
      {this.id,
      this.name,
      this.nameAr,
      this.description,
      this.descriptionAr,
      this.image,
      this.createdAt,
      this.updatedAt});

  TechnologyCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    description = json['description'];
    descriptionAr = json['description_ar'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
