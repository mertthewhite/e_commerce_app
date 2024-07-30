import 'package:e_commerce/feature/account/presantation/view/account_page.dart';
import 'package:flutter/material.dart';

mixin AccountMixin on State<AccountPage> {
  List<String> items = [
    'assets/icons/account_orders_icon.svg',
    'assets/icons/account_my_details_icon.svg',
    'assets/icons/account_delicery_address.svg',
    'assets/icons/account_vector_icon.svg',
    'assets/icons/account_promo_cord_icon.svg',
    'assets/icons/account_about_icon.svg',
    'assets/icons/account_bell_icon.svg',
    'assets/icons/account_help_icon.svg',
  ];
  List<String> itemsName = [
    'Orders',
    'My Details',
    'Delivery Address',
    'Payment Methods',
    'Promo Codes',
    'About',
    'Notifications',
    'Help',
  ];
}
