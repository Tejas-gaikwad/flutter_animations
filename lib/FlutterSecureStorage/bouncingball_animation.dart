// import 'package:flutter/material.dart';

// // class BouncingBall extends StatefulWidget {
// //   const BouncingBall({super.key});

// //   @override
// //   _BouncingBallState createState() => _BouncingBallState();
// // }

// // class _BouncingBallState extends State<BouncingBall>
// //     with TickerProviderStateMixin {
// //   late AnimationController _animationController1;
// //   late AnimationController _animationController2;
// //   late AnimationController _animationController3;
// //   late AnimationController _animationController4;

// //   late Animation<double> _animation1;
// //   late Animation<double> _animation2;
// //   late Animation<double> _animation3;
// //   late Animation<double> _animation4;

// //   @override
// //   void initState() {
// //     super.initState();

// //     _animationController1 = AnimationController(
// //       vsync: this,
// //       duration: const Duration(milliseconds: 800),
// //     );

// //     _animationController2 = AnimationController(
// //       vsync: this,
// //       duration: const Duration(milliseconds: 1600),
// //     );

// //     _animationController3 = AnimationController(
// //       vsync: this,
// //       duration: const Duration(milliseconds: 2400),
// //     );

// //     _animationController4 = AnimationController(
// //       vsync: this,
// //       duration: const Duration(milliseconds: 3200),
// //     );

// //     _animation1 = Tween<double>(begin: 0, end: 1).animate(
// //       CurvedAnimation(
// //         parent: _animationController1,
// //         curve: Curves.bounceOut,
// //       ),
// //     );
// //     _animation2 = Tween<double>(begin: 0, end: 1).animate(
// //       CurvedAnimation(
// //         parent: _animationController2,
// //         curve: Curves.bounceOut,
// //       ),
// //     );
// //     _animation3 = Tween<double>(begin: 0, end: 1).animate(
// //       CurvedAnimation(
// //         parent: _animationController3,
// //         curve: Curves.bounceOut,
// //       ),
// //     );

// //     _animation4 = Tween<double>(begin: 0, end: 1).animate(
// //       CurvedAnimation(
// //         parent: _animationController4,
// //         curve: Curves.bounceOut,
// //       ),
// //     );

// //     _animationController1.forward();
// //     _animationController2.forward();
// //     _animationController3.forward();
// //     _animationController4.forward();
// //   }

// //   @override
// //   void dispose() {
// //     _animationController1.dispose();
// //     _animationController2.dispose();
// //     _animationController3.dispose();
// //     _animationController4.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: const Color(0xFF000000),
// //       body: Container(
// //         decoration: BoxDecoration(
// //             gradient: LinearGradient(
// //                 colors: [Colors.purple.shade400, Colors.pink.shade500])),
// //         height: MediaQuery.of(context).size.height,
// //         width: MediaQuery.of(context).size.width,
// //         child: Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceAround,
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           children: [
// //             AnimatedBuilder(
// //               animation: _animation1,
// //               builder: (context, child) {
// //                 return Transform.translate(
// //                   offset: Offset(0, 250 * _animation1.value),
// //                   child: Container(
// //                     width: 100,
// //                     height: 100,
// //                     decoration: BoxDecoration(
// //                       color: Colors.blue,
// //                       borderRadius: BorderRadius.circular(50),
// //                     ),
// //                   ),
// //                 );
// //               },
// //             ),
// //             const SizedBox(width: 30),
// //             AnimatedBuilder(
// //               animation: _animation2,
// //               builder: (context, child) {
// //                 return Transform.translate(
// //                   offset: Offset(0, 250 * _animation2.value),
// //                   child: Container(
// //                     width: 100,
// //                     height: 100,
// //                     decoration: BoxDecoration(
// //                       color: Colors.blue,
// //                       borderRadius: BorderRadius.circular(50),
// //                     ),
// //                   ),
// //                 );
// //               },
// //             ),
// //             const SizedBox(width: 30),
// //             AnimatedBuilder(
// //               animation: _animation3,
// //               builder: (context, child) {
// //                 return Transform.translate(
// //                   offset: Offset(0, 250 * _animation3.value),
// //                   child: Container(
// //                     width: 100,
// //                     height: 100,
// //                     decoration: BoxDecoration(
// //                       color: Colors.blue,
// //                       borderRadius: BorderRadius.circular(50),
// //                     ),
// //                   ),
// //                 );
// //               },
// //             ),
// //             const SizedBox(width: 30),
// //             AnimatedBuilder(
// //               animation: _animation4,
// //               builder: (context, child) {
// //                 return Transform.translate(
// //                   offset: Offset(0, 250 * _animation4.value),
// //                   child: Container(
// //                     width: 100,
// //                     height: 100,
// //                     decoration: BoxDecoration(
// //                       color: Colors.blue,
// //                       borderRadius: BorderRadius.circular(50),
// //                     ),
// //                   ),
// //                 );
// //               },
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// class BouncingBallList extends StatefulWidget {
//   final int count;
//   final Duration delay;

//   BouncingBallList(
//       {this.count = 3, this.delay = const Duration(milliseconds: 500)});

//   @override
//   _BouncingBallListState createState() => _BouncingBallListState();
// }

// class _BouncingBallListState extends State<BouncingBallList>
//     with TickerProviderStateMixin {
//   List<AnimationController> _controllers = [];

//   @override
//   void initState() {
//     super.initState();

//     for (int i = 0; i < widget.count; i++) {
//       _controllers.add(
//         AnimationController(
//           vsync: this,
//           duration: Duration(seconds: 1),
//         )..forward().then((_) async {
//             if (i != widget.count - 1) {
//               await Future.delayed(widget.delay, () {
//                 _controllers[i + 1].forward();
//               });
//             }
//           }),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     _controllers.forEach((controller) => controller.dispose());
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//             gradient: LinearGradient(
//           colors: [
//             Colors.purple.withOpacity(0.8),
//             Colors.pink.withOpacity(0.4)
//           ],
//         )),
//         width: double.infinity,
//         child: ListView.builder(
//           padding: EdgeInsets.symmetric(horizontal: 16),
//           shrinkWrap: true,
//           scrollDirection: Axis.horizontal,
//           itemCount: widget.count,
//           itemBuilder: (BuildContext context, int index) {
//             return Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: BouncingBall(
//                 controller: _controllers[index],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class BouncingBall extends StatelessWidget {
//   final AnimationController controller;
//   final Animation<double> animation;

//   BouncingBall({required this.controller})
//       : animation = Tween<double>(begin: 0, end: 100).animate(
//           CurvedAnimation(
//             parent: controller,
//             curve: Curves.bounceInOut,
//             reverseCurve: Curves.easeOutBack,
//           ),
//         );

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: animation,
//       builder: (BuildContext context, Widget? child) {
//         return Container(
//           margin: EdgeInsets.only(top: animation.value),
//           child: Center(
//             child: Container(
//               width: 100,
//               height: 100,
//               decoration: const BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

import 'dart:ui';

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
