import 'package:e_commerce/feature/bottom_nav/mixin/bottom_nav_mixin.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/state/container/product_state_items.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
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
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF53B175),
        unselectedItemColor: Color(0xFF181725),
        items: bottomNavigationBarItemList,
        currentIndex: tabContext.index,
        selectedLabelStyle: context.textTheme.headlineLarge?.copyWith(
          color: Color(0xFF53B175),
          fontFamily: "Gilroy",
          fontSize: 12,
        ),
        unselectedLabelStyle: context.textTheme.headlineLarge?.copyWith(
          color: Color(0xff181725),
          fontFamily: "Gilroy",
          fontSize: 12,
        ),
        onTap: (index) {
          tabContext.setIndex(index);
          onTabTapped(index, context);
        },
      ),
    );
  }
}
