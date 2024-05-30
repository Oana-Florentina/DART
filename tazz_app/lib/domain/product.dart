import 'package:flutter/material.dart';
import 'package:tazz_app/domain/category.dart';

class Product {
  Product({
    required this.name,
    required this.price,
    required this.category
  });

  final String name;
  final double price;
  final FoodCategory category;
}