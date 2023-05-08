// import 'package:flutter/material.dart';
// import 'dart:async';

// class ColorChangeScreen extends StatefulWidget {
//   @override
//   _ColorChangeScreenState createState() => _ColorChangeScreenState();
// }

// class _ColorChangeScreenState extends State<ColorChangeScreen> {
//   final List<Color> _colorList = [
//     Colors.black,
//     Colors.red,
//     Colors.green,
//     Colors.blue,
//     Colors.orange,
//     Colors.purple,
//   ];
//   int _currentColorIndex = 0;
//   Animatable<Color>? _colorTween;

//   void _changeTextColor() {
//     setState(() {
//       _currentColorIndex = (_currentColorIndex + 1) % _colorList.length;
//       _colorTween = TweenSequence<Color>([
//         TweenSequenceItem<Color>(
//           tween: ColorTween(begin: _colorList[_currentColorIndex - 1], end: _colorList[_currentColorIndex]),
//           weight: 1.0,
//         ),
//         TweenSequenceItem<Color>(
//           tween: ColorTween(begin: _colorList[_currentColorIndex], end: _colorList[(_currentColorIndex + 1) % _colorList.length]),
//           weight: 1.0,
//         ),
//       ]).chain(CurveTween(curve: Curves.linear));
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     _colorTween = TweenSequence<Color>([
//       TweenSequenceItem<Color>(
//         tween: ColorTween(begin: _colorList.last, end: _colorList.first),
//         weight: 1.0,
//       ),
//       for (int i = 0; i < _colorList.length - 1; i++)
//         TweenSequenceItem<Color>(
//           tween: ColorTween(begin: _colorList[i], end: _colorList[i+1]),
//           weight: 1.0,
//         ),
//       TweenSequenceItem<Color>(
//         tween: ColorTween(begin: _colorList.last, end: _colorList.first),
//         weight: 1.0,
//       ),
//     ]).chain(CurveTween(curve: Curves.linear));
//     Timer.periodic(Duration(milliseconds: 500), (timer) {
//       _changeTextColor();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: TweenAnimationBuilder<Color>(
//           tween: _colorTween!,
//           duration: Duration(milliseconds: 500),
//           builder: (BuildContext context, Color color, Widget? child) {
//             return Text(
//               "Hello, World!",
//               style: TextStyle(
//                 color: color,
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
