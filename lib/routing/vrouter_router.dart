import 'package:flutter/material.dart';
import 'package:navigator_comparison/routing/app_router.dart';
import 'package:vrouter/vrouter.dart';

class VRouterRouter extends AppRouter {
  VRouterRouter(this.context);

  final BuildContext context;

  @override
  void goBack() => context.vRouter.historyBack();

  @override
  void goTo(String path) => context.vRouter.to(path);
}
