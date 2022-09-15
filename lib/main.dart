import 'package:flutter/material.dart';
import 'package:test_api_app/models/users_model.dart';
import 'package:test_api_app/view_models/user_view_model.dart';
import 'package:test_api_app/views/viewData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ViewData(),
    );
  }
}
