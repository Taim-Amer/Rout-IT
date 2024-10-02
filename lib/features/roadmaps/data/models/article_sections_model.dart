class ArticleSectionsModel {
  String? message;
  List<ArticleSections>? articleSections;

  ArticleSectionsModel({this.message, this.articleSections});

  ArticleSectionsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['articleSections'] != null) {
      articleSections = <ArticleSections>[];
      json['articleSections'].forEach((v) {
        articleSections!.add(new ArticleSections.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.articleSections != null) {
      data['articleSections'] =
          this.articleSections!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ArticleSections {
  int? id;
  int? articleId;
  String? title;
  String? content;
  String? image;
  String? createdAt;
  String? updatedAt;

  ArticleSections(
      {this.id,
      this.articleId,
      this.title,
      this.content,
      this.image,
      this.createdAt,
      this.updatedAt});

  ArticleSections.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    articleId = json['article_id'];
    title = json['title'];
    content = json['content'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['article_id'] = this.articleId;
    data['title'] = this.title;
    data['content'] = this.content;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}