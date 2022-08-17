import 'package:flutter/material.dart';
import 'package:navigator_comparison/vrouter_app/domain/auth_view/auth_view.dart';
import 'package:navigator_comparison/vrouter_app/domain/home_details_view/home_details_view.dart';
import 'package:navigator_comparison/vrouter_app/domain/home_view/home_view.dart';
import 'package:navigator_comparison/vrouter_app/domain/image_view/image_view.dart';
import 'package:navigator_comparison/vrouter_app/domain/not_found_view/not_found_view.dart';
import 'package:navigator_comparison/vrouter_app/domain/profile_view/profile_view.dart';
import 'package:navigator_comparison/vrouter_app/domain/root_view/root_view.dart';
import 'package:navigator_comparison/vrouter_app/domain/settings_view/settings_view.dart';
import 'package:navigator_comparison/vrouter_app/service/routing/routes_list.dart';
import 'package:vrouter/vrouter.dart';

List<VRouteElement> routesMapping() {
  return [
    /// "/" -> "/home"
    VRouteRedirector(path: RoutesList.root.path, redirectTo: RoutesList.home.path),

    /// "/"
    VNester(
      path: RoutesList.root.path,
      name: RoutesList.root.name,
      widgetBuilder: (Widget child) => RootView(child: child),
      nestedRoutes: [
        /// "/home"
        VWidget(
          path: RoutesList.home.path,
          name: RoutesList.home.name,
          widget: const HomeView(),
          stackedRoutes: [
            VWidget(
              path: RoutesList.homeDetails.path,
              name: RoutesList.homeDetails.name,
              widget: const HomeDetailsView(),
            ),
          ],
        ),

        /// "/settings"
        VWidget(
          path: RoutesList.settings.path,
          name: RoutesList.settings.name,
          widget: const SettingsView(),
        ),

        /// "/profile"
        VWidget(
          path: RoutesList.profile.path,
          name: RoutesList.profile.name,
          widget: const ProfileView(),
        ),
      ],
    ),

    /// "/auth"
    VWidget.builder(
      path: RoutesList.auth.path,
      name: RoutesList.auth.name,
      builder: (BuildContext context, VRouterData data) => AuthView(nextRoute: data.queryParameters[ParamsList.nextRoute.name] ?? ''),
    ),

    /// "/image/:imagePath"
    VWidget.builder(
      path: RoutesList.imageDetails.path,
      name: RoutesList.imageDetails.name,
      builder: (BuildContext context, VRouterData data) => ImageView(imagePath: data.pathParameters[ParamsList.imagePath.name] ?? ''),
    ),

    /// "*"
    VWidget(
      path: '*',
      widget: const NotFoundView(),
    ),
  ];
}
