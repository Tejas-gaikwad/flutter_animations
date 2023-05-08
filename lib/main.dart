import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'biometric_authenticate/biometric.dart';
import 'change_text_color/text_color_change.dart';
import 'homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isAuthenticated = true;
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  bool? _isBiometricEnabled;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    final output = await _loadPreferences();
    if (output == true) {
      _authenticate().then((isAuthenticated) {
        setState(() {
          _isAuthenticated = isAuthenticated;
        });
      });
    }
    super.setState(() {});
  }

  Future<bool> authenticate() async {
    bool isAuthenticated = false;
    try {
      isAuthenticated = await _localAuthentication.authenticate(
        localizedReason: 'Please authenticate to access your account',
      );
    } catch (e) {
      print(e);
    }
    return isAuthenticated;
  }

  Future<bool> canCheckBiometricsFunciton() async {
    bool canCheckBiometrics = await _localAuthentication.canCheckBiometrics;
    return canCheckBiometrics;
  }

  Future<bool> _authenticate() async {
    bool canCheckBiometrics = await canCheckBiometricsFunciton();
    if (canCheckBiometrics) {
      bool isAuthenticated = await authenticate();
      setState(() {
        _isAuthenticated = isAuthenticated;
      });
      if (_isAuthenticated) {
      } else {
        SystemNavigator.pop();
      }
    } else {}

    return _isAuthenticated;
  }

  Future<bool> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    _isBiometricEnabled = prefs.getBool('isBiometric');
    print("isBiometricEnabled  =>>>  $_isBiometricEnabled");
    return _isBiometricEnabled ?? true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(
        isBiometricEnabled: _isBiometricEnabled ?? true,
      ),
    );
  }
}
