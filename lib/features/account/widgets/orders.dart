import 'package:ecommerce_android_app/constants/globalvaariables.dart';
import 'package:ecommerce_android_app/features/account/widgets/single_product.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  // temporary list
  List list = [
    // 'https://images.unsplash.com/photo-1723920785346-d29bed210134?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDN8Ym84alFLVGFFMFl8fGVufDB8fHx8fA%3D%3D',
    'https://media.istockphoto.com/id/1401418727/photo/clouds-at-dawn.webp?a=1&s=612x612&w=0&k=20&c=NvBX_1ohOTdG8F7yuRIHs0RUgt050xPc6LhzW0Os7Q4=',
    'https://media.istockphoto.com/id/1401418727/photo/clouds-at-dawn.webp?a=1&s=612x612&w=0&k=20&c=NvBX_1ohOTdG8F7yuRIHs0RUgt050xPc6LhzW0Os7Q4=',
    'https://media.istockphoto.com/id/1401418727/photo/clouds-at-dawn.webp?a=1&s=612x612&w=0&k=20&c=NvBX_1ohOTdG8F7yuRIHs0RUgt050xPc6LhzW0Os7Q4=',
    'https://media.istockphoto.com/id/1401418727/photo/clouds-at-dawn.webp?a=1&s=612x612&w=0&k=20&c=NvBX_1ohOTdG8F7yuRIHs0RUgt050xPc6LhzW0Os7Q4=',
    'https://plus.unsplash.com/premium_photo-1706625696279-e2b81560ce34?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDh8fHxlbnwwfHx8fHw%3D'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: const Text(
                'Your Order ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 15),
              child: Text(
                'See All Order',
                style: TextStyle(
                  color: GlobalVariables.selectedNavBarColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),

        // Listview Builder for displaying the list of products

        Container(
            height: 170,
            padding: const EdgeInsets.only(
              left: 10,
              right: 0,
              top: 20,
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: ((context, index) {
                return SingleProduct(image: list[index]);
              }),
            )),
      ],
    );
  }
}
