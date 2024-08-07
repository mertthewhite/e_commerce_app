import 'dart:async';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/feature/home/data/models/type_adapter.dart';
import 'package:e_commerce/product/database/hive/constants/hive_database_constants.dart';
import 'package:e_commerce/product/database/hive/core/mixin/hive_database_manager_favourite.dart';
import 'package:e_commerce/product/database/hive/core/mixin/hive_database_manager_product_mixin.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDatabaseManager
    with HiveDatabaseManagerFavourite, HiveDatabaseManagerProductMixin {
  Future<void> init() async {
    await Hive.initFlutter();
    _registerAdapter();
    await _openBox();
  }

  void _registerAdapter() {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(MealModelAdapter());
    } else {}
  }

  Future<void> _openBox() async {
    await Hive.openBox<MealModel>(HiveDatabaseConstants.productModelBox);
    await Hive.openBox<MealModel>(HiveDatabaseConstants.favouriteBox);
  }
}
