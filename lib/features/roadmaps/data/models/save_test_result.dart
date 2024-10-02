class SaveTestResultModel {
  String? status;
  String? message;

  SaveTestResultModel({this.status, this.message});

  SaveTestResultModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}