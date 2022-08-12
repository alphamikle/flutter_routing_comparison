import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:navigator_comparison/vrouter_app/domain/root_view/bloc/root_view_bloc.dart';
import 'package:navigator_comparison/vrouter_app/domain/root_view/bloc/root_view_state.dart';
import 'package:navigator_comparison/vrouter_app/service/routing/routes_list.dart';
import 'package:vrouter/vrouter.dart';

class RootView extends StatelessWidget {
  const RootView({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<RootViewBloc, RootViewState>(
        builder: (BuildContext context, RootViewState state) => CupertinoTabBar(
          currentIndex: state.index,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.homeOutline),
              label: 'Home',
              activeIcon: Icon(MdiIcons.home),
            ),
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.cogOutline),
              label: 'Settings',
              activeIcon: Icon(MdiIcons.cog),
            ),
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.accountOutline),
              label: 'Profile',
              activeIcon: Icon(MdiIcons.account),
            ),
          ],
          onTap: (int index) => context.vRouter.toNamed(RoutesList.rootRoutes[index].name, isReplacement: true),
        ),
      ),
      body: child,
    );
  }
}
