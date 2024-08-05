import 'package:e_commerce/feature/bottom_nav/widget/bottom_nav_builder_widget.dart';
import 'package:flutter/material.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({required this.child, super.key});
  final Widget? child;

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBuilder(),
      body: widget.child,
    );
  }
}
