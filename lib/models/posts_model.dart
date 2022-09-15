class PostsModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostsModel({this.userId, this.id, this.title, this.body});
  factory PostsModel.fromjson(Map<String, dynamic> json) {
    return PostsModel(
        userId: json['userId'],
        body: json['body'],
        title: json['title'],
        id: json['id']);
  }

  Map<String, dynamic> toJson() =>
      {'userId': userId, 'body': body, 'title': title, 'id': id};
}
