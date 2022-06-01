import 'dart:convert';

import 'package:http/http.dart' as http;
import 'comments.dart';

class CommentsRepository {
  final String postURL = 'https://jsonplaceholder.typicode.com/comments';

  Future<List<Comments>> getComments() async {
    final comments = <Comments>[];

    try {
      final res = await http.get(Uri.parse(postURL));
      final data = json.decode(res.body);

      return List.from(data.map((e) => Comments.fromJson(e)));
    } catch (e) {
      print(e);
    }

    return comments;
  }
}
