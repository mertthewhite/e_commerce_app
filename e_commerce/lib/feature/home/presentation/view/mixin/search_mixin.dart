import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/feature/home/presentation/bloc/home_bloc.dart';
import 'package:e_commerce/feature/home/presentation/bloc/search_bloc.dart';
import 'package:e_commerce/feature/home/presentation/view/sub_view/search_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin SearchMixin on State<SearchPage> {
  @override
  void initState() {
    super.initState();
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
