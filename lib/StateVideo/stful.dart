import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class StatefulScreen extends StatefulWidget {
  const StatefulScreen({super.key});

  @override
  State<StatefulScreen> createState() => _StatefulScreenState();
}

class _StatefulScreenState extends State<StatefulScreen> {
  int number = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("STATEFUL SCREEN"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Column(
          children: [
            const Text("STATEFUL SCREEN"),
            SizedBox(height: 50),
            Text("${number.toString()}"),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  number = number + 1;
                });
              },
              child: Text("BUTTON"),
            )
          ],
        ),
      ),
    );
  }
}
