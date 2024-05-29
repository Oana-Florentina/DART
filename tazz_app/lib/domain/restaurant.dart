import 'package:flutter/material.dart';
import 'package:tazz_app/domain/category.dart';
import 'package:tazz_app/domain/product.dart';

class Restaurant {
  Restaurant({
    required this.name,
    required this.category,
    required this.products
  });

  final String name;
  final Category category;
  final List<Product> products;

  bool isFavorite = false;
}