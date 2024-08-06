import 'dart:async';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/feature/home/data/models/type_adapter.dart';
import 'package:e_commerce/product/database/hive/constants/hive_database_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

@immutable
class HiveDatabaseManager {
  Future<void> init() async {
    await Hive.initFlutter();

    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(MealModelAdapter());
    } else {}

    await Hive.openBox<MealModel>(HiveDatabaseConstants.productModelBox);
    await Hive.openBox<MealModel>(HiveDatabaseConstants.favouriteBox);
  }

  static final cartBox =
      Hive.box<MealModel>(HiveDatabaseConstants.productModelBox);
  static final favouriteBox =
      Hive.box<MealModel>(HiveDatabaseConstants.favouriteBox);

  /// product model box
  Future<void> allRemoveMealFromHiveBox(String mealId) async {
    final mealsToRemove =
        cartBox.values.where((m) => m.idMeal == mealId).toList();

    for (var mealToRemove in mealsToRemove) {
      final index = cartBox.values.toList().indexOf(mealToRemove);
      if (index != -1) {
        await cartBox.deleteAt(index);
      }
    }
  }

  Future<Map<MealModel, int>> getAddedMeals() async {
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

  Future<void> addMealToHiveBox(MealModel meal) async {
    try {
      await cartBox.add(meal);
    } catch (e) {
      print('Hive box\'a eklenirken hata oluştu: $e');
    }
  }

  Future<void> clearCart() async {
    try {
      await cartBox.clear();
    } catch (error) {
      print('Sepet temizlenirken hata oluştu: $error');
    }
  }

  Future<void> singleRemoveMealFromHiveBox(MealModel meal) async {
    try {
      final index =
          cartBox.values.toList().indexWhere((m) => m.idMeal == meal.idMeal);
      if (index != -1) {
        await cartBox.deleteAt(index);
      }
    } catch (e) {
      print('Hive box\'tan silinirken hata oluştu: $e');
    }
  }

  /// product model box
  Future<void> clear() async {
    await Hive.deleteBoxFromDisk(HiveDatabaseConstants.productModelBox);
    await Hive.deleteBoxFromDisk(HiveDatabaseConstants.favouriteBox);
  }
}
