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
    }

    await Hive.openBox<MealModel>(HiveDatabaseConstants.productModelBox);
    await Hive.openBox<MealModel>(HiveDatabaseConstants.favouriteBox);
  }

  Future<void> clear() async {
    await Hive.deleteBoxFromDisk(HiveDatabaseConstants.productModelBox);
    await Hive.deleteBoxFromDisk(HiveDatabaseConstants.favouriteBox);
  }

  Future<Box<MealModel>> get _box async {
    return Hive.box<MealModel>(HiveDatabaseConstants.productModelBox);
  }

  Future<void> addProduct(MealModel productModel) async {
    if (productModel == null) {
      print('Product model is null');
      return;
    }
    final box = await Hive.openBox<MealModel>('cartBox');
    await box.put(productModel.idMeal, productModel);
  }

  Future<void> deleteProduct(String idMeal) async {
    final box = await _box;
    await box.delete(idMeal);
  }

  Future<List<MealModel>> getProducts() async {
    final box = Hive.box<MealModel>(HiveDatabaseConstants.productModelBox);
    return box.values.toList();
  }

  Future<void> addProducts(List<MealModel> products) async {
    final box = await _box;
    for (var product in products) {
      await box.put(product.idMeal, product);
    }
  }
}
