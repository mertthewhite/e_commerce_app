import 'package:e_commerce/feature/account/presantation/widget/account_body.dart';
import 'package:e_commerce/feature/account/presantation/widget/profile_app_bar.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  List items = [
    'assets/icons/account_orders_icon.svg',
    'assets/icons/account_my_details_icon.svg',
    'assets/icons/account_delicery_address.svg',
    'assets/icons/account_vector_icon.svg',
    'assets/icons/account_promo_cord_icon.svg',
    'assets/icons/account_about_icon.svg',
    'assets/icons/account_bell_icon.svg',
    'assets/icons/account_help_icon.svg',
  ];
  List itemsName = [
    'Orders',
    'My Details',
    'Delivery Address',
    'Payment Methods',
    'Promo Codes',
    'About',
    'Notifications',
    'Help',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(
        name: 'Afsar Hossen',
        email: 'Imshuvo97@gmail.com',
        avatarPath: 'assets/images/Rectangle 82.png',
      ),
      body: AccountBody(items: items, itemsName: itemsName),
    );
  }
}
