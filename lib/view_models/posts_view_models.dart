import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_api_app/models/posts_model.dart';
import 'package:test_api_app/models/users_model.dart';

class PostsViewModel {
  String _url = "https://jsonplaceholder.typicode.com";
  Future<List<PostsModel>?> fetchAllData(int userId) async {
    List<PostsModel> posts;

    http.Response response = await http.get(Uri.parse("$_url/posts"));
    var responeBody = await jsonDecode(response.body) as List;
    posts = responeBody.map((e) => PostsModel.fromjson(e)).toList();
    print("${response.statusCode}");
    return response.statusCode == 200
        ? posts.where((element) => element.userId == userId).toList()
        : null;
  }

  Future<PostsModel> fetchDataById(int id) async {
    var response = await http.get(Uri.parse("$_url/posts"));
    var responeBody = await jsonDecode(response.body) as List;
    List<PostsModel> posts =
        responeBody.map((e) => PostsModel.fromjson(e)).toList();

    return posts.firstWhere((element) => element.id == id);
  }
}
