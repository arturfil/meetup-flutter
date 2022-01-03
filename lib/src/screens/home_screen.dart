import 'package:flutter/material.dart';
import 'package:meetup/src/widgets/bottom_navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // centerTitle: true,
        elevation: 0,
        title: const Text(
          'HomeScreen',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: const [
          Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Home Data"),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Home Data"),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.pushNamed(context, "/meetupDetail"),
          const Icon(Icons.home)
        },
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
