import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigator_comparison/go_router_app/domain/auth_view/auth_view.dart';
import 'package:navigator_comparison/go_router_app/domain/home_details_view/home_details_view.dart';
import 'package:navigator_comparison/go_router_app/domain/home_view/home_view.dart';
import 'package:navigator_comparison/go_router_app/domain/profile_view/profile_view.dart';
import 'package:navigator_comparison/go_router_app/domain/root_view/bloc/root_view_bloc.dart';
import 'package:navigator_comparison/go_router_app/domain/root_view/bloc/root_view_event.dart';
import 'package:navigator_comparison/go_router_app/domain/root_view/root_view.dart';
import 'package:navigator_comparison/go_router_app/domain/settings_view/settings_view.dart';
import 'package:navigator_comparison/go_router_app/service/routing/pop_scoped_go_route.dart';
import 'package:navigator_comparison/go_router_app/service/routing/routes_list.dart';
import 'package:navigator_comparison/vrouter_app/domain/image_view/image_view.dart';

GoRouter routesMapping({
  required RootViewBloc rootViewBloc,
  required GoRouteWillPopCallback willPopCallback,
}) =>
    GoRouter(
      routes: <GoRoute>[
        GoRoute(
          path: RoutesList.root.path,
          name: RoutesList.root.name,
          redirect: (GoRouterState state) => RoutesList.home.path,
        ),
        GoRoute(
          path: '${RoutesList.root.path}${SegmentsList.tab.id}(home|settings|profile)',
          builder: (BuildContext context, GoRouterState state) {
            final String tabId = state.params[SegmentsList.tab.name]!;
            final Map<String, Widget> tabs = {
              RoutesList.home.segment: const HomeView(),
              RoutesList.settings.segment: const SettingsView(),
              RoutesList.profile.segment: const ProfileView(),
            };

            rootViewBloc.add(RootViewNavigationEvent(tabId: tabId));
            return RootView(
              key: ValueKey(tabId),
              child: tabs[tabId]!,
            );
          },
          routes: [
            GoRoute(
              path: RoutesList.homeDetails.subRoute!,
              builder: (BuildContext context, GoRouterState state) => const HomeDetailsView(),
              redirect: (GoRouterState state) {
                if (!rootViewBloc.state.isAuthorized) {
                  return RoutesList.auth.path;
                }
                return null;
              },
            )
          ],
        ),
        GoRoute(
          path: RoutesList.auth.path,
          name: RoutesList.auth.name,
          builder: (BuildContext context, GoRouterState state) => const AuthView(),
        ),
        GoRoute(
          path: RoutesList.imageDetails.path,
          name: RoutesList.imageDetails.name,
          builder: (BuildContext context, GoRouterState state) => ImageView(
            imagePath: state.params[SegmentsList.imagePath.name] ?? '',
          ),
        ),

        /// Helpers for navigating to the routes by their names
        GoRoute(
          path: RoutesList.home.path,
          name: RoutesList.home.name,
          redirect: (_) => null,
        ),
        GoRoute(
          path: RoutesList.settings.path,
          name: RoutesList.settings.name,
          redirect: (_) => null,
        ),
        GoRoute(
          path: RoutesList.profile.path,
          name: RoutesList.profile.name,
          redirect: (_) => null,
        ),
        GoRoute(
          path: RoutesList.homeDetails.path,
          name: RoutesList.homeDetails.name,
          redirect: (_) => null,
        ),
      ].map((GoRoute route) => route.convertToPopScoped(willPopCallback)).toList(),
    );
