import 'dart:convert';

import 'package:http/http.dart' as http;
import 'post.dart';

class PostRepository {
  final String postURL = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Post>> getPost() async {
    final posts = <Post>[];

    try {
      final res = await http.get(Uri.parse(postURL));
      final data = json.decode(res.body);

      return List.from(data.map((e) => Post.fromJson(e)));
    } catch (e) {
      print(e);
    }

    return posts;
  }
}
