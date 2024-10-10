import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static saveData({required String key, required String value}) async {
    SharedPreferences shp = await SharedPreferences.getInstance();
    return await shp.setString(key, value);
  }

  static Future<String?> getData({required String key}) async {
    SharedPreferences shp = await SharedPreferences.getInstance();
    return shp.getString(key);
  }

}