import 'dart:math';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:e_commerce/feature/cart/presantation/bloc/cart_bloc.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/feature/home/presentation/bloc/home_bloc.dart';
import 'package:e_commerce/feature/home/presentation/view/mixin/home_mixin.dart';
import 'package:e_commerce/feature/home/presentation/widget/animated_button_container.dart';
import 'package:e_commerce/feature/home/presentation/widget/corausel_slider_widget.dart';
import 'package:e_commerce/feature/home/presentation/widget/home_page_best_saller_row.dart';
import 'package:e_commerce/feature/home/presentation/widget/home_page_exclusive_offer_row.dart';
import 'package:e_commerce/feature/home/presentation/widget/home_page_groceries_row.dart';
import 'package:e_commerce/feature/home/presentation/widget/home_page_header.dart';
import 'package:e_commerce/feature/home/presentation/widget/home_page_offer_title.dart';
import 'package:e_commerce/feature/home/presentation/widget/home_page_search_bar.dart';
import 'package:e_commerce/feature/home/presentation/widget/meal_widget.dart';
import 'package:e_commerce/product/database/hive/core/hive_database_manager.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:e_commerce/product/widget/custom_carousel.dart';
import 'package:e_commerce/product/widget/spacer/dynamic_horizontal_spacer.dart';
import 'package:e_commerce/product/widget/spacer/dynamic_vertical_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomeMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: context.paddingAllDefault * 1.2,
              child: Column(
                children: [
                  const HomePageHeader(),
                  const VerticalSpace.small(),
                  const HomePageSearchBar(),
                  const VerticalSpace.small(),
                  carouselWidget(state),
                  const VerticalSpace.small(),
                  const HomePageOfferTitle(),
                  const VerticalSpace.small(),
                  HomePageExclusiveOfferRow(
                    state: state,
                  ),
                  const VerticalSpace.small(),
                  HomePageBestSallerRow(
                    randomIndices: randomIndices,
                    state: state,
                  ),
                  VerticalSpace.small(),
                  HomePageGroceriesRow(
                    randomIndex: randomIndices,
                    state: state,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
