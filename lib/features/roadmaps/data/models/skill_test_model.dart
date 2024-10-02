class SkillTestModel {
  String? status;
  Result? result;

  SkillTestModel({this.status, this.result});

  SkillTestModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class Result {
  int? totalXp;
  List<Questions>? questions;

  Result({this.totalXp, this.questions});

  Result.fromJson(Map<String, dynamic> json) {
    totalXp = json['total_xp'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['total_xp'] = totalXp;
    if (questions != null) {
      data['questions'] = questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  int? id;
  int? testId;
  String? question;
  String? option1;
  String? option2;
  String? option3;
  String? option4;
  String? option5;
  int? correctOption;
  int? xp;
  String? createdAt;
  String? updatedAt;

  Questions(
      {this.id,
      this.testId,
      this.question,
      this.option1,
      this.option2,
      this.option3,
      this.option4,
      this.option5,
      this.correctOption,
      this.xp,
      this.createdAt,
      this.updatedAt});

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    testId = json['test_id'];
    question = json['question'];
    option1 = json['option1'];
    option2 = json['option2'];
    option3 = json['option3'];
    option4 = json['option4'];
    option5 = json['option5'];
    correctOption = json['correct_option'];
    xp = json['xp'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['test_id'] = testId;
    data['question'] = question;
    data['option1'] = option1;
    data['option2'] = option2;
    data['option3'] = option3;
    data['option4'] = option4;
    data['option5'] = option5;
    data['correct_option'] = correctOption;
    data['xp'] = xp;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

// ignore: must_be_immutable
