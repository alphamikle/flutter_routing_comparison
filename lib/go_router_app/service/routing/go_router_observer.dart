import 'package:flutter/material.dart';

class GoRouterObserver extends RouteObserver {
  Route<dynamic>? _previousRoute;
  Route<dynamic>? get previousRoute => _previousRoute;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    print('''
------------------------
DID PUSH

name: ${previousRoute?.settings.name}
arguments: ${previousRoute?.settings.arguments}
is_active: ${previousRoute?.isActive}
is_first: ${previousRoute?.isFirst}
is_current: ${previousRoute?.isCurrent}
internal_pop: ${previousRoute?.willHandlePopInternally}
has_active_route_below: ${previousRoute?.hasActiveRouteBelow}
current_result: ${previousRoute?.currentResult}
------------------------    
''');
    _previousRoute = previousRoute;
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    print('DID REPLACE');
    _previousRoute = previousRoute;
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    print('DID POP');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    print('DID REMOVE');
  }
}
