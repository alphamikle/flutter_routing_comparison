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
import 'package:navigator_comparison/vrouter_app/service/routing/routes_list.dart';
import 'package:vrouter/vrouter.dart';

List<VRouteElement> routesMapping({
  required GlobalKey<NavigatorState> rootKey,
  required RootViewBloc rootViewBloc,
}) {
  return [
    VRouteRedirector(
      path: RoutesList.root.path,
      redirectTo: RoutesList.home.path,
    ),
    VNester(
      path: RoutesList.root.path,
      name: RoutesList.root.name,
      widgetBuilder: (Widget child) => RootView(child: child),
      nestedRoutes: [
        VWidget(
          path: RoutesList.home.path,
          name: RoutesList.home.name,
          widget: const HomeView(),
          stackedRoutes: [
            VGuard(
              beforeEnter: (VRedirector vRedirector) async {
                if (!rootViewBloc.state.isAuthorized) {
                  final BuildContext context = rootKey.currentContext!;
                  final String? fromUrl = vRedirector.fromUrl;
                  vRedirector.to('${RoutesList.auth.path}${fromUrl == null ? '' : '?go_back_to=$fromUrl'}');
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Theme.of(context).errorColor,
                      content: const Text('Not authorized'),
                    ),
                  );
                }
              },
              stackedRoutes: [
                VWidget(
                  path: RoutesList.homeDetails.path,
                  name: RoutesList.homeDetails.name,
                  widget: const HomeDetailsView(),
                ),
              ],
            ),
          ],
        ),
        VWidget(
          path: RoutesList.settings.path,
          name: RoutesList.settings.name,
          widget: const SettingsView(),
        ),
        VWidget(
          path: RoutesList.profile.path,
          name: RoutesList.profile.name,
          widget: const ProfileView(),
        ),
      ],
    ),
    VWidget(
      path: RoutesList.auth.path,
      name: RoutesList.auth.name,
      widget: const AuthView(),
    ),
    VWidget.builder(
      path: RoutesList.imageDetails.path,
      name: RoutesList.imageDetails.name,
      builder: (BuildContext context, VRouterData data) => ImageView(
        imagePath: data.pathParameters[SegmentsList.imagePath.name] ?? '',
      ),
    ),
    VWidget(
      path: '*',
      widget: const NotFoundView(),
    ),
  ];
}
