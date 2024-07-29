import 'package:flutter_svg/svg.dart';
import 'package:e_commerce/product/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class CustomTabBarWidget extends StatefulWidget {
  const CustomTabBarWidget({
    this.selectedTabColor,
    this.backgroundColor,
    this.unselectedTabColor,
    this.dividerColor,
    this.indicatorColor,
    this.selectedTabUnderLine = false,
    this.labelStyle,
    required this.tabs,
    required this.tabsScreen,
    this.middle = false,
    this.onTap,
    this.icons,
    this.controller,
    super.key,
  });

  final List<Widget> tabs;
  final List<Widget> tabsScreen;
  final List<String>? icons;
  final Color? backgroundColor;
  final Color? unselectedTabColor;
  final Color? selectedTabColor;
  final Color? dividerColor;
  final Color? indicatorColor;
  final bool? selectedTabUnderLine;
  final void Function(int)? onTap;
  final TextStyle? labelStyle;
  final bool? middle;
  final TabController? controller;

  @override
  State<CustomTabBarWidget> createState() => _CustomTabBarWidgetState();
}

class _CustomTabBarWidgetState extends State<CustomTabBarWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.tabs.length,
      initialIndex:
          widget.controller?.index ?? 0, // Using the provided controller
      child: Padding(
        padding: context.paddingAllLow,
        child: Column(
          children: [
            Container(
              height: context.dynamicHeight(0.05),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:
                    widget.backgroundColor ?? context.theme.colorScheme.surface,
              ),
              child: Padding(
                padding: widget.middle == true
                    ? context.paddingHorizontalHigh * 2
                    : context.paddingHorizontalHigh * 0,
                child: TabBar(
                  isScrollable: false,
                  controller:
                      widget.controller, // Using the provided controller
                  onTap: widget.onTap,
                  labelStyle: widget.labelStyle ??
                      context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                  indicatorPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                  labelColor: widget.selectedTabColor ??
                      context.theme.colorScheme.tertiary,
                  unselectedLabelColor: widget.unselectedTabColor ??
                      context.theme.colorScheme.surfaceVariant,
                  dividerColor: widget.dividerColor ?? Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  tabs: List.generate(widget.tabs.length, (index) {
                    return CustomTab(
                      icon: widget.icons != null && index < widget.icons!.length
                          ? widget.icons![index]
                          : null, // Handle null or shorter icons list
                      label: widget.tabs[index],
                      index: index, // Pass the index to the CustomTab
                      controller:
                          widget.controller, // Pass the controller to CustomTab
                    );
                  }),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: widget.controller, // Using the provided controller
                children: widget.tabsScreen,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTab extends StatelessWidget {
  const CustomTab({
    Key? key,
    required this.icon,
    required this.label,
    required this.index,
    required this.controller,
  }) : super(key: key);

  final String? icon; // Nullable icon
  final Widget label;
  final int index; // Index of the tab
  final TabController? controller; // TabController

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller!,
      builder: (context, child) {
        final bool isSelected = controller?.index == index;
        return Tab(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                SvgPicture.asset(
                  icon!,
                  width: 18,
                  height: 18,
                  color: isSelected
                      ? context.theme.colorScheme
                          .tertiary // Change this to the desired selected color
                      : Colors.grey, // Unselected color
                ),
                const SizedBox(width: 8.0),
              ],
              label,
            ],
          ),
        );
      },
    );
  }
}
