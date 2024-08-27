import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:e_commerce/feature/explore/data/model/meal_category_name_model.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/product/errors/exceptions/exceptions.dart';
import 'package:e_commerce/product/mixin/handle_request_mixin.dart';
import 'package:e_commerce/product/network/core/product_service_path.dart';
import 'package:e_commerce/product/network/manager/network_client.dart';

abstract interface class MealCategoryNameRemoteDatasource {
  Future<List<MealCategoryNameModel>> getMealCategoryName();
}

final class MealCategoryNameRemoteDataSourceImpl
    with HandleRequestMixin
    implements MealCategoryNameRemoteDatasource {
  MealCategoryNameRemoteDataSourceImpl({required NetworkClient networkClient})
      : _networkClient = networkClient;

  final NetworkClient _networkClient;

  @override
  Future<List<MealCategoryNameModel>> getMealCategoryName() async {
    try {
      final response = await _networkClient.get<Map<String, dynamic>>(
          ServicePath.getMealCategory.value,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
            },
          ));

      if (response.data == null || response.data!['meals'] == null) {
        throw NullResponseException();
      }

      final mealList = (response.data!['meals'] as List)
          .map((meal) => MealCategoryNameModel.fromJson(
              json.decode(json.encode(meal)) as Map<String, dynamic>))
          .toList();

      print('Meal List: $mealList');

      return mealList;
    } on DioException catch (e) {
      print("Error: $e");

      throw DioException(requestOptions: e.requestOptions, message: e.message);
    } catch (e, stackTrace) {
      print('Error: $e, StackTrace: $stackTrace');
      throw UnknownException();
    }
  }
}
