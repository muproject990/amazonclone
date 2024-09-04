import 'package:ecommerce_android_app/features/admin/screens/add_product_screen.dart';
import 'package:ecommerce_android_app/features/auth/screens/auth-screen.dart';
import 'package:ecommerce_android_app/features/home/screens/catogory_deal_screen.dart';
import 'package:ecommerce_android_app/features/home/screens/home_screen.dart';
import 'package:ecommerce_android_app/features/search/screen/search_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    case AddProductScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddProductScreen(),
      );
    case CatogoryDealScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CatogoryDealScreen(
          category: category,
        ),
      );
    case SearchScreen.routeName:
      var query = routeSettings.arguments as String;

      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchScreen(
          query: query,
        ),
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
