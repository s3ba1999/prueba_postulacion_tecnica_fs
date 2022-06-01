import 'package:flutter/material.dart';
import 'package:prueba_tecnica_postulacion/api/post-repository.dart';
import 'package:prueba_tecnica_postulacion/api/post.dart';
import 'package:prueba_tecnica_postulacion/screens/add_Post.dart';
import 'package:prueba_tecnica_postulacion/screens/comments.dart';

class HomeScreen extends StatelessWidget {
  final repo = PostRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewPost()),
          );
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: FutureBuilder<List<Post>>(
          future: repo.getPost(),
          builder: (context, snap) {
            if (!snap.hasData) {
              return const CircularProgressIndicator();
            }

            if (snap.hasError) {
              return const Icon(
                Icons.error,
                color: Colors.red,
              );
            }

            final posts = snap.data;
            return ListView.builder(
              itemBuilder: (context, index) {
                final post = posts![index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                  child: Card(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CommentsScreen()),
                            );
                          },
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text(post.userId.toString()),
                            ),
                            title: Text(
                              post.title.toString(),
                            ),
                            subtitle: Text(post.body.toString()),
                            trailing: Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: posts?.length ?? 0,
            );
          },
        ),
      ),
    );
  }
}
