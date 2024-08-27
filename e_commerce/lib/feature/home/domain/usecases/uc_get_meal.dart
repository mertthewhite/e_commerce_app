import 'package:dartz/dartz.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/feature/home/domain/repositories/meal_repository.dart';
import 'package:e_commerce/product/errors/failures/failures.dart';

final class UCGetMeal {
  UCGetMeal({required MealRepository repository}) : _repository = repository;

  final MealRepository _repository;

  Future<Either<Failure, List<MealModel>>> getMeal() {
    return _repository.getMeal();
  }

  Future<Either<Failure, List<MealModel>>> getSearchMeal(String search) {
    return _repository.getSearchMeal(search);
  }
}
