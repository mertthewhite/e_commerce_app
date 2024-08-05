import 'package:e_commerce/feature/explore/presantation/bloc/explore_bloc.dart';
import 'package:e_commerce/feature/explore/presantation/view/mixin/explore_mixin.dart';
import 'package:e_commerce/feature/explore/presantation/widget/explore_header_widget.dart';
import 'package:e_commerce/feature/explore/presantation/widget/explore_page_categor_card.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/utility/constants/number_constants.dart';
import 'package:e_commerce/product/widget/appbar/custom_appbar.dart';
import 'package:e_commerce/product/widget/spacer/dynamic_vertical_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> with ExploreMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreBloc, ExploreState>(
      builder: (context, state) {
        if (state.mealCategoryModel.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scaffold(
            appBar: const CustomGeneralAppBar(
                title: 'Explore', showBackButton: false),
            body: SingleChildScrollView(
              child: Padding(
                padding: context.paddingHorizontalDefault,
                child: Column(
                  children: [
                    const ExploreHeaderWidget(),
                    Column(
                      children: [
                        const VerticalSpace.small(),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: NumberConstants.sixInt,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: NumberConstants.twoInt,
                            crossAxisSpacing: context.dynamicWidth(
                                NumberConstants.zeroPointZeroFive),
                            mainAxisSpacing: context.dynamicHeight(
                                NumberConstants.zeroPointZeroOne),
                            childAspectRatio: NumberConstants.zeroPointEight,
                          ),
                          itemBuilder: (context, index) {
                            return ExplorePageCategorCard(
                              image: image,
                              borderColor: colors[index == NumberConstants.zero
                                  ? index + NumberConstants.oneInt
                                  : index - NumberConstants.oneInt],
                              color: colors[index],
                              onTap: () {
                                context.push(
                                  '/explore_category_detail_page',
                                  extra: [
                                    context
                                        .read<ExploreBloc>()
                                        .state
                                        .mealCategoryModel[
                                            index == NumberConstants.oneInt
                                                ? NumberConstants.nineInt
                                                : index & index ==
                                                        NumberConstants.fourInt
                                                    ? NumberConstants.eightInt
                                                    : index]
                                        .strCategory,
                                  ],
                                );
                              },
                              state: state,
                              index: index == NumberConstants.oneInt
                                  ? NumberConstants.nineInt
                                  : index & index == NumberConstants.fourInt
                                      ? NumberConstants.eightInt
                                      : index,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
