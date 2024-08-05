import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:e_commerce/product/utility/constants/number_constants.dart';
import 'package:e_commerce/product/widget/divider/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AccountBody extends StatelessWidget {
  AccountBody({
    super.key,
    required this.items,
    required this.itemsName,
  });

  final List<String> items;
  final List<String> itemsName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(NumberConstants.zeroPointSeven),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: context.paddingHorizontalDefault,
            child: Column(
              children: [
                const CustomDivider(),
                ListTile(
                  dense: true,
                  trailing: Icon(Icons.arrow_forward_ios,
                      size: NumberConstants.seventeen,
                      color: context.theme.colorScheme.shadow),
                  leading: SvgPicture.asset(
                    items[index],
                    height: NumberConstants.eighteen,
                  ),
                  title: Text(
                    itemsName[index],
                    style: context.textTheme.bodySmall?.copyWith(),
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
