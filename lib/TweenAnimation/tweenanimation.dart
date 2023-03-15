import 'package:flutter/material.dart';

class TweenAnimation extends StatefulWidget {
  const TweenAnimation({super.key});

  @override
  State<TweenAnimation> createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation>
    with SingleTickerProviderStateMixin {
  double animationEnd = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              onEnd: () {
                setState(() {
                  animationEnd = 1.0;
                });
              },
              curve: Curves.bounceIn,
              duration: const Duration(seconds: 1),
              builder: (context, value, child) {
                return Image.asset(
                  "assets/dash.png",
                  height: value,
                  width: value,
                );
              },
              tween: Tween<double>(begin: 100.0, end: 500.0),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: animationEnd,
              child: const Text(
                "Hello Developer...",
                style: TextStyle(color: Colors.white, fontSize: 50),
              ),
            )
          ],
        ),
      ),
    );
  }
}
