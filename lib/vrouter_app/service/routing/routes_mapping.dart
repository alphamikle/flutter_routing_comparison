import 'package:flutter/material.dart';
import 'package:navigator_comparison/vrouter_app/domain/auth_view/auth_view.dart';
import 'package:navigator_comparison/vrouter_app/domain/home_details_view/home_details_view.dart';
import 'package:navigator_comparison/vrouter_app/domain/home_view/home_view.dart';
import 'package:navigator_comparison/vrouter_app/domain/image_view/image_view.dart';
import 'package:navigator_comparison/vrouter_app/domain/not_found_view/not_found_view.dart';
import 'package:navigator_comparison/vrouter_app/domain/profile_view/profile_view.dart';
import 'package:navigator_comparison/vrouter_app/domain/root_view/bloc/root_view_bloc.dart';
import 'package:navigator_comparison/vrouter_app/domain/root_view/root_view.dart';
import 'package:navigator_comparison/vrouter_app/domain/settings_view/settings_view.dart';
import 'package:navigator_comparison/vrouter_app/service/routing/auth_guard.dart';
import 'package:navigator_comparison/vrouter_app/service/routing/routes_list.dart';
import 'package:vrouter/vrouter.dart';

const bool useCustomGuards = false;

List<VRouteElement> routesMapping({
  required GlobalKey<NavigatorState> rootKey,
  required RootViewBloc rootViewBloc,
}) {
  final VWidget homeDetails = VWidget(
    path: RoutesList.homeDetails.path,
    name: RoutesList.homeDetails.name,
    widget: const HomeDetailsView(),
  );
  final VWidget settings = VWidget(
    path: RoutesList.settings.path,
    name: RoutesList.settings.name,
    widget: const SettingsView(),
  );
  final VWidget profile = VWidget(
    path: RoutesList.profile.path,
    name: RoutesList.profile.name,
    widget: const ProfileView(),
  );

  return [
    /// "/"
    // VRouteRedirector.parse(
    //   path: RoutesList.root.path,
    //   redirectTo: (VRedirector vRedirector) {
    //     if (rootViewBloc.state.isAuthorized) {
    //       vRedirector.toNamed(RoutesList.home.name, isReplacement: true);
    //     } else {
    //       vRedirector.toNamed(RoutesList.auth.name, isReplacement: true, queryParameters: {ParamsList.nextRoute.name: RoutesList.home.path});
    //     }
    //   },
    // ),

    VWidget(
      path: '/wrapper_123_123',
      widget: Center(
        child: Container(
          color: Colors.red,
          width: 100,
          height: 100,
        ),
      ),
      stackedRoutes: [
        /// "/auth"
        VWidget.builder(
          path: RoutesList.auth.path,
          name: RoutesList.auth.name,
          builder: (BuildContext context, VRouterData data) => AuthView(nextRoute: data.queryParameters[ParamsList.nextRoute.name] ?? ''),
        ),
      ],
    ),

    /// "/" | "/settings" | "/profile"
    VNester(
      path: RoutesList.root.path,
      widgetBuilder: (Widget child) => RootView(child: child),
      nestedRoutes: [
        /// "/"
        VWidget(
          path: null,
          name: RoutesList.root.name,
          widget: const HomeView(),
          stackedRoutes: [
            if (useCustomGuards)
              authGuard(
                rootViewBloc: rootViewBloc,
                route: homeDetails,
              )
            else
              homeDetails,
          ],
        ),

        /// "/settings"
        if (useCustomGuards)
          authGuard(
            rootViewBloc: rootViewBloc,
            route: settings,
          )
        else
          settings,

        /// "/profile"
        if (useCustomGuards)
          authGuard(
            rootViewBloc: rootViewBloc,
            route: profile,
          )
        else
          profile,
      ],
      stackedRoutes: [
        /// "/image/:imagePath"
        VWidget.builder(
          path: RoutesList.imageDetails.path,
          name: RoutesList.imageDetails.name,
          builder: (BuildContext context, VRouterData data) {
            final String? imagePath = data.pathParameters[ParamsList.imagePath.name];

            return ImageView(
              key: ValueKey(imagePath ?? RoutesList.imageDetails.name),
              imagePath: imagePath ?? '',
            );
          },
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
      builder: (BuildContext context, VRouterData data) {
        final String? imagePath = data.pathParameters[ParamsList.imagePath.name];

        return ImageView(
          key: ValueKey(imagePath ?? RoutesList.imageDetails.name),
          imagePath: imagePath ?? '',
        );
      },
    ),

    /// "*"
    VWidget(
      path: '*',
      widget: const NotFoundView(),
    ),
  ];
}
