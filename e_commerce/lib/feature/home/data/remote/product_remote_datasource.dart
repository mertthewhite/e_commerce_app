import 'dart:convert';
import 'package:e_commerce/feature/home/data/models/category/category_model.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  Future<List<MealModel>> fetchAllMeals() async {
    final response = await getRequest('/search.php?s=');
    return (response['meals'] as List<dynamic>)
        .map((mealJson) => MealModel.fromJson(mealJson as Map<String, dynamic>))
        .toList();
  }

  Future<List<MealModel>> fetchSearchMeals(String search) async {
    final response = await getRequest('/search.php?s=$search');
    return (response['meals'] as List<dynamic>)
        .map((mealJson) => MealModel.fromJson(mealJson as Map<String, dynamic>))
        .toList();
  }

  Future<List<MealCategory>> fetchMealCategoryName() async {
    final response = await getRequest('/list.php?c=list');
    final mealCategoryModel = MealCategoryModel.fromJson(response);
    return mealCategoryModel.meals;
  }

  Future<List<MealCategory>> fetchFilterCategoryMeal(String category) async {
    final response = await getRequest('/filter.php?i=$category');
    final mealCategoryModel = MealCategoryModel.fromJson(response);
    return mealCategoryModel.meals;
  }

  Future<Map<String, dynamic>> getRequest(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl$endpoint'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load data');
    }
  }
}

class GeneralRepository {
  final ApiService apiService;

  GeneralRepository({required this.apiService});

  Future<List<MealModel>> fetchAllMeals() async {
    try {
      return await apiService.fetchAllMeals();
    } catch (e) {
      print('Error fetching all meals: $e');
      return [];
    }
  }

  Future<List<MealCategory>> fetchMealCategoryName() async {
    try {
      return await apiService.fetchMealCategoryName();
    } catch (e) {
      print('Error fetching meal categories: $e');
      return [];
    }
  }

  Future<List<MealCategory>> fetchFilterCategoryMeal(String category) async {
    try {
      return await apiService.fetchFilterCategoryMeal(category);
    } catch (e) {
      print('Error fetching filtered category meals: $e');
      return [];
    }
  }

  Future<List<MealModel>> fetchSearchMeals(String search) async {
    try {
      return await apiService.fetchSearchMeals(search);
    } catch (e) {
      print('Error fetching search meals: $e');
      return [];
    }
  }
}
