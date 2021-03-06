import 'package:flutter/material.dart';
import 'package:navigator_comparison/routing/app_router.dart';

class AppNavigatorRouter extends AppRouter {
  AppNavigatorRouter(this.context);

  final BuildContext context;

  @override
  void goBack() => Navigator.of(context).pop();

  @override
  void goTo(String path) => Navigator.of(context).pushNamed(path);
}
