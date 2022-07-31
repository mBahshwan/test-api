import 'package:flutter/material.dart';
import 'package:test_api_app/consts/constant.dart';
import 'package:test_api_app/view_models/user_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  Constant constant = Constant();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: "${constant.title}"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UserViewModel _userViewModel = UserViewModel();
  @override
  void initState() {
    _userViewModel.fetchAllData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.builder(
          itemCount: _userViewModel.posts.length,
          itemBuilder: (context, index) =>
              Text("${_userViewModel.posts[index].title}"),
        ));
  }
}
