


import 'package:marc/core/networking/base_networking.dart';
import 'package:marc/core/networking/base_response.dart';
import 'package:marc/utils/shared_pref_util.dart';

import 'login_model.dart';

class LoginApiProvider {
  static const String LOGIN_API = 'marc-admin/loginuser';
  static const String Forgot_API = 'marc-admin/forgetpassword';
  static const String Get_key = 'marc-admin/getkey';

  Future<KeyModel> getKey(String req) async {
    Map<String, dynamic> responseString = await performNetworkOperation(Get_key, req, API_TYPE.POST);
    KeyModel response = KeyModel.fromJson(responseString);
    await SharedPrefSingleton().putKeyToken(response.data ?? "");
    return response;
  }

  Future<LoginModel> performLogin(String req) async {
    Map<String, dynamic> responseString = await performNetworkOperation(LOGIN_API, req, API_TYPE.POST);
    LoginModel response = LoginModel();
    response.readJson(responseString);
    if (response.marcTokan!=null && response.marcTokan!.isNotEmpty){
      await SharedPrefSingleton().putAccessToken(response.marcTokan ?? "");
    }
    return response;
  }

  Future<String> forgotPassword(String req) async {
    Map<String, dynamic> responseString = await performNetworkOperation(Forgot_API, req, API_TYPE.POST);
    return "" ;
  }
}

