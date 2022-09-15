import 'package:flutter/material.dart';
import 'package:test_api_app/view_models/posts_view_models.dart';
import 'package:test_api_app/view_models/user_view_model.dart';
import 'package:test_api_app/views/add_user.dart';
import 'package:test_api_app/views/viewDataById.dart';

class ViewData extends StatelessWidget {
  ViewData({Key? key}) : super(key: key);
  UserViewModel _userViewModel = UserViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddOrEditeUser(),
            ),
          );
        },
      ),
      appBar: AppBar(title: Text("test api")),
      body: FutureBuilder(
        future: _userViewModel.showUsers(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, i) {
                return Dismissible(
                  key: ObjectKey(snapshot.data[i].id),
                  onDismissed: (direction) {
                    UserViewModel.deleteUser(snapshot.data[i].id);
                  },
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => ViewPosts(
                                    id: snapshot.data[i]!.id,
                                  )),
                          (route) => false);
                    },
                    child: Card(
                      child: ListTile(
                          title: Text(snapshot.data[i]!.name),
                          subtitle: Text(snapshot.data[i]!.email),
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddOrEditeUser(
                                  id: snapshot.data[i].id,
                                  name: snapshot.data[i].name,
                                  email: snapshot.data[i].email,
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
