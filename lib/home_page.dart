import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ombre_assignment/main.dart';
import 'package:ombre_assignment/streaming_page.dart';

class HomePage extends StatefulWidget {
  late final User user;

  HomePage(this.user);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Assigment"),
            ),
            body: Center(
              child: FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => StreamingPage(),
                      ),
                    );
                  }, label: Text("GO Live")),
            )));
  }
}
