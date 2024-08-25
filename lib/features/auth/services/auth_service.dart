import 'package:ecommerce_android_app/constants/error_handling.dart';
import 'package:ecommerce_android_app/constants/globalvaariables.dart';
import 'package:ecommerce_android_app/constants/utils.dart';
import 'package:ecommerce_android_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService {
  void signUpUser(
      {required BuildContext context,
      required String email,
      required String password,
      required String name}) async {
    try {
      User user = User('', name, email, password, '', '', '');

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=utf-8',
        },
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, "Account Has been successfully created");
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
