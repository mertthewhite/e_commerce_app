import 'package:e_commerce/feature/favourite/presantation/bloc/favourite_bloc.dart';
import 'package:e_commerce/feature/home/presentation/view/sub_view/product_detail_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin ProductDetailMixin on State<ProductDetailPage> {
  void initState() {
    super.initState();
    context.read<FavouriteBloc>().add(LoadFavouritesEvent());
  }

  bool isExpanded = false;

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
