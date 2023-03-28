import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ParallaxSimpleExample extends StatefulWidget {
  const ParallaxSimpleExample({super.key});

  @override
  State<ParallaxSimpleExample> createState() => _ParallaxSimpleExampleState();
}

class _ParallaxSimpleExampleState extends State<ParallaxSimpleExample> {
  var top1 = 350.0;
  var top2 = 350.0;

  var left1 = -300.0;
  var right2 = -300.0;

  @override
  Widget build(BuildContext context) {
    print(left1);
    return Scaffold(
      body: NotificationListener(
          onNotification: (v) {
            return parallaxLogic(v);
          },
          child: Stack(
            children: [
              ListView(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 200,
                    width: 200,
                    color: Color.fromARGB(255, 47, 18, 213),
                    child: Text(
                        'Welcome to my portfolio website, Tejas Gaikwad...'),
                  ),
                  Container(
                    height: 2000,
                    color: Color.fromARGB(255, 213, 174, 18),
                  ),
                ],
              ),
              Positioned(
                top: top1,
                left: left1 >= 65 ? 65 : left1,
                child: Container(
                  height: 250,
                  width: 300,
                  color: Colors.greenAccent,
                ),
              ),
              Positioned(
                top: top2,
                right: right2 >= 65 ? 65 : right2,
                child: Container(
                  height: 250,
                  width: 300,
                  color: Colors.pink,
                ),
              ),
            ],
          )),
    );
  }

  parallaxLogic(v) {
    if (v is ScrollUpdateNotification) {
      print("SCROLLDELTA   ---    " + v.scrollDelta.toString());
      // only if scroll notification is triggered
      setState(() {
        top1 -= v.scrollDelta! / 1;
        top2 -= v.scrollDelta! / 1;

        left1 += v.scrollDelta! / 0.5;

        right2 += v.scrollDelta! / 0.5;

        // topTwo = topTwo - v.scrollDelta! / 1;
      });
    }
  }
}
