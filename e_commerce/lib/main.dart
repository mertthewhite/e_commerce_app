import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/product/init/application_initialize.dart';
import 'package:e_commerce/product/init/product_localization.dart';
import 'package:e_commerce/product/init/state.initialize.dart';
import 'package:e_commerce/product/state/container/product_state_items.dart';
import 'package:e_commerce/product/theme/custom_light_theme.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  await ApplicationInitialize().make();
  runApp(ProductLocalization(child: StateInitialize(child: _MyApp())));
}

class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'e_commerce',
      locale: context.locale,
      theme: CustomLightTheme().themeData,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      routerConfig: ProductStateItems.appRouter.router,
      builder: BotToastInit(),
    );
  }
}
