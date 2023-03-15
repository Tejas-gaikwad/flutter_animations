import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'radial_button_widget.dart';

class RadialButtonScreen extends StatefulWidget {
  final ontap;
  const RadialButtonScreen({super.key, this.ontap});

  @override
  State<RadialButtonScreen> createState() => _RadialButtonScreenState();
}

class _RadialButtonScreenState extends State<RadialButtonScreen> {
  bool _opened = false;

  Widget radialMenuCenterButton() {
    //1
    return InkWell(
      //2
      key: UniqueKey(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 70.0,
          width: 70.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
              color: Colors.green[600]),
          child: Center(
            child: Icon(_opened == false ? Icons.add : Icons.close,
                color: Colors.white),
          ),
        ),
      ),
      onTap: () {
        //3
        setState(() {
          _opened == false ? _opened = true : _opened = false;
        });
      },
    );
  }

  Widget _getRadialMenu() {
    return AnimatedSwitcher(
      // 1
      duration: const Duration(milliseconds: 600),
      // 2
      transitionBuilder: (child, animation) {
        return ScaleTransition(scale: animation, child: child);
      },
      // 3
      child: radialMenuCenterButton(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              RadialButton(
                hiddenHorizontalPlacement: _screenWidth - 250.0,
                visibleHorizontalPlacement: _screenWidth - 380.0,
                hiddenVerticalPlacement: 10.0,
                visibleVerticalPlacement: 50.0,
                color: Colors.green[400],
                image: Icons.search,
                opened: _opened,
                onTap: () {},
              ),
              RadialButton(
                hiddenHorizontalPlacement: _screenWidth - 250.0,
                visibleHorizontalPlacement: _screenWidth - 110.0,
                hiddenVerticalPlacement: 10.0,
                visibleVerticalPlacement: 50.0,
                color: Colors.green[400],
                image: Icons.search,
                opened: _opened,
                onTap: () {},
              ),
              RadialButton(
                hiddenHorizontalPlacement: _screenWidth - 250.0,
                visibleHorizontalPlacement: _screenWidth - 350.0,
                hiddenVerticalPlacement: 10.0,
                visibleVerticalPlacement: 120,
                color: Colors.green[400],
                image: Icons.library_add,
                opened: _opened,
                onTap: () {},
              ),
              RadialButton(
                hiddenHorizontalPlacement: _screenWidth - 250.0,
                visibleHorizontalPlacement: _screenWidth - 140.0,
                hiddenVerticalPlacement: 10.0,
                visibleVerticalPlacement: 120.0,
                color: Colors.green[400],
                image: Icons.library_add,
                opened: _opened,
                onTap: () {},
              ),
              RadialButton(
                hiddenHorizontalPlacement: _screenWidth - 250.0,
                visibleHorizontalPlacement: _screenWidth - 290.0,
                hiddenVerticalPlacement: 10.0,
                visibleVerticalPlacement: 170.0,
                color: Colors.green[400],
                image: Icons.telegram,
                opened: _opened,
                onTap: () {},
              ),
              RadialButton(
                hiddenHorizontalPlacement: _screenWidth - 250.0,
                visibleHorizontalPlacement: _screenWidth - 200.0,
                hiddenVerticalPlacement: 10.0,
                visibleVerticalPlacement: 170,
                color: Colors.green[400],
                image: Icons.telegram,
                opened: _opened,
                onTap: () {},
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: _getRadialMenu(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
