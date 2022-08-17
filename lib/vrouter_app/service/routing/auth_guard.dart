import 'package:navigator_comparison/vrouter_app/domain/root_view/bloc/root_view_bloc.dart';
import 'package:navigator_comparison/vrouter_app/service/routing/routes_list.dart';
import 'package:vrouter/vrouter.dart';

VGuard authGuard({
  required RootViewBloc rootViewBloc,
  required VRouteElement route,
}) {
  return VGuard(
    beforeEnter: (VRedirector vRedirector) async {
      if (!rootViewBloc.state.isAuthorized) {
        vRedirector.toNamed(RoutesList.auth.name, queryParameters: {ParamsList.nextRoute.name: vRedirector.toUrl ?? ''});
      }
    },
    stackedRoutes: [route],
  );
}
