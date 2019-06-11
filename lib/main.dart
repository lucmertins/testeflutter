import 'package:flutter/material.dart';
import 'package:testeflutter/constants/Constant.dart';
import 'package:testeflutter/views/RandomWords.dart';
import 'package:testeflutter/views/SplashScreen.dart';
import 'package:testeflutter/views/MyScaffold.dart';
import 'package:testeflutter/views/TutorialHome.dart';

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
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        HOME_SCREEN: (BuildContext context) => new RandomWords(),
        MYSCAFFOLD:(BuildContext context)=> MyScaffold(),
        TUTORIALHOME:(BuildContext context)=> TutorialHome()
      },
    );
  }
}


