import 'package:e_commerce/feature/bottom_nav/widget/bottom_nav_builder_widget.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/state/container/product_state_items.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:e_commerce/product/utility/constants/number_constants.dart';
import 'package:e_commerce/product/utility/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

mixin BottomNavigationBarMixin on State<BottomNavBuilder> {
  final tabContext = ProductStateItems.bottomNavBuilder;

  List<BottomNavigationBarItem> get bottomNavigationBarItemList {
    final items = tabContext.items.map((e) {
      return buildNavigationBarItem(
        icon: e,
        index: tabContext.items.indexOf(e),
      );
    }).toList();
    return items;
  }

  BottomNavigationBarItem buildNavigationBarItem({
    required SvgGenImage icon,
    required int index,
  }) {
    final iconColor = tabContext.index == index
        ? ColorConstants.lightGreenColor
        : ColorConstants.blackColor;

    return BottomNavigationBarItem(
      backgroundColor: Colors.transparent,
      icon: Padding(
        padding: context.paddingTopLow,
        child: icon.svg(
          color: iconColor,
          width: context.dynamicWidth(NumberConstants.zeroPointZeroThree),
          height: context.dynamicHeight(NumberConstants.zeroPointZeroThree),
        ),
      ),
      label: tabContext.pagesLabel[index],
    );
  }

  Future<void> onTabTapped(int index, BuildContext context) async {
    switch (index) {
      case 0:
        await context.push('/home_page');
        break;
      case 1:
        await context.push('/explore_page');
        break;
      case 2:
        await context.push('/cart_page');
        break;
      case 3:
        await context.push('/favourite_page');
        break;
      case 4:
        await context.push('/account_page');
        break;
      default:
        print('Index out of range: $index');
    }
  }
}
