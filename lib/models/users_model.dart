class UserModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  UserModel({this.userId, this.id, this.title, this.body});
  UserModel.fromjson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
}
