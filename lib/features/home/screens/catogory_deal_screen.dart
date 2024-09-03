import 'package:ecommerce_android_app/constants/globalvaariables.dart';
import 'package:flutter/material.dart';

class CatogoryDealScreen extends StatefulWidget {
  static const String routeName = '/category-deals';
  final String category;
  const CatogoryDealScreen({super.key, required this.category});

  @override
  State<CatogoryDealScreen> createState() => _CatogoryDealScreenState();
}

class _CatogoryDealScreenState extends State<CatogoryDealScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Text(widget.category),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            alignment: Alignment.topLeft,
            child: Text(
              'Discover deals for this ${widget.category}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
