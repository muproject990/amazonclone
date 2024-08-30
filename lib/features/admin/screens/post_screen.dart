import 'package:ecommerce_android_app/constants/globalvaariables.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Products'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () {},
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
