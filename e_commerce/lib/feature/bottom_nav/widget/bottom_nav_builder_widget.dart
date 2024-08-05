import 'package:e_commerce/feature/bottom_nav/mixin/bottom_nav_mixin.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:e_commerce/product/utility/constants/number_constants.dart';
import 'package:flutter/material.dart';

class BottomNavBuilder extends StatefulWidget {
  const BottomNavBuilder({super.key});

  @override
  State<BottomNavBuilder> createState() => _BottomNavBuilderState();
}

class _BottomNavBuilderState extends State<BottomNavBuilder>
    with BottomNavigationBarMixin {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: tabContext,
      builder: (_, __) => BottomNavigationBar(
        elevation: NumberConstants.zero,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: ColorConstants.blackColor,
        selectedItemColor: ColorConstants.lightGreenColor,
        selectedLabelStyle: context.textTheme.labelSmall,
        unselectedLabelStyle: context.textTheme.labelSmall,
        items: bottomNavigationBarItemList,
        currentIndex: tabContext.index,
        onTap: (index) {
          tabContext.setIndex(index);
          onTabTapped(index, context);
        },
      ),
    );
  }
}
