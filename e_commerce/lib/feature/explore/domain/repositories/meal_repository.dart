import 'package:dartz/dartz.dart';
import 'package:e_commerce/feature/explore/data/model/meal_category_name_model.dart';
import 'package:e_commerce/product/errors/failures/failures.dart';

abstract interface class MealCategoryNameRepository {
  Future<Either<Failure, List<MealCategoryNameModel>>> getMealCategoryName();
}
