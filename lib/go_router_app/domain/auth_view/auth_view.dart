import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:navigator_comparison/common/common_button.dart';
import 'package:navigator_comparison/common/common_image.dart';
import 'package:navigator_comparison/common/common_route_viewer.dart';
import 'package:navigator_comparison/go_router_app/domain/root_view/bloc/root_view_bloc.dart';
import 'package:navigator_comparison/go_router_app/domain/root_view/bloc/root_view_event.dart';
import 'package:navigator_comparison/go_router_app/domain/root_view/bloc/root_view_state.dart';
import 'package:navigator_comparison/go_router_app/service/routing/routes_list.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    final String? goBackTo = GoRouter.of(context).routerDelegate.currentConfiguration.location.queryParameters['go_back_to'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Authorization'),
      ),
      backgroundColor: Color.lerp(const Color.fromRGBO(249, 65, 68, 1), Colors.white, 0.90),
      body: ListView(
        children: [
          const CommonImage(setNumber: 4),
          BlocBuilder<RootViewBloc, RootViewState>(
            builder: (BuildContext context, RootViewState state) => CommonButton(
              title: state.isAuthorized ? 'Authorized' : 'Sign In${goBackTo == null ? '' : ' and go to "$goBackTo"'}',
              onPressed: state.isAuthorized
                  ? null
                  : () {
                      if (goBackTo != null) {
                        context.go(goBackTo);
                      } else {
                        context.goNamed(RoutesList.root.name);
                      }
                      context.read<RootViewBloc>().add(const RootViewAuthorizationEvent());
                    },
            ),
          ),
          const CommonRouteViewer(),
        ],
      ),
    );
  }
}
