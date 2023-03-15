import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const FlutterSecureStorage storage = FlutterSecureStorage();

  static const _keyValue = "string";

  static Future setString(String str) async {
    await storage.write(key: _keyValue, value: str);
    print("string..........          " + str.toString());
  }

  static Future getString() async {
    var res = await storage.read(key: _keyValue);
    return res;
  }
}
