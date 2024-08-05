import 'package:e_commerce/feature/favourite/presantation/bloc/favourite_bloc.dart';
import 'package:e_commerce/feature/favourite/presantation/widget/favourite_detail_button.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/utility/constants/number_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavButton extends StatelessWidget {
  const FavButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: context.dynamicHeight(NumberConstants.zeroPointZeroFive),
      left: context.dynamicWidth(NumberConstants.zeroPointZeroFive),
      right: context.dynamicWidth(NumberConstants.zeroPointZeroFive),
      child: FavouriteDetailButton(
          index: context.read<FavouriteBloc>().state.index),
    );
  }
}
