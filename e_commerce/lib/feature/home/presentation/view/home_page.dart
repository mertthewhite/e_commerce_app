import 'package:e_commerce/feature/home/presentation/bloc/home_bloc.dart';
import 'package:e_commerce/feature/home/presentation/view/mixin/home_mixin.dart';
import 'package:e_commerce/feature/home/presentation/widget/home_page_best_saller_row.dart';
import 'package:e_commerce/feature/home/presentation/widget/home_page_exclusive_offer_row.dart';
import 'package:e_commerce/feature/home/presentation/widget/home_page_groceries_row.dart';
import 'package:e_commerce/feature/home/presentation/widget/home_page_header.dart';
import 'package:e_commerce/feature/home/presentation/widget/home_page_offer_title.dart';
import 'package:e_commerce/feature/home/presentation/widget/home_page_search_bar.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/utility/constants/number_constants.dart';
import 'package:e_commerce/product/widget/spacer/dynamic_vertical_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              padding: context.paddingAllDefault * 1.4,
              child: Column(
                children: [
                  const HomePageHeader(),
                  const VerticalSpace.small(),
                  const HomePageSearchBar(),
                  const VerticalSpace.small(),
                  const VerticalSpace.small(),
                  const HomePageOfferTitle(),
                  const VerticalSpace.small(),
                  HomePageExclusiveOfferRow(
                    image: image,
                    state: state,
                  ),
                  const VerticalSpace.small(),
                  HomePageBestSailerRow(
                    image: image,
                    randomIndices: randomIndices,
                    state: state,
                  ),
                  const VerticalSpace.small(),
                  HomePageGroceriesRow(
                    image: image,
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
