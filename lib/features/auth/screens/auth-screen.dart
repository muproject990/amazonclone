import 'package:ecommerce_android_app/common/widgets/custom_button.dart';
import 'package:ecommerce_android_app/common/widgets/custom_textfield.dart';
import 'package:ecommerce_android_app/constants/globalvaariables.dart';
import 'package:ecommerce_android_app/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = 'auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _authMode = Auth.signin;
  final AuthService authService = AuthService();

  final _signUpformKey = GlobalKey<FormState>();
  final _signInformKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome",
              style: TextStyle(fontSize: 26),
            ),
            ListTile(
              tileColor: _authMode == Auth.signup
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
              title: const Text(
                "Create Account",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Radio(
                value: Auth.signup,
                groupValue: _authMode,
                activeColor: GlobalVariables.secondaryColor,
                onChanged: (Auth? value) {
                  setState(() {
                    _authMode = value!;
                  });
                },
              ),
            ),
            if (_authMode == Auth.signup)
              Container(
                padding: const EdgeInsets.all(9),
                color: GlobalVariables.backgroundColor,
                child: Form(
                  key: _signUpformKey,
                  child: Column(
                    children: [
                      CustomTextfield(
                        controller: _nameController,
                        hintText: "Name",
                      ),
                      const SizedBox(height: 10),
                      CustomTextfield(
                        controller: _emailController,
                        hintText: "Email",
                      ),
                      const SizedBox(height: 10),
                      CustomTextfield(
                        controller: _passwordController,
                        obscureText: true,
                        hintText: "Password",
                      ),
                      const SizedBox(height: 10),
                      CustomButton(
                        text: "Sign Up",
                        onTap: () {
                          print("tapped");
                          if (_signUpformKey.currentState!.validate()) {
                            signUpUser();
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            ListTile(
              tileColor: _authMode == Auth.signin
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
              title: const Text(
                "Sign in...",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Radio(
                value: Auth.signin,
                groupValue: _authMode,
                activeColor: GlobalVariables.secondaryColor,
                onChanged: (Auth? value) {
                  setState(() {
                    _authMode = value!;
                  });
                },
              ),
            ),
            if (_authMode == Auth.signin)
              Container(
                padding: const EdgeInsets.all(9),
                color: GlobalVariables.backgroundColor,
                child: Form(
                  key: _signInformKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      CustomTextfield(
                        controller: _emailController,
                        hintText: "Email",
                      ),
                      const SizedBox(height: 10),
                      CustomTextfield(
                        controller: _passwordController,
                        hintText: "Password",
                        obscureText: true,
                      ),
                      const SizedBox(height: 10),
                      CustomButton(
                        text: "Sign In",
                        onTap: () {},
                      )
                    ],
                  ),
                ),
              ),
          ],
        ),
      )),
    );
  }
}
