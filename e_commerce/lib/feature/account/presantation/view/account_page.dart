import 'package:e_commerce/feature/account/presantation/mixin/account_mixin.dart';
import 'package:e_commerce/feature/account/presantation/widget/account_body.dart';
import 'package:e_commerce/feature/account/presantation/widget/profile_app_bar.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/widget/spacer/dynamic_horizontal_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

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

class AccountageSearchBar extends StatelessWidget {
  const AccountageSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push('/search_page');
      },
      child: Container(
        height: context.dynamicHeight(0.08),
        width: context.dynamicWidth(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xFFF2F3F2),
        ),
        child: Row(
          children: [
            const HorizontalSpace.small(),
            SvgPicture.asset(
              'assets/icons/search.svg',
              width: 17.21,
            ),
            const HorizontalSpace.small(),
            Text(
              "Search Store",
              style: context.textTheme.headlineLarge?.copyWith(
                color: const Color(0xFF7C7C7C),
                fontFamily: "Gilroy",
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
