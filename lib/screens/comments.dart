import 'package:flutter/material.dart';
import 'package:prueba_tecnica_postulacion/api/comments-repo.dart';
import 'package:prueba_tecnica_postulacion/api/comments.dart';

class CommentsScreen extends StatelessWidget {
  final repo = CommentsRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
        
      ),
      body: Center(
        child: FutureBuilder<List<Comments>>(
          future: repo.getComments(),
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

            final comments = snap.data;
            return ListView.builder(
              itemBuilder: (context, index) {
                final comment = comments![index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                  child: Card(
                    child: Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text(comment.postId.toString()),
                          ),
                          title: Text(
                            comment.name.toString(),
                          ),
                          subtitle: Text(comment.body.toString()),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: comments?.length ?? 0,
            );
          },
        ),
      ),
    );
  }
}
