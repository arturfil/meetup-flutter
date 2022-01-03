import 'package:flutter/material.dart';
import 'package:meetup/src/widgets/bottom_navigation.dart';

class MetupDetailScreen extends StatelessWidget {
  const MetupDetailScreen({Key? key}) : super(key: key);
  static const String route = "/meetupDetail";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Meetup Detail",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: const Text('Metup Detail Screen'),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
