import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/feature/home/presentation/bloc/home_bloc.dart';
import 'package:e_commerce/feature/home/presentation/view/sub_view/meal_search_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin MealSearchMixin on State<MealSearchPage> {
  List<MealModel> allMeals = [];
  List<MealModel> filteredMeals = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    allMeals = await context.read<HomeBloc>().repository.fetchAllMeals();
    setState(() {
      filteredMeals = [];
    });
  }

  void runFilter(String enteredKeyword) {
    setState(() {
      if (enteredKeyword.isEmpty) {
        filteredMeals = [];
      } else {
        filteredMeals = allMeals
            .where((meal) =>
                meal.strIngredient2
                    ?.toLowerCase()
                    .contains(enteredKeyword.toLowerCase()) ??
                false)
            .toList();
      }
    });
  }

  bool isTapped = false;

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
