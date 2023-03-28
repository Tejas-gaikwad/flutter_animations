import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Swipeable_slide_cards extends StatefulWidget {
  const Swipeable_slide_cards({super.key});

  @override
  State<Swipeable_slide_cards> createState() => _Swipeable_slide_cardsState();
}

class _Swipeable_slide_cardsState extends State<Swipeable_slide_cards>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  late final AnimationController _controller1 = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 800));
  late final AnimationController _controller2 = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 800));
  late final AnimationController _controller3 = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 800));

  late final Animation<Offset> _offsetAnimation1 = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(-1.8, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller1,
    curve: Curves.easeIn,
  ));

  late final Animation<Offset> _offsetAnimation2 = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(-1.8, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller2,
    curve: Curves.easeIn,
  ));
  late final Animation<Offset> _offsetAnimation3 = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(-1.8, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller3,
    curve: Curves.easeIn,
  ));

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: Container(
          color: Colors.amber,
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'WELCOME'.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Positioned(
                left: 60,
                right: 65,
                top: 130,
                child: AnimatedBuilder(
                  animation: _controller3,
                  builder: (_, child) {
                    return SlideTransition(
                      position: _offsetAnimation3,
                      child: Transform(
                        alignment: Alignment.topRight,
                        transform:
                            Matrix4.rotationZ(_controller3.value * (-0.3)),
                        child: child,
                      ),
                    );
                  },
                  child: Container(
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
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: Text('Card Three'),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            'Slide Card 3'.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _controller3.forward();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: 150,
                            padding: const EdgeInsets.all(16),
                            color: Colors.black,
                            child: const Text(
                              'Next',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 45,
                right: 50,
                top: 115,
                child: AnimatedBuilder(
                  animation: _controller2,
                  builder: (_, child) {
                    return SlideTransition(
                      position: _offsetAnimation2,
                      child: Transform(
                        alignment: Alignment.topRight,
                        transform:
                            Matrix4.rotationZ(_controller2.value * (-0.3)),
                        child: child,
                      ),
                    );
                  },
                  child: Container(
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
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: Text('Card Second'),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            'Slide Card 2'.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _controller2.forward();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: 150,
                            padding: const EdgeInsets.all(16),
                            color: Colors.black,
                            child: const Text(
                              'Next',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 100,
                child: AnimatedBuilder(
                  animation: _controller1,
                  builder: (_, child) {
                    return SlideTransition(
                      position: _offsetAnimation1,
                      child: Transform(
                        alignment: Alignment.topRight,
                        transform:
                            Matrix4.rotationZ(_controller1.value * (-0.3)),
                        child: child,
                      ),
                    );
                  },
                  child: Container(
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
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => false;
}
