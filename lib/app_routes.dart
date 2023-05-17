import 'package:get/get.dart';
import 'package:insta_clone_flutter/ui/screens/login_screen.dart';
import 'package:insta_clone_flutter/ui/screens/register_screen.dart';

class RouteNames {
  //static String responsiveScreen ="/responsiveScreen";
  static String loginScreen = "/loginScreen";
  static String registerScreen = "/registerScreen";
}

class AppRoute {
  static final route = [
    GetPage(name: RouteNames.loginScreen, page: () => LoginScreen()),
    GetPage(name: RouteNames.registerScreen, page: () => RegisterScreen()),
    //GetPage(name: RouteNames.responsiveScreen, page: ()=>ResponsiveLayout());
  ];
}
