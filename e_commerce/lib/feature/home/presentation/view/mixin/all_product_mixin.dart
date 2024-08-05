import 'package:e_commerce/feature/home/presentation/bloc/home_bloc.dart';
import 'package:e_commerce/feature/home/presentation/view/sub_view/all_product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin AllProductMixin on State<AllProductPage> {
  List<String> selectedFiltered = [];

  @override
  void initState() {
    super.initState();
    _loadFilters();
  }

  Future<void> _loadFilters() async {
    final filters = await FilterStorage().loadFilters();
    setState(() {
      selectedFiltered = filters;
    });
    context.read<HomeBloc>().add(FilterMealsEvent(filters: selectedFiltered));
  }

  void openFilterBottomSheet() async {
    final selectedFilters = await showModalBottomSheet<List<String>>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) =>
          FilterBottomSheet(selectedFilters: selectedFiltered),
    );

    if (selectedFilters != null) {
      setState(() {
        selectedFiltered = selectedFilters;
      });
      await FilterStorage().saveFilters(selectedFiltered);
      context.read<HomeBloc>().add(FilterMealsEvent(filters: selectedFiltered));
    }
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
    'assets/images/seafood',
  ];
}
