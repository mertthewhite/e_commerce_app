import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/feature/home/data/datasources/remote/meal_remote_datasource.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/feature/home/domain/repositories/meal_repository.dart';
import 'package:e_commerce/product/errors/exceptions/exceptions.dart';
import 'package:e_commerce/product/errors/failures/failures.dart';
import 'package:flutter/material.dart';

final class MealRepositoryImpl implements MealRepository {
  MealRepositoryImpl({required MealRemoteDatasource dataSource})
      : _dataSource = dataSource;

  final MealRemoteDatasource _dataSource;
  @override
  Future<Either<Failure, List<MealModel>>> getMeal() async {
    try {
      final response = await _dataSource.getMeal();
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

  Future<Either<Failure, List<MealModel>>> getSearchMeal(
    String search,
  ) async {
    try {
      final response = await _dataSource.getSearchMeal(
        search,
      );
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
