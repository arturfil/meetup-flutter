import 'package:flutter/material.dart';
import 'package:meetup/src/models/post.dart';
import 'package:meetup/src/services/post_api_provider.dart';
import 'package:meetup/src/widgets/bottom_navigation.dart';


class PostScreen extends StatefulWidget {
  PostScreen({Key? key}) : super(key: key);

  final PostApiProvider _api = PostApiProvider();
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<Post> _posts = [];
  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  _fetchPosts() async {
    List<Post> posts = await widget._api.fetchPosts();
    setState(() => _posts = posts);
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
          style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.w700),
        ),
      ),
      body: _PostList(posts: _posts),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}

class _PostList extends StatelessWidget {
  final List<Post> _posts;

  const _PostList({Key? key, required List<Post> posts})
      : _posts = posts,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _posts.length * 2,
      itemBuilder: (BuildContext context, int i) {
        if (i.isOdd) {
          return const Divider();
        }
        final index = i ~/ 2;
        return Column(
          children: [
            ListTile(
              title: Text(_posts[index].name),
              subtitle: Text("Roast: ${_posts[index].roast}"),
            ),
            // Image.network(_posts[index].image.toString())
          ],
        );
      },
    );
  }
}
