import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:marc/feature/screen/login/data/login_api_provider.dart';
import 'package:marc/feature/screen/login/data/login_model.dart';
import 'package:marc/feature/screen/login/data/login_request.dart';
import 'package:marc/utils/shared_pref_util.dart';
import 'package:crypto/crypto.dart';

class LoginBloc {
  LoginApiProvider loginApiProvider = LoginApiProvider();
  Future<LoginModel> performLogin(String username, String password) async {
   // String token = await SharedPrefSingleton().getFCMToken();

    String token = "111";
    String os = Platform.isIOS ? "iOS" : "Android";
    LoginRequest request = LoginRequest(username: username, password: password, actInfo: ActInfo(marcInfo: MarcInfo(
        userid: username,
        ipaddr: "",
        sessionid: "",
        deviceType: "Mobile",
        deviceInfo: os,
        deviceId: "232323",
        deviceMacaddr: "",
        additionalinfo : "",
        loginMode: "N"
    )));

    LoginModel response = await loginApiProvider.performLogin(json.encode(request.toJson()));
    return response;
  }


  Future<KeyModel> getKey() async {
    KeyModel responseString = await loginApiProvider.getKey("{}");
    return responseString;
  }

  Future<String> forgotPassword(String username) async {
    String req = "{\"marc_userid\":\"$username\"}";
    String responseString = await loginApiProvider.forgotPassword(req);
    return responseString;
  }
}