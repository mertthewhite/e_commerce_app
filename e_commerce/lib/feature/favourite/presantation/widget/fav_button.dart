import 'package:e_commerce/feature/favourite/presantation/bloc/favourite_bloc.dart';
import 'package:e_commerce/feature/favourite/presantation/widget/favourite_detail_button.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavButton extends StatelessWidget {
  const FavButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: context.dynamicHeight(0.02),
      left: context.dynamicWidth(0.05),
      right: context.dynamicWidth(0.05),
      child: FavouriteDetailButton(
          index: context.read<FavouriteBloc>().state.index),
    );
  }
}
