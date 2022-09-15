import 'dart:convert';

import 'package:test_api_app/models/users_model.dart';
import 'package:http/http.dart' as http;

class UserViewModel {
  static String _url = "https://jsonplaceholder.typicode.com";
  UserModel _userModel = UserModel();
  Future showUsers() async {
    try {
      var response = await http.get(Uri.parse("$_url/users"));
      var responeBody = await jsonDecode(response.body) as List;
      List posts = responeBody.map((e) => UserModel.fromJson(e)).toList();
      if (response.statusCode == 200) {
        return posts;
      }
    } catch (e) {
      print("==================$e ===================");
    }
  }

  static Future<http.Response> addUser(String name, String email) async {
    final http.Response response = await http.post(Uri.parse("$_url/users"),
        headers: <String, String>{
          "content-Type": "application/json;charset=UTF-8"
        },
        body: jsonEncode(
          <String, dynamic>{
            "name": name,
            "username": "Kamren",
            "email": email,
            "address": {
              "street": "Skiles Walks",
              "suite": "Suite 351",
              "city": "Roscoeview",
              "zipcode": "33263",
              "geo": {"lat": "-31.8129", "lng": "62.5342"}
            },
            "phone": "(254)954-1289",
            "website": "demarco.info",
            "company": {
              "name": "Keebler LLC",
              "catchPhrase": "User-centric fault-tolerant solution",
              "bs": "revolutionize end-to-end systems"
            }
          },
        ));
    if (response.statusCode == 201) {
      print("${response.body}");
    } else {
      print("${response.statusCode}");
    }
    return response;
  }

  static Future deleteUser(int id) async {
    final http.Response response = await http.delete(
      Uri.parse("$_url/users/$id"),
      headers: <String, String>{
        "content-Type": "application/json;charset=UTF-8"
      },
    );
    if (response.statusCode == 200) {
      print("deleted successfully !!!");
      return response;
    } else {
      print("${response.statusCode}");
    }
  }

  static Future<http.Response> updateUser(
      String name, String email, int id) async {
    final http.Response response = await http.put(
        Uri.parse("$_url/users/${id}"),
        headers: <String, String>{
          "content-Type": "application/json;charset=UTF-8"
        },
        body: jsonEncode(
          <String, dynamic>{
            "name": name,
            "username": "Kamren",
            "email": email,
            "address": {
              "street": "Skiles Walks",
              "suite": "Suite 351",
              "city": "Roscoeview",
              "zipcode": "33263",
              "geo": {"lat": "-31.8129", "lng": "62.5342"}
            },
            "phone": "(254)954-1289",
            "website": "demarco.info",
            "company": {
              "name": "Keebler LLC",
              "catchPhrase": "User-centric fault-tolerant solution",
              "bs": "revolutionize end-to-end systems"
            }
          },
        ));
    if (response.statusCode == 200) {
      print("${response.body}");
    } else {
      print("${response.statusCode}");
    }
    return response;
  }
}
