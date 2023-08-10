import 'package:shared_preferences/shared_preferences.dart';

class cacheData{
  static late SharedPreferences sharedPreferences;
  static void cacheInitialization() async {
      sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setData({required String key, required String value}) async {
    if(value is String){
      await sharedPreferences.setString(key, value);
      return true;
    }
    return false;
  }

  static dynamic getData({required String key}){
    return sharedPreferences.get(key);
  }

  static void deleteItem({required String key}){
    sharedPreferences.remove(key);
  }
}