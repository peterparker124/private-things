

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marc/core/route/route_constants.dart';
import 'package:marc/feature/screen/login/ui/forgot_screen.dart';
import 'package:marc/feature/screen/login/ui/login_screen.dart';
import 'package:marc/feature/screen/splash/splash_screen.dart';
import 'package:marc/feature/screen/tabs/affilate_screen/data/search_connection.dart';
import 'package:marc/feature/screen/tabs/affilate_screen/ui/user_list.dart';
import 'package:marc/feature/screen/tabs/home/home_screen.dart';
import 'package:marc/feature/screen/tabs/profile/profile_screen.dart';
import 'package:marc/feature/screen/tabs/tab_bar.dart';


class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //////// Login Flow Screens ////////
      case SPLASH_SCREEN:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case LOGIN_SCREEN:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case FORGOT_PASSWORD_SCREEN:
        return MaterialPageRoute(builder: (_) => ForgotScreen());
      case DASHBOARD_SCREEN:
        return MaterialPageRoute(builder: (_) => TabBarScreen());
      case PROFILE_SCREEN:
        var user = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => ProfileScreen(user));
      case USER_LIST_SCREEN:
        var user = settings.arguments as SearchConnection;
        return MaterialPageRoute(builder: (_) => UserList(user));


      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(child: Text('This screen is under development. ${settings.name}')),
                ));
    }
  }
}

pushNamed(BuildContext context, String routeName, {var args}) {
  Navigator.pushNamed(context, routeName, arguments: args);
}

pushNamedAndClearStack(BuildContext context, String routeName, {var args}) {
  Navigator.of(context).pushNamedAndRemoveUntil(routeName, (route) => false, arguments: args);
}


pushNamedAndClearStackWithoutAnim(BuildContext context, String routeName, {var args}) {
  Navigator.of(context).pushReplacement(
    CustomPageRoute(
      builder: (BuildContext context) {
        return routeName == LOGIN_SCREEN ? LoginScreen() : TabBarScreen();
      },
    ),
  );
}

class CustomPageRoute extends MaterialPageRoute {
  CustomPageRoute({builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}