import 'package:e_commerce/feature/account/presantation/mixin/account_mixin.dart';
import 'package:e_commerce/feature/account/presantation/widget/account_body.dart';
import 'package:e_commerce/feature/account/presantation/widget/profile_app_bar.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> with AccountMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfileAppBar(
        name: 'Afsar Hossen',
        email: 'Imshuvo97@gmail.com',
        avatarPath: 'assets/images/Rectangle 82.png',
      ),
      body: AccountBody(items: items, itemsName: itemsName),
    );
  }
}
