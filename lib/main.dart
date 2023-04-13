import 'package:flutter/material.dart';
import 'package:flutter_tutorial/FlutterSecureStorage/bouncingball_animation.dart';
import 'package:flutter_tutorial/ListWheelScrollView/keys_listwheelscroll.dart';
import 'package:flutter_tutorial/swipeable_slide_cards/swipeable_slide_cards.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BouncingBallList(count: 5),
    );
  }
}
