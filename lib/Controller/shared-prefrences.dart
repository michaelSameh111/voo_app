import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? preferences;

  static Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static void putString({required String key, required String value}) async {
    await preferences?.setString(key, value);
  }

  static Future<bool> putBool(
      {required String key, required bool value}) async {
    return await preferences!.setBool(key, value);
  }

  static bool? getBool({required String key}) {
    return preferences!.getBool(key);
  }

  static String getString({required String key}) {
    return preferences?.getString(key) ?? '';
  }

  static dynamic getData({required String key}) {
    return preferences!.get(key);
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await preferences!.setString(key, value);
    if (value is bool) return await preferences!.setBool(key, value);
    if (value is int) {
      return await preferences!.setInt(key, value);
    }
    else {
      return await preferences!.setDouble(key, value);
    }

  }

  static void removeData({required String key}) {
    preferences!.remove(key);
  }
}
