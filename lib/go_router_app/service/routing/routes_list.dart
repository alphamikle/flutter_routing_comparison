abstract class RoutesList {
  static const RouteInfo root = RouteInfo('/', 'root');
  static const RouteInfo home = RouteInfo('/home', 'home');
  static const RouteInfo settings = RouteInfo('/settings', 'settings');
  static const RouteInfo profile = RouteInfo('/profile', 'profile');

  static const RouteInfo auth = RouteInfo('/auth', 'auth');
  static const RouteInfo homeDetails = RouteInfo('/home/details', 'home details', 'details');

  static final RouteInfo imageDetails = RouteInfo('/image/${SegmentsList.imagePath.id}', 'image details');

  static const List<RouteInfo> rootRoutes = [
    home,
    settings,
    profile,
  ];
}

class RouteInfo {
  const RouteInfo(this.path, this.name, [this.subRoute]);

  final String path;
  final String name;
  final String? subRoute;

  /// This thing will return "settings" instead of "/settings"
  String get segment => path.replaceFirst(RegExp(r'^/'), '');
}

abstract class SegmentsList {
  static const SegmentId tab = SegmentId('tabId');
  static const SegmentId imagePath = SegmentId('imagePath');
}

class SegmentId {
  const SegmentId(this.name);

  final String name;
  String get id => ':$name';
}
