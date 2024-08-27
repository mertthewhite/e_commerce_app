import 'package:dartz/dartz.dart';
import 'package:e_commerce/feature/explore/data/model/meal_category_name_model.dart';
import 'package:e_commerce/feature/explore/domain/repositories/meal_repository.dart';
import 'package:e_commerce/product/errors/failures/failures.dart';

final class UCGetMealCategoryName {
  UCGetMealCategoryName({required MealCategoryNameRepository repository})
      : _repository = repository;

  final MealCategoryNameRepository _repository;

  Future<Either<Failure, List<MealCategoryNameModel>>> getMealCategoryName() {
    return _repository.getMealCategoryName();
  }
}
