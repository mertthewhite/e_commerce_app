import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AccountBody extends StatelessWidget {
  const AccountBody({
    super.key,
    required this.items,
    required this.itemsName,
  });

  final List items;
  final List itemsName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.7),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: context.paddingHorizontalDefault,
            child: Column(
              children: [
                Divider(
                  color: Color(0xffE2E2E2),
                  thickness: 1,
                ),
                ListTile(
                  dense: true,
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Color(0xff000000),
                  ),
                  leading: SvgPicture.asset(
                    items[index],
                    width: 18,
                    height: 18,
                  ),
                  title: Text(
                    itemsName[index],
                    style: context.textTheme.headlineLarge?.copyWith(
                      color: const Color(0xFF000000),
                      fontFamily: "Gilroy",
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
