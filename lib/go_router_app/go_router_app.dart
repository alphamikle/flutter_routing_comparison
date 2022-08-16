import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:navigator_comparison/common/common_app_builder.dart';
import 'package:navigator_comparison/common/common_images_generator.dart';
import 'package:navigator_comparison/common/common_scroll_behavior.dart';
import 'package:navigator_comparison/common/constants.dart';
import 'package:navigator_comparison/go_router_app/domain/root_view/bloc/root_view_bloc.dart';
import 'package:navigator_comparison/go_router_app/service/routing/routes_mapping.dart';

class GoRouterApp extends StatefulWidget {
  const GoRouterApp({
    super.key,
  });

  @override
  State<GoRouterApp> createState() => _GoRouterAppState();
}

class _GoRouterAppState extends State<GoRouterApp> {
  final GlobalKey<NavigatorState> _key = GlobalKey();
  final CommonImagesGenerator imagesGenerator = CommonImagesGenerator();
  final RootViewBloc rootViewBloc = RootViewBloc();

  Timer? _exitTimer;

  late final GoRouter router = routesMapping(
    rootViewBloc: rootViewBloc,
    willPopCallback: _onPop,
  );

  Future<bool> _onPop(BuildContext context, GoRouterState state) async {
    final bool canChildPop = GoRouter.of(context).canPop();
    final bool canRootPop = _key.currentState?.canPop() ?? false;

    if (canRootPop || canChildPop) {
      return true;
    } else if (_exitTimer != null) {
      // DO NOTHING
      return true;
    } else {
      _exitTimer = Timer(const Duration(seconds: 1), () => _exitTimer = null);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(milliseconds: 800),
          content: Text('Press again to exit'),
        ),
      );
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: rootViewBloc),
      ],
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(value: imagesGenerator),
        ],
        child: MaterialApp.router(
          title: kAppTitle,
          key: _key,
          scrollBehavior: CommonScrollBehavior(),
          routeInformationProvider: router.routeInformationProvider,
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          builder: commonAppBuilder,
        ),
      ),
    );
  }
}
