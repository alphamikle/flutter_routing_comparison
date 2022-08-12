import 'dart:async';

import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:navigator_comparison/common/common_scroll_behavior.dart';
import 'package:navigator_comparison/vrouter_app/domain/root_view/bloc/root_view_bloc.dart';
import 'package:navigator_comparison/vrouter_app/domain/root_view/bloc/root_view_event.dart';
import 'package:navigator_comparison/vrouter_app/service/routing/routes_mapping.dart';
import 'package:vrouter/vrouter.dart';

class VRouterApp extends StatefulWidget {
  const VRouterApp({
    required this.rootViewBloc,
    super.key,
  });

  final RootViewBloc rootViewBloc;

  @override
  State<VRouterApp> createState() => _VRouterAppState();
}

class _VRouterAppState extends State<VRouterApp> {
  final GlobalKey<NavigatorState> _key = GlobalKey();
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
    return VRouter(
      navigatorKey: _key,
      onPop: _onPop,
      onSystemPop: _onPop,
      scrollBehavior: CommonScrollBehavior(),
      routes: routesMapping(
        rootKey: _key,
        rootViewBloc: widget.rootViewBloc,
      ),
      beforeEnter: (VRedirector vRedirector) async {
        final List<String> names = vRedirector.newVRouterData?.names ?? [];
        for (final String routeName in names) {
          widget.rootViewBloc.add(RootViewNavigationEvent(routeName: routeName));
        }
      },
      builder: (context, child) => Padding(
        padding: const EdgeInsets.all(16),
        child: DeviceFrame(
          device: Devices.ios.iPhone13,
          screen: child,
        ),
      ),
    );
  }
}
