import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  late final SharedPreferences prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  String? getDataString({required String key}) {
    return prefs.getString(key);
  }

  dynamic getData({required String key}) {
    return prefs.get(key);
  }

  Future<bool> saveData(
      {required String key, required dynamic value}) async {
    if (value is bool) {
      return await prefs.setBool(key, value);
    }
    if (value is String) {
      return await prefs.setString(key, value);
    }
    if (value is int) {
      return await prefs.setInt(key, value);
    } else {
      return await prefs.setDouble(key, value);
    }
  }
}
