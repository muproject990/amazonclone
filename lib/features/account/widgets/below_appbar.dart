import 'package:ecommerce_android_app/constants/globalvaariables.dart';
import 'package:ecommerce_android_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BelowAppbar extends StatelessWidget {
  const BelowAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
        decoration: const BoxDecoration(
          gradient: GlobalVariables.appBarGradient,
        ),
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: 10,
        ),
        child: Row(
          children: [
            RichText(
              text: TextSpan(
                  text: "Hello, ",
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: user.name,
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                      ),
                    ),
                  ]),
            ),
          ],
        ));
  }
}
