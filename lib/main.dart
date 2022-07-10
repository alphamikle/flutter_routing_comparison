import 'package:flutter/material.dart';
import 'package:navigator_comparison/app/go_router_app.dart';
import 'package:navigator_comparison/app/navigator_router_app.dart';
import 'package:navigator_comparison/app/vrouter_app.dart';
import 'package:navigator_comparison/routing/app_router.dart';
import 'package:navigator_comparison/routing/go_router_router.dart';
import 'package:navigator_comparison/routing/navigator_router.dart';
import 'package:navigator_comparison/routing/routing_type.dart';
import 'package:navigator_comparison/routing/vrouter_router.dart';

AppRouter routerFactory(BuildContext context) {
  return {
    RouterType.navigatorRouter: NavigatorRouter(context),
    RouterType.vRouter: VRouterRouter(context),
    RouterType.goRouter: GoRouterRouter(context),
  }[routerType]!;
}

void main() {
  runApp({
    RouterType.navigatorRouter: const NavigatorRouterApp(routerFactory: routerFactory),
    RouterType.vRouter: const VRouterApp(routerFactory: routerFactory),
    RouterType.goRouter: const GoRouterApp(routerFactory: routerFactory),
  }[routerType]!);
}
