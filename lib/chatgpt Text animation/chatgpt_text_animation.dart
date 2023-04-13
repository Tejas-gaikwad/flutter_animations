import 'package:flutter/material.dart';

class ChatGPTAnimationText extends StatefulWidget {
  const ChatGPTAnimationText({super.key});

  @override
  State<ChatGPTAnimationText> createState() => _ChatGPTAnimationTextState();
}

class _ChatGPTAnimationTextState extends State<ChatGPTAnimationText>
    with TickerProviderStateMixin {
  final _controller = TextEditingController();
  String _generatedText = '';

  late AnimationController _animationController;

  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  void generateText() {
    _generatedText = 'This is some generated text.';
    _animationController.reset();
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color.fromARGB(255, 40, 50, 56),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 79, 97, 106),
                    borderRadius: BorderRadius.circular(12.0)),
                height: 300,
                width: MediaQuery.of(context).size.width / 1.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(height: 10),
                    AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Text(
                          _generatedText.substring(
                              0,
                              (_generatedText.length * _animation.value)
                                  .round()),
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white.withOpacity(0.7)),
                        );
                      },
                    ),
                    InkWell(
                      onTap: generateText,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 18.0),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 40, 50, 56)
                                  .withOpacity(0.7),
                              borderRadius: BorderRadius.circular(08.0)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 14.0),
                          child: const Text(
                            'Generate Text',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
