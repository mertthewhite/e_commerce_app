import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/feature/explore/data/datasources/remote/meal_remote_datasource.dart';
import 'package:e_commerce/feature/explore/data/model/meal_category_name_model.dart';
import 'package:e_commerce/feature/explore/domain/repositories/meal_repository.dart';
import 'package:e_commerce/product/errors/exceptions/exceptions.dart';
import 'package:e_commerce/product/errors/failures/failures.dart';
import 'package:flutter/material.dart';

final class MealCategoryNameRepositoryImpl
    implements MealCategoryNameRepository {
  MealCategoryNameRepositoryImpl({
    required MealCategoryNameRemoteDatasource dataSource,
  }) : _dataSource = dataSource;

  final MealCategoryNameRemoteDatasource _dataSource;
  @override
  Future<Either<Failure, List<MealCategoryNameModel>>>
      getMealCategoryName() async {
    try {
      final response = await _dataSource.getMealCategoryName();
      return right(response);
    } on DioException {
      return left(NetworkFailure());
    } on NullResponseException {
      return left(NullResponseFailure());
    } catch (e) {
      debugPrint(e.toString());
      return left(UnknownFailure());
    }
  }
}
