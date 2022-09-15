import 'package:flutter/material.dart';
import 'package:test_api_app/models/posts_model.dart';
import 'package:test_api_app/view_models/posts_view_models.dart';
import 'package:test_api_app/views/viewData.dart';

class ViewPosts extends StatelessWidget {
  int? id;
  ViewPosts({Key? key, this.id}) : super(key: key);
  PostsViewModel _postsViewModel = PostsViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("View Posts by id"),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => ViewData(),
                ));
              },
              icon: Icon(Icons.arrow_back))),
      body: FutureBuilder<List<PostsModel>?>(
        future: _postsViewModel.fetchAllData(id!),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, i) {
                return Card(
                  child: ListTile(
                    title: Text(snapshot.data![i].title.toString()),
                    subtitle: Text(snapshot.data![i].body.toString()),
                  ),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
