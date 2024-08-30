import 'package:ecommerce_android_app/features/accounts/widgets/account_btn.dart';
import 'package:flutter/material.dart';

class TopBtn extends StatefulWidget {
  const TopBtn({super.key});

  @override
  State<TopBtn> createState() => _TopBtnState();
}

class _TopBtnState extends State<TopBtn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountBtn(
              ontap: () {},
              text: 'Your Orders',
            ),
            AccountBtn(
              ontap: () {},
              text: 'Turn Seller',
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            AccountBtn(
              ontap: () {},
              text: 'Logout',
            ),
            AccountBtn(
              ontap: () {},
              text: 'Wishlist',
            ),
          ],
        ),
      ],
    );
  }
}
