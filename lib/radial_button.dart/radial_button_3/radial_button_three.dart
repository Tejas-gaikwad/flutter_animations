import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RadialButtonThreeScreen extends StatefulWidget {
  const RadialButtonThreeScreen({super.key});

  @override
  State<RadialButtonThreeScreen> createState() =>
      _RadialButtonThreeScreenState();
}

class _RadialButtonThreeScreenState extends State<RadialButtonThreeScreen>
    with SingleTickerProviderStateMixin {
  var toggle = true;

  Alignment alignment1 = Alignment(0.0, 0.0);
  Alignment alignment2 = Alignment(0.0, 0.0);
  Alignment alignment3 = Alignment(0.0, 0.0);
  Alignment alignment4 = Alignment(0.0, 0.0);
  Alignment alignment5 = Alignment(0.0, 0.0);
  Alignment alignment6 = Alignment(0.0, 0.0);

  double size1 = 50.0;
  double size2 = 50.0;
  double size3 = 50.0;

  late AnimationController _controller;
  late Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      reverseDuration: Duration(milliseconds: 275),
    );

    animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          color: Colors.blueAccent,
          child: Center(
            child: Container(
              color: Colors.greenAccent,
              height: 300.0,
              width: width,
              child: Stack(
                children: [
                  IconContainer(
                    alignment: alignment1,
                    size: size3,
                    toggle: toggle,
                    animation: (animation.value) * pi * 180,
                    icon: Icon(Icons.hdr_off_select_rounded),
                  ),
                  IconContainer(
                    alignment: alignment2,
                    size: size3,
                    toggle: toggle,
                    animation: (animation.value) * pi * 180,
                    icon: Icon(Icons.high_quality),
                  ),
                  IconContainer(
                    alignment: alignment3,
                    size: size3,
                    toggle: toggle,
                    animation: (animation.value) * pi * 180,
                    icon: Icon(Icons.offline_bolt),
                  ),
                  IconContainer(
                    alignment: alignment4,
                    size: size1,
                    toggle: toggle,
                    animation: (animation.value) * pi * 180,
                    icon: Icon(Icons.padding_outlined),
                    
                  ),
                  IconContainer(
                      icon: Icon(Icons.u_turn_left),
                      alignment: alignment5,
                      size: size2,
                      toggle: toggle,
                      animation: (animation.value) * pi * 180),
                  IconContainer(
                      icon: Icon(Icons.face),
                      alignment: alignment6,
                      size: size3,
                      toggle: toggle,
                      animation: (animation.value) * pi * 180),
                  InkWell(
                    onTap: () {
                      if (toggle) {
                        setState(() {
                          toggle = !toggle;

                          _controller.forward();
                          Future.delayed(
                            Duration(milliseconds: 50),
                            () {
                              alignment1 = Alignment(-0.7, -0.3);
                              size1 = 50.0;
                            },
                          );
                          Future.delayed(
                            Duration(milliseconds: 80),
                            () {
                              alignment2 = Alignment(-0.5, -0.7);
                              size2 = 50.0;
                            },
                          );
                          Future.delayed(
                            Duration(milliseconds: 110),
                            () {
                              alignment3 = Alignment(-0.2, -1.1);
                              size3 = 50.0;
                            },
                          );
                          Future.delayed(
                            Duration(milliseconds: 140),
                            () {
                              alignment4 = Alignment(0.2, -1.1);
                              size1 = 50.0;
                            },
                          );
                          Future.delayed(
                            Duration(milliseconds: 170),
                            () {
                              alignment5 = Alignment(0.5, -0.7);
                              size2 = 50.0;
                            },
                          );
                          Future.delayed(
                            Duration(milliseconds: 200),
                            () {
                              alignment6 = Alignment(0.7, -0.3);
                              size3 = 50.0;
                            },
                          );
                        });
                      } else {
                        setState(() {
                          toggle = !toggle;
                          _controller.reverse();
                          Future.delayed(
                            Duration(milliseconds: 50),
                            () {
                              alignment1 = Alignment(0.0, 0.0);
                            },
                          );
                          Future.delayed(
                            Duration(milliseconds: 50),
                            () {
                              alignment2 = Alignment(0.0, 0.0);
                            },
                          );
                          Future.delayed(
                            Duration(milliseconds: 50),
                            () {
                              alignment3 = Alignment(0.0, 0.0);
                            },
                          );
                          Future.delayed(
                            Duration(milliseconds: 50),
                            () {
                              alignment4 = Alignment(0.0, 0.0);
                            },
                          );
                          Future.delayed(
                            Duration(milliseconds: 50),
                            () {
                              alignment5 = Alignment(0.0, 0.0);
                            },
                          );
                          Future.delayed(
                            Duration(milliseconds: 50),
                            () {
                              alignment6 = Alignment(0.0, 0.0);
                            },
                          );
                          size1 = size2 = size3 = 20.0;
                        });
                      }
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: Transform.rotate(
                        angle: animation.value * pi * (3 / 4),
                        child: AnimatedContainer(
                          height: toggle ? 70.0 : 60.0,
                          width: toggle ? 70.0 : 60.0,
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          duration: Duration(milliseconds: 600),
                          child: Icon(Icons.add),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class IconContainer extends StatelessWidget {
  final alignment;
  final toggle;
  final size;
  final animation;
  final icon;

  const IconContainer({
    super.key,
    required this.alignment,
    required this.toggle,
    required this.size,
    required this.animation,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      curve: toggle ? Curves.easeIn : Curves.elasticOut,
      alignment: alignment,
      duration:
          toggle ? Duration(milliseconds: 275) : Duration(milliseconds: 875),
      child: Transform.rotate(
        angle: animation,
        child: AnimatedContainer(
          height: size,
          width: size,
          duration: Duration(milliseconds: 275),
          curve: toggle ? Curves.easeIn : Curves.easeOut,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 88, 87, 85),
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: icon,
        ),
      ),
    );
  }
}
