import 'package:flutter/material.dart';

class PeelEffect extends StatefulWidget {
  @override
  _PeelEffectState createState() => _PeelEffectState();
}

class _PeelEffectState extends State<PeelEffect> {
  double _rotation = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.withOpacity(0.4),
      body: Center(
        child: GestureDetector(
          onPanUpdate: (details) {
            setState(() {
              _rotation -= details.delta.dx / 100;
            });
          },
          child: Stack(
            children: [
              Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://global.yamaha-motor.com/business/mc/img/index_key_001_sp.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Transform(
                alignment: Alignment.topRight,
                transform: Matrix4.rotationZ(_rotation),
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://global.yamaha-motor.com/business/mc/img/index_key_001_sp.jpg'),
                      fit: BoxFit.cover,
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
}
