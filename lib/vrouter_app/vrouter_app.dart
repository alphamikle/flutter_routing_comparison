import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigator_comparison/common/common_app_builder.dart';
import 'package:navigator_comparison/common/common_images_generator.dart';
import 'package:navigator_comparison/common/common_scroll_behavior.dart';
import 'package:navigator_comparison/common/constants.dart';
import 'package:navigator_comparison/vrouter_app/domain/root_view/bloc/root_view_bloc.dart';
import 'package:navigator_comparison/vrouter_app/domain/root_view/bloc/root_view_event.dart';
import 'package:navigator_comparison/vrouter_app/service/routing/routes_mapping.dart';
import 'package:vrouter/vrouter.dart';

class VRouterApp extends StatefulWidget {
  const VRouterApp({
    super.key,
  });

  @override
  State<VRouterApp> createState() => _VRouterAppState();
}

class _VRouterAppState extends State<VRouterApp> {
  final GlobalKey<NavigatorState> _key = GlobalKey();
  final CommonImagesGenerator imagesGenerator = CommonImagesGenerator();
  final RootViewBloc rootViewBloc = RootViewBloc();

  Timer? _exitTimer;

  Future<void> _onPop(VRedirector vRedirector) async {
    if (vRedirector.historyCanBack()) {
      vRedirector.historyBack();
    } else if (_exitTimer != null) {
      // DO NOTHING
    } else {
      vRedirector.stopRedirection();
      final BuildContext context = _key.currentContext!;
      _exitTimer = Timer(const Duration(seconds: 1), () => _exitTimer = null);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(milliseconds: 800),
          content: Text('Press again to exit'),
        ),
      );
    }
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
        child: VRouter(
          title: kAppTitle,
          navigatorKey: _key,
          scrollBehavior: CommonScrollBehavior(),
          onPop: _onPop,
          onSystemPop: _onPop,
          routes: routesMapping(),
          beforeEnter: (VRedirector vRedirector) async {
            final List<String> names = vRedirector.newVRouterData?.names ?? [];
            if (names.isNotEmpty) {
              rootViewBloc.add(RootViewNavigationEvent(routeName: names.first));
            }
          },
          builder: commonAppBuilder,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
