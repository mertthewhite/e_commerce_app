import 'package:flutter/material.dart';
import 'package:e_commerce/product/utility/gen/assets.gen.dart';

class BottomNavContext extends ChangeNotifier {
  int _index = 0;

  final List<SvgGenImage> _pagesIcon = [
    const SvgGenImage('assets/icons/store.svg'),
    const SvgGenImage('assets/icons/bottom_search.svg'),
    const SvgGenImage('assets/icons/shop.svg'),
    const SvgGenImage('assets/icons/favorite.svg'),
    const SvgGenImage('assets/icons/user.svg'),
  ];

  final List<String> _pagesLabel = [
    'Shop',
    'Explore',
    'Cart',
    'Favourite',
    'Account',
  ];

  List<SvgGenImage> get items => _pagesIcon;

  List<String> get pagesLabel => _pagesLabel;

  int get index => _index;

  void setIndex(int index) {
    if (index < 0 || index >= _pagesIcon.length) {
      return;
    }
    _index = index;
    notifyListeners();
  }
}
