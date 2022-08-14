import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:navigator_comparison/go_router_app/domain/auth_view/auth_view.dart';
import 'package:navigator_comparison/go_router_app/domain/home_details_view/home_details_view.dart';
import 'package:navigator_comparison/go_router_app/domain/home_view/home_view.dart';
import 'package:navigator_comparison/go_router_app/domain/profile_view/profile_view.dart';
import 'package:navigator_comparison/go_router_app/domain/root_view/bloc/root_view_bloc.dart';
import 'package:navigator_comparison/go_router_app/domain/root_view/bloc/root_view_event.dart';
import 'package:navigator_comparison/go_router_app/domain/root_view/root_view.dart';
import 'package:navigator_comparison/go_router_app/domain/settings_view/settings_view.dart';
import 'package:navigator_comparison/go_router_app/service/routing/go_router_observer.dart';
import 'package:navigator_comparison/go_router_app/service/routing/routes_list.dart';

GoRouter routesMapping({
  required RootViewBloc rootViewBloc,
}) =>
    GoRouter(
      debugLogDiagnostics: true,
      observers: [
        GoRouterObserver(),
      ],
      routes: <GoRoute>[
        GoRoute(
          path: RoutesList.root.path,
          name: RoutesList.root.name,
          redirect: (GoRouterState state) => RoutesList.home.path,
        ),
        if (true) ...[
          GoRoute(
            path: '${RoutesList.root.path}${SegmentsList.tab.id}(home|settings|profile)',
            // path: '${RoutesList.root.path}${SegmentsList.tab.id}',
            builder: (BuildContext context, GoRouterState state) {
              final String tabId = state.params[SegmentsList.tab.name]!;
              final Map<String, Widget> tabs = {
                RoutesList.home.segment: const HomeView(),
                RoutesList.settings.segment: const SettingsView(),
                RoutesList.profile.segment: const ProfileView(),
              };

              rootViewBloc.add(RootViewNavigationEvent(tabId: tabId));
              return BlocProvider.value(
                value: rootViewBloc,
                child: RootView(
                  key: ValueKey(tabId),
                  child: tabs[tabId]!,
                ),
              );
            },
            routes: [
              GoRoute(
                path: RoutesList.homeDetails.subRoute!,
                builder: (BuildContext context, GoRouterState state) => const HomeDetailsView(),
              )
            ],
          ),
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
        ] else ...[
          /// This is a entrypoints for entering to these routes by their names
          GoRoute(
            path: RoutesList.home.path,
            name: RoutesList.home.name,
            builder: (BuildContext context, GoRouterState state) => BlocProvider.value(
              value: rootViewBloc,
              child: RootView(
                key: ValueKey(RoutesList.home.name),
                child: const HomeDetailsView(),
              ),
            ),
            routes: [
              GoRoute(
                path: RoutesList.homeDetails.subRoute!,
                name: RoutesList.homeDetails.name,
                builder: (BuildContext context, GoRouterState state) => const HomeDetailsView(),
              )
            ],
          ),
          GoRoute(
            path: RoutesList.settings.path,
            name: RoutesList.settings.name,
            builder: (BuildContext context, GoRouterState state) => BlocProvider.value(
              value: rootViewBloc,
              child: RootView(
                key: ValueKey(RoutesList.settings.name),
                child: const SettingsView(),
              ),
            ),
          ),
          GoRoute(
            path: RoutesList.profile.path,
            name: RoutesList.profile.name,
            builder: (BuildContext context, GoRouterState state) => BlocProvider.value(
              value: rootViewBloc,
              child: RootView(
                key: ValueKey(RoutesList.profile.name),
                child: const ProfileView(),
              ),
            ),
          ),
        ],
        GoRoute(
          path: RoutesList.homeDetails.path,
          name: RoutesList.homeDetails.name,
          redirect: (_) => null,
        ),
        GoRoute(
          path: RoutesList.auth.path,
          name: RoutesList.auth.name,
          builder: (BuildContext context, GoRouterState state) => BlocProvider.value(
            value: rootViewBloc,
            child: const AuthView(),
          ),
        ),
      ],
    );
