import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;

  const ResponsiveWidget(
      {Key? key,
      required this.largeScreen,
      this.mediumScreen,
      this.smallScreen})
      : super(key: key);

  static double getBlockWidth(BuildContext context) {
    return MediaQuery.of(context).size.width / 100;
  }

  static double getBlockHeight(BuildContext context) {
    return MediaQuery.of(context).size.height / 100;
  }

  static double getTextMultiplier(BuildContext context) {
    return MediaQuery.of(context).size.height / 100;
  }

  static double getImageSizeMultiplier(BuildContext context) {
    return MediaQuery.of(context).size.width / 100;
  }

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 800;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 800 &&
        MediaQuery.of(context).size.width <= 1200;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return largeScreen;
        } else if (constraints.maxWidth <= 1200 &&
            constraints.maxWidth >= 800) {
          return mediumScreen ?? largeScreen;
        } else {
          return smallScreen ?? largeScreen;
        }
      },
    );
  }
}