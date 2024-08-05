import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/feature/home/presentation/bloc/home_bloc.dart';
import 'package:e_commerce/feature/home/presentation/view/sub_view/search_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin SearchMixin on State<SearchPage> {
  List<MealModel> allMeals = [];
  List<MealModel> filteredMeals = [];
  bool isLoading = false;
  bool hasError = false;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
  }

  Future<void> loadData(String search) async {
    setState(() {
      isLoading = true;
      hasError = false;
    });

    try {
      final meals =
          await context.read<HomeBloc>().repository.fetchSearchMeals(search);
      setState(() {
        allMeals = meals;
        filteredMeals = meals;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        hasError = true;
        errorMessage = e.toString();
      });
    }
  }

  void onSearchChanged(String query) {
    loadData(query);
  }

  List<String> image = [
    'assets/images/banner.png',
    'assets/images/seafood.png',
    'assets/images/banner.png',
    'assets/images/dessert.png',
    'assets/images/chicken.png',
    'assets/images/desert.jpeg',
    'assets/images/chicken.png',
    'assets/images/chicken.png',
    'assets/images/chicken.png',
    'assets/images/seafood.png',
    'assets/images/chicken.png',
    'assets/images/chicken.png',
    'assets/images/chicken.png',
    'assets/images/chicken.png',
    'assets/images/chicken.png',
  ];
}
