import 'package:flutter/material.dart';
import 'package:flutter_tutorial/radial_button.dart/radial_button_2/radial_button_two.dart';
import 'package:flutter_tutorial/radial_button.dart/radial_button_3/radial_button_three.dart';
import 'FlutterSecureStorage/fluttersecurestorage.dart';
import 'StateVideo/state.dart';
import 'TweenAnimation/tweenanimation.dart';
import 'homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RadialButtonThreeScreen(),
    );
  }
}
