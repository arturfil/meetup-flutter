import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:meetup/src/models/post.dart';

class PostApiProvider {
  
  Future<List<Post>> fetchPosts() async {
    final res = await http.get(Uri.parse("https://agile-caverns-63081.herokuapp.com/api/v1/coffees"));
    final List<dynamic> parsedPosts = json.decode(res.body);

    return parsedPosts.map((post) {
      return Post.fromJSON(post);
    }).toList();
  }

}