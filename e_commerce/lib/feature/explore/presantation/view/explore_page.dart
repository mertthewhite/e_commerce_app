import 'package:e_commerce/feature/explore/presantation/view/mixin/explore_mixin.dart';
import 'package:e_commerce/feature/explore/presantation/widget/explore_page_categor_card.dart';
import 'package:e_commerce/feature/explore/presantation/widget/explore_header_widget.dart';
import 'package:e_commerce/feature/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/widget/spacer/dynamic_vertical_spacer.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> with ExploreMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Text(
          "Find Products",
          style: context.textTheme.headlineMedium?.copyWith(
            color: const Color(0xFF000000),
            fontFamily: "Gilroy",
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          final mealCategories = context.read<HomeBloc>().state.meals;
          return SingleChildScrollView(
            child: Padding(
              padding: context.paddingHorizontalDefault,
              child: Column(
                children: [
                  ExploreHeaderWidget(),
                  Column(
                    children: [
                      VerticalSpace.small(),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 6,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: context.dynamicWidth(0.05),
                          mainAxisSpacing: context.dynamicHeight(0.01),
                          childAspectRatio: 0.8,
                        ),
                        itemBuilder: (context, index) {
                          final category =
                              mealCategories[index == 4 & 8 ? index : index + 1]
                                  .strCategory
                                  .toString();
                          return ExplorePageCategorCard(
                            borderColor:
                                colors[index == 0 ? index + 1 : index - 1],
                            color: colors[index],
                            onTap: () {
                              context.push(
                                '/explore_category_detail_page',
                                extra: [category],
                              );
                            },
                            state: state,
                            index: index == 4 & 8 ? index : index + 1,
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
