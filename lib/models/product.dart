// import 'dart:convert';

// class Product {
//   final String name;
//   final String description;
//   final double quantity;
//   final List<String> images;
//   final String category;
//   final double price;
//   final String? id;
//   Product({
//     required this.name,
//     required this.description,
//     required this.quantity,
//     required this.images,
//     required this.category,
//     required this.price,
//     this.id,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'name': name,
//       'description': description,
//       'quantity': quantity,
//       'images': images,
//       'category': category,
//       'price': price,
//       '_id': id,
//     };
//   }

//   factory Product.fromMap(Map<String, dynamic> map) {
//     return Product(
//       name: map['name'] ?? '',
//       description: map['description'] ?? '',
//       quantity: map['quantity']?.toDouble() ?? 0.0,
//       images: List<String>.from(map['images']),
//       category: map['category'] ?? '',
//       price: map['price']?.toDouble() ?? 0.0,
//       id: map['_id'],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Product.fromJson(String source) =>
//       Product.fromMap(json.decode(source));
// }

import 'dart:convert';

import 'package:ecommerce_android_app/models/rating.dart';

class Product {
  final String name;
  final String description;
  final double quantity;
  final List<String> images;
  final String category;
  final double price;
  final String? id;
  final List<Rating>? rating;
  Product({
    required this.name,
    required this.description,
    required this.quantity,
    required this.images,
    required this.category,
    required this.price,
    this.id,
    this.rating,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'quantity': quantity,
      'images': images,
      'category': category,
      'price': price,
      '_id': id,
      'ratings': rating
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      quantity: (map['quantity'] is int)
          ? (map['quantity'] as int).toDouble()
          : (map['quantity'] is double)
              ? map['quantity'] as double
              : 0.0,
      images: List<String>.from(map['images']),
      category: map['category'] ?? '',
      price: (map['price'] is int)
          ? (map['price'] as int).toDouble()
          : (map['price'] is double)
              ? map['price'] as double
              : 0.0,
      id: map['_id'],
      rating: map['ratings'] != null
          ? List<Rating>.from(
              map['ratings']?.map(
                (x) => Rating.fromMap(x),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
