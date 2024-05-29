import 'package:flutter/material.dart';
import 'package:tazz_app/domain/category.dart';

class Restaurant {
  Restaurant({
    required this.name,
    required this.category,
    required this.products
  });

  final String name;
  final Category category;
  final Map<String, double> products;

  bool isFavorite = false;
}