import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:test_api_app/models/users_model.dart';
import 'package:test_api_app/view_models/user_view_model.dart';
import 'package:test_api_app/views/viewData.dart';

class AddOrEditeUser extends StatefulWidget {
  final String? name;
  final String? email;
  final int? id;
  AddOrEditeUser({Key? key, l, this.name, this.email, this.id})
      : super(key: key);

  @override
  State<AddOrEditeUser> createState() => _AddOrEditeUserState();
}

class _AddOrEditeUserState extends State<AddOrEditeUser> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  void initState() {
    name.text = widget.name ?? "";
    email.text = widget.email ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Here you can add user"),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: name.text,
                  labelText: "Enter Your name"),
              controller: name,
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      gapPadding: 4, borderRadius: BorderRadius.circular(20)),
                  hintText: email.text,
                  labelText: "Enter Your email"),
              controller: email,
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () async {
                  final Response response = await UserViewModel.updateUser(
                      name.toString(), email.toString(), widget.id!.toInt());
                  if (response.statusCode == 200) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewData(),
                        ));
                  }
                },
                child: Text("Send Data")),
          ]),
    );
  }
}
