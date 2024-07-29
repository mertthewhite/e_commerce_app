import 'dart:math';

import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/feature/home/presentation/bloc/home_bloc.dart';
import 'package:e_commerce/feature/home/presentation/view/home_page.dart';
import 'package:e_commerce/product/database/hive/core/hive_database_manager.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin HomeMixin on State<HomePage> {
  List<int> randomIndices = [];
  @override
  void initState() {
    super.initState();
    _generateRandomIndices();
  }

  final hiveManager = HiveDatabaseManager();

  void _generateRandomIndices() {
    final random = Random();
    final int itemCount = 5;
    final int totalItems = context.read<HomeBloc>().state.meals.length;

    final Set<int> indicesSet = {};

    while (indicesSet.length < itemCount && indicesSet.length < totalItems) {
      indicesSet.add(random.nextInt(totalItems));
    }

    randomIndices = indicesSet.toList();
  }
}
