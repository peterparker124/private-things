import 'dart:convert';

import 'package:marc/feature/screen/tabs/profile/data/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String USER_MODEL = "USER_MODEL";
const String SESSION_TOKEN = "SESSION_TOKEN";
const String ACCESS_TOKEN = "ACCESS_TOKEN";
const String FCM_TOKEN = "FCM_TOKEN";
const String KEY_TOKEN = "KEY_TOKEN";
const String USER_NAME = "User_Name";

class SharedPrefSingleton {
  static final SharedPrefSingleton _singleton = SharedPrefSingleton._internal();

  factory SharedPrefSingleton() {
    return _singleton;
  }

  SharedPrefSingleton._internal();


  Future<String?> getSessionToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SESSION_TOKEN);
  }


  setSessionToken(String sessionToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(SESSION_TOKEN, sessionToken);
  }

  Future<String?> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(ACCESS_TOKEN);
  }


  putAccessToken(String sessionToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(ACCESS_TOKEN, sessionToken);
  }


  Future<String?> getKeyToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(KEY_TOKEN);
  }


  putKeyToken(String sessionToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(KEY_TOKEN, sessionToken);
  }


  Future<String?> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(USER_NAME);
  }


  putUserName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(USER_NAME, name);
  }

  Future<UserModel?> getUserModel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? key = prefs.getString(USER_MODEL);
    if (key!=null) {
      UserModel model =  UserModel.fromJson(json.decode(key));
      //  if (model.progress == null || model.progress == 0)
      if (model.data != null) {
        return model;
      }
      return model;
    } else {
      return null;
    }

  }

  setUserModelDetail(UserModel session) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(USER_MODEL, json.encode(session.toJson()));
  }
  // Future<String> getFCMToken() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getString(FCM_TOKEN);
  // }


  putFCMToken(String sessionToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(FCM_TOKEN, sessionToken);
  }
  clearSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(SESSION_TOKEN);
    prefs.remove(USER_MODEL);

  }

  clearSharedPreferenceLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
