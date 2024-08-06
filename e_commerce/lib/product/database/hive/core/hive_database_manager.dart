import 'dart:async';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/feature/home/data/models/type_adapter.dart';
import 'package:e_commerce/product/database/hive/constants/hive_database_constants.dart';
import 'package:e_commerce/product/database/hive/core/mixin/hive_database_manger_mixin.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDatabaseManager with HiveDatabaseManagerMixin {
  Future<void> init() async {
    await Hive.initFlutter();

    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(MealModelAdapter());
    } else {}

    await Hive.openBox<MealModel>(HiveDatabaseConstants.productModelBox);
    await Hive.openBox<MealModel>(HiveDatabaseConstants.favouriteBox);
  }

  static final favouriteBox =
      Hive.box<MealModel>(HiveDatabaseConstants.favouriteBox);
}
