import 'package:e_commerce/feature/explore/presantation/widget/explore_page_search_bar.dart';
import 'package:e_commerce/product/widget/spacer/dynamic_vertical_spacer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExploreHeaderWidget extends StatelessWidget {
  const ExploreHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalSpace.xSmall(),
        InkWell(
          child: const ExplorePageSearchBar(),
          onTap: () {
            context.push('/search_page');
          },
        ),
      ],
    );
  }
}
