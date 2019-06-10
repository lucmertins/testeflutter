import 'package:flutter/material.dart';
import 'package:testeflutter/views/RandomWords.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        primaryColor: Colors.cyanAccent,
      ),
      debugShowCheckedModeBanner: false,
      home: RandomWords(),
    );
  }
}


