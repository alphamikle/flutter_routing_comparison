abstract class RoutesList {
  static const RouteInfo any = RouteInfo('*', 'any');
  static const RouteInfo root = RouteInfo('/', 'root');
  static const RouteInfo settings = RouteInfo('/settings', 'settings');
  static const RouteInfo profile = RouteInfo('/profile', 'profile');

  static const RouteInfo auth = RouteInfo('/auth', 'auth');
  static const RouteInfo homeDetails = RouteInfo('/home/details', 'home details');

  static final RouteInfo imageDetails = RouteInfo('/image/${ParamsList.imagePath.id}', 'image details');

  static const List<RouteInfo> rootRoutes = [
    root,
    settings,
    profile,
  ];

  static const List<RouteInfo> securedRoutes = [
    settings,
    profile,
    homeDetails,
  ];
}

class RouteInfo {
  const RouteInfo(this.path, this.name);

  final String path;
  final String name;
}

abstract class ParamsList {
  static const RouteParam imagePath = RouteParam('imagePath');
  static const RouteParam nextRoute = RouteParam('nextRoute');
}

class RouteParam {
  const RouteParam(this.name);

  final String name;

  String get id => ':$name';
}
