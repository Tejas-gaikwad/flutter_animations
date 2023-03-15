import 'package:flutter/material.dart';

class RadialButton extends StatefulWidget {
  final double? hiddenHorizontalPlacement;
  final double? hiddenVerticalPlacement;
  final double? visibleHorizontalPlacement;
  final double? visibleVerticalPlacement;
  final Color? color;
  final IconData? image;
  final onTap;
  final bool? opened;
  const RadialButton(
      {Key? key,
      this.hiddenHorizontalPlacement,
      this.hiddenVerticalPlacement,
      this.visibleHorizontalPlacement,
      this.visibleVerticalPlacement,
      this.color,
      this.image,
      this.onTap,
      this.opened})
      : super(key: key);
  @override
  State createState() {
    return RadialButtonState();
  }
}

class RadialButtonState extends State<RadialButton> {
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      left: widget.opened == false
          ? widget.hiddenHorizontalPlacement
          : widget.visibleHorizontalPlacement,
      bottom: widget.opened == false
          ? widget.hiddenVerticalPlacement
          : widget.visibleVerticalPlacement,
      duration: const Duration(milliseconds: 500),
      curve: Curves.elasticIn,
      child: InkWell(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 60.0,
            width: 60.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0), color: widget.color),
            child: Center(
              child: Icon(widget.image, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
