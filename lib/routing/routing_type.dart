const String _routerType = String.fromEnvironment('ROUTER');

enum RouterType {
  navigatorRouter,
  vRouter,
  goRouter,
}

RouterType get routerType {
  switch (_routerType) {
    case 'navigator_2_0':
      return RouterType.navigatorRouter;
    case 'vrouter':
      return RouterType.vRouter;
    case 'go_router':
      return RouterType.goRouter;
    default:
      return RouterType.vRouter;
  }
}
