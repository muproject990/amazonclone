import 'package:flutter/material.dart';

class AccountBtn extends StatelessWidget {
  final String text;
  final VoidCallback ontap;
  const AccountBtn({
    super.key,
    required this.text,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          // height: 10,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 0.0),
              borderRadius: BorderRadius.circular(50),
              color: Colors.white),
          child: OutlinedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black12.withOpacity(0.03),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                )),
            onPressed: ontap,
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
          )),
    );
  }
}
