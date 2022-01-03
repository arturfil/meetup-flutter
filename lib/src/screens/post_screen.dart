import 'package:flutter/material.dart';
import 'package:meetup/src/widgets/bottom_navigation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<dynamic> _posts = [];
  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  void _fetchPosts() {
    http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"))
        .then((response) {
      final posts = json.decode(response.body);
      setState(() => _posts = posts);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // centerTitle: true,
        elevation: 0,
        title: const Text(
          'PostScreen',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: _PostList(posts: _posts),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}

class _PostList extends StatelessWidget {
  final List<dynamic> _posts;

  const _PostList({Key? key, required List posts})
      : _posts = posts,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _posts.length,
      itemBuilder: (BuildContext context, int i) {
        return ListTile(
          title: Text(_posts[i]['title']),
          subtitle: Text(_posts[i]['body']),
        );
      },
    );
  }
}
