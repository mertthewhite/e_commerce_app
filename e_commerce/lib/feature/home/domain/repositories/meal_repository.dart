import 'package:dartz/dartz.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/product/errors/failures/failures.dart';

abstract interface class MealRepository {
  Future<Either<Failure, List<MealModel>>> getMeal();
  Future<Either<Failure, List<MealModel>>> getSearchMeal(String search);
}
