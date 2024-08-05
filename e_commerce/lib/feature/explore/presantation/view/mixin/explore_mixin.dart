import 'package:e_commerce/feature/explore/presantation/view/explore_page.dart';
import 'package:flutter/material.dart';

mixin ExploreMixin on State<ExplorePage> {
  @override
  void initState() {
    super.initState();
  }

  final Map<String, String> optionImages = {
    'Vegetarian': 'assets/images/vegetarian.png',
    'Side': 'assets/images/side.png',
    'Seafood': 'assets/images/seafood.png',
    'Dessert': 'assets/images/dessert.png',
    'Fast Food': 'assets/images/fast_food.png',
    'Beef': 'assets/images/beef.png',
    'Pasta': 'assets/images/pasta.png',
    'Wine': 'assets/images/wine.png',
  };
  final List<Color> colors = [
    Color(0xFFB7DFF5).withOpacity(0.25),
    Color(0xFFFDE598).withOpacity(0.25),
    Color(0xFFD3B0E0).withOpacity(0.25),
    Color(0xFFF7A593).withOpacity(0.25),
    Color(0xFFF8A44C).withOpacity(0.1),
    Color(0xFF53B175).withOpacity(0.1),
    Color(0xFFB7DFF5).withOpacity(0.25),
    Color(0xFFFDE598).withOpacity(0.25),
    Color(0xFFD3B0E0).withOpacity(0.25),
    Color(0xFFF7A593).withOpacity(0.25),
    Color(0xFFF8A44C).withOpacity(0.1),
    Color(0xFF53B175).withOpacity(0.1),
  ];

  final List<String> image = [
    'assets/images/banner.png',
    'assets/images/seafood.png',
    'assets/images/banner.png',
    'assets/images/dessert.png',
    'assets/images/chicken.png',
    'assets/images/desert.jpeg',
    'assets/images/chicken.png',
    'assets/images/chicken.png',
    'assets/images/chicken.png',
    'assets/images/seafood.png',
    'assets/images/chicken.png',
    'assets/images/chicken.png',
    'assets/images/chicken.png',
    'assets/images/chicken.png',
  ];
}
