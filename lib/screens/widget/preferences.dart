import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  late SharedPreferences prefs;

  read(String key) async {
    prefs = await SharedPreferences.getInstance();
    // return json.decode(prefs.getString(key).toString());
    return prefs.getString(key);
  }

  save(dynamic value, String key) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
    print("berhasil di save");
  }

  remove(String key) async {
    prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  clear()async{
    prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
