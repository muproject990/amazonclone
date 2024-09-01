import 'package:ecommerce_android_app/constants/globalvaariables.dart';
import 'package:ecommerce_android_app/features/admin/screens/admin_screen.dart';
import 'package:ecommerce_android_app/features/auth/screens/auth-screen.dart';
import 'package:ecommerce_android_app/features/auth/services/auth_service.dart';
import 'package:ecommerce_android_app/features/home/screens/home_screen.dart';
import 'package:ecommerce_android_app/providers/user_provider.dart';
import 'package:ecommerce_android_app/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme: const ColorScheme.light(
            primary: GlobalVariables.secondaryColor,
          ),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
        ),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: Provider.of<UserProvider>(context).user.token.isNotEmpty
            ? Provider.of<UserProvider>(context).user.type == 'user'
                ? const HomeScreen()
                : const AdminScreen()
            : const AuthScreen());
  }
}
