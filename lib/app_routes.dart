import 'package:get/get.dart';
import 'package:insta_clone_flutter/ui/screens/dashboard_screen.dart';
import 'package:insta_clone_flutter/ui/screens/login_screen.dart';
import 'package:insta_clone_flutter/ui/screens/register_screen.dart';
import 'package:insta_clone_flutter/ui/screens/splash_screen.dart';

class RouteNames {
  static String dashBoardScreen = "/dashBoardScreen";
  static String loginScreen = "/loginScreen";
  static String registerScreen = "/registerScreen";
  static String splash = "/splash";
}

class AppRoute {
  static final route = [
    GetPage(
      name: RouteNames.splash,
      page: () => const SplashPage(),
    ),
    GetPage(name: RouteNames.loginScreen, page: () => LoginScreen()),
    GetPage(name: RouteNames.registerScreen, page: () => RegisterScreen()),
    GetPage(name: RouteNames.dashBoardScreen, page: () => DashBoardScreen()),
    //GetPage(name: RouteNames.dashBoardScreen, page: ()=>DashBoardScreen()),
  ];
}
