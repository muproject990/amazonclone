import 'package:ecommerce_android_app/constants/globalvaariables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Star extends StatelessWidget {
  final double rating;
  const Star({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      itemBuilder: (context, _) =>
          const Icon(Icons.star, color: GlobalVariables.secondaryColor),
      direction: Axis.horizontal,
      itemCount: 5,
      rating: rating,
      itemSize: 15,
    );
  }
}
