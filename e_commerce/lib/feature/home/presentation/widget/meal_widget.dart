import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/feature/home/presentation/bloc/home_bloc.dart';
import 'package:e_commerce/feature/home/presentation/view/home_page.dart';
import 'package:e_commerce/feature/home/presentation/widget/animated_button_container.dart';
import 'package:e_commerce/product/database/hive/core/hive_database_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MealWidget extends StatelessWidget {
  final HomeState state;
  final MealModel model;
  final String ingredient;
  final String? firstMeasure;
  final String? secondMeasure;
  final String? productName;
  final HiveDatabaseManager hiveManager;
  final List<MealModel> models;

  final double price;
  const MealWidget({
    Key? key,
    required this.state,
    required this.model,
    required this.ingredient,
    required this.models,
    this.firstMeasure,
    this.secondMeasure,
    this.productName,
    required this.hiveManager,
    required this.price,
  }) : super(key: key);

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
          price: price,
          model: model,
          productName: productName ?? '',
          firstMeasure: firstMeasure ?? '',
          secondMeasure: secondMeasure ?? '',
          ingredient: ingredient,
        ));
  }
}
