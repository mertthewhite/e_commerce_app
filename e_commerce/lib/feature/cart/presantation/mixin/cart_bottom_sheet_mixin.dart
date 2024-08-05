import 'package:e_commerce/feature/cart/presantation/view/widget/cart_bottom_sheet.dart';
import 'package:flutter/material.dart';

mixin CartBottomSheetMixin on State<CartBottomSheet> {
  final List<String> options = [
    'Red ',
    'Oil',
    'Onion',
    'Eggs',
    'Fast Food',
    'Individual Callection',
    'Cocola',
    'Wine'
  ];
  final List<String> headers = ['Categories', 'Brand'];
  final Map<String, bool> selectedOptions = {};

  @override
  void initState() {
    super.initState();
    for (var option in options) {
      selectedOptions[option] = false;
    }
  }
}
