
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:marc/core/route/my_router.dart';
import 'package:marc/core/route/route_constants.dart';
import 'package:marc/utils/SizeConfig.dart';
import 'package:marc/utils/my_color.dart';
import 'package:marc/utils/shared_pref_util.dart';


class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    checkLogin();
  }
  checkLogin() async {
    String? token = await SharedPrefSingleton().getAccessToken();
    debugPrint(token);
    if (token == null){
      Future.delayed(const Duration(milliseconds: 1500), () {
        pushNamedAndClearStackWithoutAnim(context, LOGIN_SCREEN);
      });
    } else {
      Future.delayed(const Duration(milliseconds: 1500), () {
        pushNamedAndClearStackWithoutAnim(context, LOGIN_SCREEN);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (SizeConfig.screenWidth == 0.0) SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorResources.white,
      body: Center(
          child:  Image.asset('assets/images/logo.png', fit: BoxFit.contain, height: 150,),
      ),
    );
  }
}
