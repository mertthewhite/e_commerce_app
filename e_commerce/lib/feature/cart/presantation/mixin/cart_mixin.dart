import 'package:e_commerce/feature/cart/presantation/view/cart_page.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/product/database/hive/constants/hive_database_constants.dart';
import 'package:e_commerce/product/database/hive/core/hive_database_manager.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

mixin CartPageMixin on State<CartPage> {
  late final HiveDatabaseManager _hiveManager;
  late Box<MealModel> cartBox;

  @override
  void initState() {
    super.initState();
    _hiveManager = HiveDatabaseManager();
    _hiveManager.init().then((_) {});
    cartBox = Hive.box<MealModel>(HiveDatabaseConstants.productModelBox);
  }

  Map<MealModel, int> getAddedMeals() {
    final addedMeals = <MealModel, int>{};

    for (var meal in cartBox.values) {
      if (addedMeals.containsKey(meal)) {
        addedMeals[meal] = addedMeals[meal]! + 1;
      } else {
        addedMeals[meal] = 1;
      }
    }

    return addedMeals;
  }

  double getTotalPrice(Map<MealModel, int> addedMeals) {
    double totalPrice = 0.0;
    for (var entry in addedMeals.entries) {
      totalPrice += (entry.key.price) * entry.value;
    }
    return totalPrice;
  }
}
