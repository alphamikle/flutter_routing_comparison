import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigator_comparison/common/common_button.dart';
import 'package:navigator_comparison/common/common_image.dart';
import 'package:navigator_comparison/common/common_route_viewer.dart';
import 'package:navigator_comparison/go_router_app/service/routing/routes_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      backgroundColor: Color.lerp(const Color.fromRGBO(248, 150, 30, 1), Colors.white, 0.90),
      body: ListView(
        children: [
          const CommonImage(),
          CommonButton(
            title: 'Go to details',
            onPressed: () => context.goNamed(RoutesList.homeDetails.name),
          ),
          const CommonRouteViewer(),
        ],
      ),
    );
  }
}
