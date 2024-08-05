import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/feature/home/presentation/bloc/home_bloc.dart';
import 'package:e_commerce/feature/home/presentation/widget/animated_button_container.dart';
import 'package:e_commerce/product/database/hive/core/hive_database_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MealWidget extends StatelessWidget {
  const MealWidget({
    required this.state,
    required this.model,
    required this.ingredient,
    required this.models,
    required this.hiveManager,
    required this.price,
    required this.image,
    Key? key,
    this.firstMeasure,
    this.secondMeasure,
    this.productName,
  }) : super(key: key);
  final HomeState state;
  final MealModel model;
  final String ingredient;
  final String? firstMeasure;
  final String? secondMeasure;
  final String? productName;
  final HiveDatabaseManager hiveManager;
  final List<MealModel> models;
  final List<String> image;
  final double price;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          GoRouter.of(context).push(
            '/product_detail_page',
            extra: {'selectedProduct': model},
          );
        },
        child: AnimatedButtonContainer(
          image: image,
          price: price,
          model: model,
          productName: productName ?? '',
          firstMeasure: firstMeasure ?? '',
          secondMeasure: secondMeasure ?? '',
          ingredient: ingredient,
        ));
  }
}
