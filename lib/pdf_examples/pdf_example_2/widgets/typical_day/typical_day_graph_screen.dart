import 'package:flutter/material.dart';
import 'scatter_graph.dart';

class TypicalDayScreen extends StatelessWidget {
  const TypicalDayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 500,
              width: MediaQuery.of(context).size.width / 1.4,
              child: ScatterDefault(),
            ),
          ],
        ),
      ),
    );
  }
}
