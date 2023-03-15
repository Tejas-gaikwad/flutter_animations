import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RadialButtonTwoScreen extends StatefulWidget {
  const RadialButtonTwoScreen({super.key});

  @override
  State<RadialButtonTwoScreen> createState() => _RadialButtonTwoScreenState();
}

class _RadialButtonTwoScreenState extends State<RadialButtonTwoScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  double showName = 0.0;
  @override
  Widget build(BuildContext context) {
    print("VALUE ---   " + showName.toString());
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 190, 178, 6),
              Color.fromARGB(255, 8, 30, 226)
            ],
          )),
          child: Stack(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
                child: Flow(
                  delegate: FlowMenuDelegate(controller: controller),
                  children: [
                    buildFab(Icon(Icons.co_present_sharp), "POST OFFICE"),
                    buildFab(Icon(Icons.email), "EMAIL"),
                    buildFab(Icon(Icons.percent), "PERCENT"),
                    buildFab(Icon(Icons.computer), "COMPUTER"),
                    buildFab(Icon(Icons.circle), "CIRCLE"),
                    buildFab(Icon(Icons.access_alarms), "ALARAM"),
                    InkWell(
                      onTap: () {
                        if (controller.status == AnimationStatus.completed) {
                          setState(() {
                            showName = 0.0;
                            controller.reverse();
                          });
                        } else {
                          setState(() {
                            showName = 1.0;
                            controller.forward();
                          });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 243, 21, 6),
                        ),
                        height: 60,
                        width: 60,
                        child: Icon(
                          Icons.home_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                  // .map<Widget>(buildFab).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFab(icon, text) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromARGB(255, 252, 252, 252),
          ),
          height: 40,
          width: 40,
          child: icon,
        ),
        SizedBox(height: 06),
        AnimatedOpacity(
          duration: Duration(milliseconds: 200),
          opacity: showName == 1.0 ? 1.0 : 0.0,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 06, vertical: 04),
            child: Text(
              text,
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}

class FlowMenuDelegate extends FlowDelegate {
  final Animation<double> controller;

  FlowMenuDelegate({required this.controller}) : super(repaint: controller);
  @override
  void paintChildren(FlowPaintingContext context) {
    var buttonSize = 60;
    final size = context.size;

    int n = context.childCount;

    for (int i = 0; i < n; i++) {
      final isLastItem = i == context.childCount - 1;
      final isSecondLastItem = i == context.childCount - 2;
      final isFirstItem = i == 0;

      final xStart = size.width - buttonSize;
      final yStart = size.height - buttonSize;

      final radius = 150 * controller.value;

      final theta = i * pi * 1.0 / (n - 2);

      setValue(value) => isLastItem ? 0.0 : value;

      final x = xStart / 2 - setValue(radius * cos(theta));

      final y = yStart / 1.08 - setValue(radius * sin(theta)) + 40;

      i != 0 || i != 5
          ? context.paintChild(
              i,
              transform: Matrix4.identity()
                ..translate(x, y, 0)
                ..translate(buttonSize / 2, buttonSize / 2)
                ..rotateZ(
                  i == 6
                      ? 360 * (1 - controller.value) * pi / 180
                      : 180 * (1 - controller.value) * pi / 180,
                )
                ..translate(
                  -buttonSize / 2,
                  -buttonSize / 2,
                ),
            )
          : i == 0
              ? context.paintChild(
                  0,
                  // transform: Matrix4.translationValues(10.0, 50.0, 0)
                  transform: Matrix4.identity()
                    ..translate(x, y, 0)
                    ..translate(buttonSize / 2, buttonSize / 2)
                    ..rotateZ(
                      i == 6
                          ? 360 * (1 - controller.value) * pi / 180
                          : 180 * (1 - controller.value) * pi / 180,
                    )
                    ..translate(
                      -buttonSize / 6,
                      -buttonSize / 6,
                    ),
                )
              : context.paintChild(
                  5,
                  transform: Matrix4.identity()
                    ..translate(x, y, 0)
                    ..translate(buttonSize / 2, buttonSize / 2)
                    ..rotateZ(
                      i == 6
                          ? 360 * (1 - controller.value) * pi / 180
                          : 180 * (1 - controller.value) * pi / 180,
                    )
                    ..translate(
                      -buttonSize / 6,
                      -buttonSize / 6,
                    ),
                );
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    // TODO: implement shouldRepaint
    // throw UnimplementedError();
    return false;
  }
}
