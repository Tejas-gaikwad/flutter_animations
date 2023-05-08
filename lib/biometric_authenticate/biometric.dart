// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  bool isBiometricEnabled;
  LoginPage({
    Key? key,
    required this.isBiometricEnabled,
  }) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // bool _isBiometricEnabled = false;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    // _biometricData();
  }

  void _toggleBiometric(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      widget.isBiometricEnabled = value;
    });
    await prefs.setBool('isBiometric', value);
  }

  // Future<bool> _biometricData() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();

  //   _isBiometricEnabled = prefs.getBool(
  //         'isBiometric',
  //       ) ??
  //       true;

  //   return _isBiometricEnabled;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                title: Text('Enable Biometric Authentication'),
                trailing: Switch(
                  value: widget.isBiometricEnabled,
                  onChanged: _toggleBiometric,
                ),
              ),
              Text('widget.isBiometricEnabled is ${widget.isBiometricEnabled}'),
            ],
          ),
        ),
      ),
    );
  }
}
