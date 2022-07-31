import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_api_app/consts/constant.dart';
import 'package:test_api_app/models/users_model.dart';

class UserViewModel {
  List<UserModel> posts = [];
  Constant constant = Constant();
  Future fetchAllData() async {
    try {
      var response = await http.get(Uri.parse(constant.url));
      var responeBody = await jsonDecode(response.body) as List;
      posts = responeBody.map((e) => UserModel.fromjson(e)).toList();
      if (response.statusCode == 200) {
        return posts;
      }
    } catch (e) {
      print("==================$e ===================");
    }
  }
}
