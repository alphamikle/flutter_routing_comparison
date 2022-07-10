import 'package:flutter/material.dart';
import 'package:navigator_comparison/constants/constants.dart';
import 'package:navigator_comparison/main_view/main_view.dart';
import 'package:navigator_comparison/routing/app_router.dart';

class VRouterApp extends StatelessWidget {
  const VRouterApp({
    required this.routerFactory,
    super.key,
  });

  final RouterFactory routerFactory;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppTitle,
      home: MainView(
        activeTabIndex: 0,
        routerFactory: routerFactory,
      ),
    );
  }
}
