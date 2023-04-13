import 'package:flutter/material.dart';

class BouncingBallList extends StatefulWidget {
  final int count;

  BouncingBallList({this.count = 3});

  @override
  _BouncingBallListState createState() => _BouncingBallListState();
}

class _BouncingBallListState extends State<BouncingBallList>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();

    _controllers = List.generate(
      widget.count,
      (index) => AnimationController(
        vsync: this,
        duration: Duration(seconds: 1),
      ),
    );

    _animations = _controllers.map((controller) {
      final index = _controllers.indexOf(controller);
      final delay = Duration(milliseconds: 500);

      return Tween<double>(begin: 0, end: 100).animate(
        CurvedAnimation(
          parent: controller,
          curve: Curves.elasticOut,
          reverseCurve: Curves.easeOutBack,
        ),
      )..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            if (index < _controllers.length - 1) {
              Future.delayed(delay, () {
                _controllers[index + 1].forward();
              });
            }
          }
        });
    }).toList();

    _controllers[0].forward();
  }

  @override
  void dispose() {
    _controllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.centerRight, colors: [
          Colors.purple.withOpacity(0.6),
          Colors.pink.withOpacity(0.4)
        ])),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.count,
          itemBuilder: (BuildContext context, int index) {
            return BouncingBall(animation: _animations[index]);
          },
        ),
      ),
    );
  }
}

class BouncingBall extends AnimatedWidget {
  final Animation<double> animation;

  BouncingBall({required this.animation}) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: animation.value * 5, left: 20, right: 20),
      child: Center(
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              colors: [
                Colors.red.withOpacity(0.8),
                Colors.orange.withOpacity(0.9)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
