import 'package:flutter/material.dart';

import 'TweenAnimation/tweenanimation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          color: Colors.blueAccent,
          child: Column(
            children: [
              ButtonContainer(
                textContent: "Tween",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return TweenAnimation();
                    },
                  ));
                },
              ),
              // Image.asset("assets/dash.png")
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonContainer extends StatelessWidget {
  final textContent;
  final onTap;
  const ButtonContainer(
      {super.key, required this.textContent, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
            color: Colors.transparent, border: Border.all(color: Colors.white)),
        child: Container(
          alignment: Alignment.center,
          color: Colors.white,
          height: MediaQuery.of(context).size.height * 0.08,
          width: MediaQuery.of(context).size.width,
          child: Text(
            textContent,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
