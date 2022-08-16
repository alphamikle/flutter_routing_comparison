import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:navigator_comparison/common/common_app_builder.dart';
import 'package:navigator_comparison/common/common_images_generator.dart';
import 'package:navigator_comparison/common/common_scroll_behavior.dart';
import 'package:navigator_comparison/common/constants.dart';
import 'package:navigator_comparison/go_router_app/domain/root_view/bloc/root_view_bloc.dart';
import 'package:navigator_comparison/go_router_app/service/routing/go_router_aware.dart';
import 'package:navigator_comparison/go_router_app/service/routing/go_router_observer.dart';
import 'package:navigator_comparison/go_router_app/service/routing/routes_mapping.dart';

class GoRouterApp extends StatefulWidget {
  const GoRouterApp({
    required this.rootViewBloc,
    required this.goRouterObserver,
    required this.imagesGenerator,
    super.key,
  });

  final RootViewBloc rootViewBloc;
  final GoRouterObserver goRouterObserver;
  final CommonImagesGenerator imagesGenerator;

  @override
  State<GoRouterApp> createState() => _GoRouterAppState();
}

class _GoRouterAppState extends State<GoRouterApp> {
  final GlobalKey<NavigatorState> _key = GlobalKey();
  late final GoRouter router = routesMapping(
    rootViewBloc: widget.rootViewBloc,
    goRouterObserver: widget.goRouterObserver,
  );

  Future<bool> _onPop() async {
    print('ON POP');
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: widget.goRouterObserver),
        RepositoryProvider.value(value: widget.imagesGenerator),
      ],
      child: WillPopScope(
        onWillPop: _onPop,
        child: MaterialApp.router(
          title: kAppTitle,
          key: _key,
          scrollBehavior: CommonScrollBehavior(),
          routeInformationProvider: router.routeInformationProvider,
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          builder: (context, widget) {
            final result = commonAppBuilder(context, widget);
            return GoRouterAware(child: result);
          },
        ),
      ),
    );
  }
}
