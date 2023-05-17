import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_clone_flutter/app_routes.dart';
import 'package:insta_clone_flutter/core/bindings/init_binding.dart';

void main() {
  runApp(const InstaApp());
}

class InstaApp extends StatelessWidget {
  const InstaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Insta Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteNames.dashBoardScreen,
      getPages: AppRoute.route,
      initialBinding: InitBinding(),
    );
  }
}
