import 'package:bloc/bloc.dart';
import 'package:navigator_comparison/vrouter_app/domain/root_view/bloc/root_view_event.dart';
import 'package:navigator_comparison/vrouter_app/domain/root_view/bloc/root_view_state.dart';
import 'package:navigator_comparison/vrouter_app/service/routing/routes_list.dart';

class RootViewBloc extends Bloc<RootViewEvent, RootViewState> {
  RootViewBloc() : super(const RootViewState(index: 0, isAuthorized: false)) {
    on<RootViewNavigationEvent>(_handleNavigationEvent);
    on<RootViewAuthorizationEvent>(_handleAuthorization);
  }

  void _handleNavigationEvent(RootViewNavigationEvent event, Emitter<RootViewState> emit) {
    final int newIndex = RoutesList.rootRoutes.indexWhere((RouteInfo routeInfo) => routeInfo.name == event.routeName);
    if (newIndex >= 0 && state.index != newIndex) {
      emit(state.copyWith(index: newIndex));
    }
  }

  void _handleAuthorization(RootViewAuthorizationEvent event, Emitter<RootViewState> emit) {
    if (!state.isAuthorized) {
      emit(state.copyWith(isAuthorized: true));
    }
  }
}
