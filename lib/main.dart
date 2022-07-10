import 'package:flutter/material.dart';
import 'package:navigator_comparison/app/go_router_app.dart';
import 'package:navigator_comparison/app/navigator_router_app.dart';
import 'package:navigator_comparison/app/vrouter_app.dart';
import 'package:navigator_comparison/routing/app_go_router.dart';
import 'package:navigator_comparison/routing/app_navigator_router.dart';
import 'package:navigator_comparison/routing/app_router.dart';
import 'package:navigator_comparison/routing/app_vrouter.dart';
import 'package:navigator_comparison/routing/router_type.dart';

AppRouter routerFactory(BuildContext context) {
  return {
    RouterType.navigatorRouter: AppNavigatorRouter(context),
    RouterType.vRouter: AppVRouter(context),
    RouterType.goRouter: AppGoRouter(context),
  }[routerType]!;
}

void main() {
  runApp({
    RouterType.navigatorRouter: const NavigatorRouterApp(routerFactory: routerFactory),
    RouterType.vRouter: const VRouterApp(routerFactory: routerFactory),
    RouterType.goRouter: const GoRouterApp(routerFactory: routerFactory),
  }[routerType]!);
}
