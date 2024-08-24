import 'package:ecommerce_android_app/features/auth/screens/auth-screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AuthScreen(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: const Text("Screens doesnt exist"),
          ),
        ),
      );
  }
}
