import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ParallaxOne extends StatefulWidget {
  const ParallaxOne({super.key});

  @override
  State<ParallaxOne> createState() => _ParallaxOneState();
}

class _ParallaxOneState extends State<ParallaxOne> {
  double rateZero = 0.0;
  double rateOne = 0.0;
  double rateTwo = 0.0;
  double rateThree = 0.0;
  double rateFour = 0.0;
  double rateFive = 50.0;
  double rateSix = 100.0;
  double rateSeven = 100.0;
  double rateEight = 220.0;

  String? asset;
  double? top;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: NotificationListener(
        onNotification: (v) {
          return parallaxLogic(v);
        },
        child: Stack(
          children: [
            ParallaxWidget(top: rateZero, asset: "parallax0.png"),
            ParallaxWidget(top: rateOne, asset: "parallax1.png"),
            ParallaxWidget(top: rateTwo, asset: "parallax2.png"),
            ParallaxWidget(top: rateThree, asset: "parallax3.png"),
            ParallaxWidget(top: rateFour, asset: "parallax4.png"),
            ParallaxWidget(top: rateFive, asset: "parallax5.png"),
            ParallaxWidget(top: rateSix, asset: "parallax6.png"),
            ParallaxWidget(top: rateSeven, asset: "parallax7.png"),
            ParallaxWidget(top: rateEight, asset: "parallax8.png"),
            ListView(
              children: [
                Container(
                  height: 900,
                  color: Colors.transparent,
                ),
                Container(
                  height: 1000,
                  color: Color(0xff1F0101),
                  width: width,
                  padding: EdgeInsets.only(top: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 100),
                      Container(
                        child: Text(
                          "PARALLAX",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      Container(
                        child: Text(
                          "by",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      Container(
                        child: Text(
                          "TEJAS GAIKWAD",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 120,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  parallaxLogic(v) {
    if (v is ScrollUpdateNotification) {
      print("SCROLLDELTA   ---    " + v.scrollDelta.toString());
      // only if scroll notification is triggered
      setState(() {
        rateEight -= v.scrollDelta! / 1;
        rateSeven -= v.scrollDelta! / 1.8;
        rateSix -= v.scrollDelta! / 2.4;
        rateFive -= v.scrollDelta! / 3.2;
        rateFour -= v.scrollDelta! / 4;
        rateThree -= v.scrollDelta! / 4.8;
        rateTwo -= v.scrollDelta! / 5.6;
        rateOne -= v.scrollDelta! / 6.4;
        rateZero -= v.scrollDelta! / 7.2;
        // topTwo = topTwo - v.scrollDelta! / 1;
      });
    }
  }
}

class ParallaxWidget extends StatelessWidget {
  const ParallaxWidget({
    super.key,
    required this.top,
    required this.asset,
  });

  final double? top;
  final String? asset;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: top,
      child: Container(
        color: Colors.transparent,
        height: 700,
        // height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset(
          "assets/parllax_asset/${asset ?? "parallax2.png"}",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
 //  Image.asset("assets/parllax_asset/parallax0.png"),