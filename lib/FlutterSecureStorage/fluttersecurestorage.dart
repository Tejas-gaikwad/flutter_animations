import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_tutorial/FlutterSecureStorage/secureStorage.dart';

class FlutterSecureStorage extends StatefulWidget {
  const FlutterSecureStorage({super.key});

  @override
  State<FlutterSecureStorage> createState() => _FlutterSecureStorageState();
}

class _FlutterSecureStorageState extends State<FlutterSecureStorage> {
  late TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
    getString();
  }

  var valueString;

  Future getString() async {
    var str = await SecureStorage.getString();
    setState(() {
      valueString = str;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const MiddleText(),
            const SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  color: Colors.grey.withOpacity(0.4)),
              child: TextField(
                controller: _controller,
                style: const TextStyle(color: Colors.white, fontSize: 16.0),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter String",
                  hintStyle: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () async {
                await SecureStorage.setString(_controller.text);
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width / 2,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    border: Border.all(color: Colors.white),
                    color: Colors.white),
                child: Text("SAVE"),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              valueString.toString(),
              style: const TextStyle(fontSize: 30, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

class MiddleText extends StatelessWidget {
  const MiddleText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        "Flutter secure storage".toUpperCase(),
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}
