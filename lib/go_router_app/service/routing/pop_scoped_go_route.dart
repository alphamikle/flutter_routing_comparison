import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

typedef GoRouteWillPopCallback = Future<bool> Function(BuildContext context, GoRouterState state);

extension PopScopedGoRoute on GoRoute {
  GoRoute withPopScope(GoRouteWillPopCallback callback) {
    return GoRoute(
      path: path,
      builder: (BuildContext context, GoRouterState state) {
        return Builder(
          builder: (BuildContext context) => WillPopScope(
            onWillPop: () => callback(context, state),
            child: builder(context, state),
          ),
        );
      },
      redirect: redirect,
      name: name,
      routes: routes,
      pageBuilder: pageBuilder,
    );
  }

  GoRoute convertToPopScoped(GoRouteWillPopCallback callback) => _convertToPopScoped(this, callback);

  GoRoute _convertToPopScoped(GoRoute route, GoRouteWillPopCallback callback) {
    final GoRoute converted = route.withPopScope(callback);
    final List<GoRoute> convertedRoutes = [];
    for (final GoRoute route in converted.routes) {
      convertedRoutes.add(_convertToPopScoped(route, callback));
    }
    return GoRoute(
      path: converted.path,
      pageBuilder: converted.pageBuilder,
      routes: convertedRoutes,
      name: converted.name,
      redirect: converted.redirect,
      builder: converted.builder,
    );
  }
}
