// ignore_for_file: overridden_fields

import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

import '../../utility/size/index.dart';

class VerticalSpace extends SizedBox {
  const VerticalSpace({required this.height, super.key});

  /// Returns a [SizedBox] with the given [height] percentage of the screen width.
  VerticalSpace.withPercentage({
    required double percentage,
    required BuildContext context,
    Key? key,
  }) : this(
          key: key,
          height: context.dynamicHeight(percentage),
        );

  /// Returns a [SizedBox] with the 100px height.
  const VerticalSpace.xLarge({Key? key})
      : this(key: key, height: WidgetSizes.spacingXxl12);

  /// Returns a [SizedBox] with the 60px height.
  const VerticalSpace.large({Key? key})
      : this(key: key, height: WidgetSizes.spacingXxl8);

  /// Returns a [SizedBox] with the 40px height.
  const VerticalSpace.medium({Key? key})
      : this(key: key, height: WidgetSizes.spacingXxl4);

  /// Returns a [SizedBox] with the 20px height.
  const VerticalSpace.small({Key? key})
      : this(key: key, height: WidgetSizes.spacingL);

  /// Returns a [SizedBox] with the 16px height.
  const VerticalSpace.standard({Key? key})
      : this(key: key, height: WidgetSizes.spacingM);

  /// Returns a [SizedBox] with the 12px height.
  const VerticalSpace.xSmall({Key? key})
      : this(key: key, height: WidgetSizes.spacingS);

  /// Returns a [SizedBox] with the 8px width.
  const VerticalSpace.xxSmall({Key? key})
      : this(key: key, height: WidgetSizes.spacingXs);
  @override
  final double height;
}
