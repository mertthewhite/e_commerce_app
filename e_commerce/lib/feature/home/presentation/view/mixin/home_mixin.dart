import 'dart:math';

import 'package:e_commerce/feature/explore/presantation/bloc/explore_bloc.dart';
import 'package:e_commerce/feature/home/presentation/bloc/home_bloc.dart';
import 'package:e_commerce/feature/home/presentation/view/home_page.dart';
import 'package:e_commerce/product/database/hive/core/hive_database_manager.dart';
import 'package:e_commerce/product/utility/gen/assets.gen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin HomeMixin on State<HomePage> {
  List<int> randomIndices = [];
  @override
  void initState() {
    super.initState();
    _generateRandomIndices();
    context.read<ExploreBloc>().add(FetchExploreCategory());
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

  List<String> items = [
    Assets.images.banner2.path,
    Assets.images.banner3.path,
    Assets.images.banner4.path,
  ];

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
