import 'dart:io';
import 'package:ecommerce_android_app/constants/error_handling.dart';
import 'package:ecommerce_android_app/constants/globalvaariables.dart';
import 'package:ecommerce_android_app/providers/user_provider.dart';
import 'package:http/http.dart' as http;

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:ecommerce_android_app/constants/utils.dart';
import 'package:ecommerce_android_app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminServices {
  Future<void> sellBooks({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final cloudinary = CloudinaryPublic('djjxs2872', 'imagesEbook');
      List<String> imageUrls = [];
      for (var i = 0; i < images.length; i++) {
        CloudinaryResponse response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: name),
        );

        imageUrls.add(response.secureUrl);
        // print(imageUrls);
      }
      Product product = Product(
        name: name,
        description: description,
        quantity: quantity,
        images: imageUrls,
        category: category,
        price: price,
      );
      // String productJson = jsonEncode(product.toJson());

      // print(userProvider.user.token);
      http.Response res = await http.post(
        Uri.parse('$uri/admin/add-books'),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'token': userProvider.user.token,
        },
        body: product.toJson(),
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, "Product Added Sucessfully");
            Navigator.pop(context);
          });
    } catch (e) {
      print("Admin service Error Error :------- $e");
      showSnackBar(context, e.toString());
    }
  }
}

