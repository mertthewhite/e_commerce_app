import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/product/database/hive/constants/hive_database_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

mixin HiveDatabaseManagerFavourite {
  static final favouriteBox =
      Hive.box<MealModel>(HiveDatabaseConstants.favouriteBox);

  Future<void> addFavouriteToHive(MealModel favourite) async {
    await favouriteBox.put(favourite.idMeal, favourite);
  }

  Future<void> removeFavouriteFromHive(String idMeal) async {
    await favouriteBox.delete(idMeal);
  }

  Future<List<MealModel>> loadFavouritesFromHive() async {
    final favourites = favouriteBox.values.toList();
    return favourites;
  }

  Future<void> onHiveAddToFavourite(MealModel favourite) async {
    await favouriteBox.put(favourite.idMeal, favourite);
  }

  Future<void> clearAllFavouritesFromHive() async {
    await favouriteBox.clear();
  }

  Future<void> updateFavouriteRating(
      String idMeal, MealModel updatedMeal) async {
    final hiveIndex = favouriteBox.values
        .toList()
        .indexWhere((meal) => meal.idMeal == idMeal);

    if (hiveIndex != -1) {
      await favouriteBox.putAt(hiveIndex, updatedMeal);
    }
  }
}
