import 'package:e_commerce/feature/explore/presantation/view/subview/explore_search.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/feature/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin ExploreMealSearchPageMixin on State<ExploreMealSearchPage> {
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
}
