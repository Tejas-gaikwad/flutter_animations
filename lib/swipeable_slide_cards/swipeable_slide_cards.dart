import 'package:flutter/material.dart';

// ignore: camel_case_types
class Swipeable_slide_cards extends StatefulWidget {
  const Swipeable_slide_cards({super.key});

  @override
  State<Swipeable_slide_cards> createState() => _Swipeable_slide_cardsState();
}

class _Swipeable_slide_cardsState extends State<Swipeable_slide_cards>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  late final AnimationController _controller1 = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 800),
  );

  late final AnimationController _controller2 = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 800),
  );

  late final AnimationController _controller3 = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 800),
  );

  late final Animation<Offset> _offsetAnimation1 = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(-1.8, 0.0),
  ).animate(CurvedAnimation(parent: _controller1, curve: Curves.easeIn));

  late final Animation<Offset> _offsetAnimation2 = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(-1.8, 0.0),
  ).animate(CurvedAnimation(parent: _controller2, curve: Curves.easeIn));

  late final Animation<Offset> _offsetAnimation3 = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(-1.8, 0.0),
  ).animate(CurvedAnimation(parent: _controller3, curve: Curves.easeIn));

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: Container(
          color: Colors.amber,
          child: Stack(
            alignment: Alignment.center,
            children: [
              const TextWidget(),
              AnimatedBuilder(
                animation: _controller1,
                builder: (context, child) {
                  return SlideTransition(
                      position: _offsetAnimation1,
                      child: Transform(
                          alignment: Alignment.topRight,
                          transform:
                              Matrix4.rotationZ(_controller1.value * (-0.3)),
                          child: SwipeCard(controller1: _controller1)));
                },
              ),
              AnimatedBuilder(
                animation: _controller2,
                builder: (context, child) {
                  return SlideTransition(
                      position: _offsetAnimation2,
                      child: Transform(
                          alignment: Alignment.topRight,
                          transform:
                              Matrix4.rotationZ(_controller2.value * (-0.3)),
                          child: SwipeCard(controller1: _controller2)));
                },
              ),
              AnimatedBuilder(
                animation: _controller3,
                builder: (context, child) {
                  return SlideTransition(
                      position: _offsetAnimation3,
                      child: Transform(
                          alignment: Alignment.topRight,
                          transform:
                              Matrix4.rotationZ(_controller3.value * (-0.3)),
                          child: SwipeCard(controller1: _controller3)));
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => false;
}

class SwipeCard extends StatelessWidget {
  const SwipeCard({
    super.key,
    required AnimationController controller1,
  }) : _controller1 = controller1;

  final AnimationController _controller1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 350,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: Colors.white,
        borderRadius: BorderRadius.circular(23.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            alignment: Alignment.center,
            height: 50,
            width: 150,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Text('Card One'),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16),
            child: Text(
              'Slide Card 1'.toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
          ),
          InkWell(
            onTap: () {
              _controller1.forward();
            },
            child: Container(
              alignment: Alignment.center,
              height: 50,
              width: 150,
              padding: const EdgeInsets.all(16),
              color: Colors.black,
              child: const Text(
                'Next',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        child: Text(
          'WELCOME'.toUpperCase(),
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
