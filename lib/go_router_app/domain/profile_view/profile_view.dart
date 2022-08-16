import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigator_comparison/common/common_button.dart';
import 'package:navigator_comparison/common/common_image.dart';
import 'package:navigator_comparison/common/common_route_viewer.dart';
import 'package:navigator_comparison/go_router_app/service/routing/routes_list.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      backgroundColor: Color.lerp(const Color.fromRGBO(67, 170, 139, 1), Colors.white, 0.90),
      body: ListView(
        children: [
          const CommonImage(setNumber: 2),
          CommonButton(
            title: 'Go to "${RoutesList.auth.path}"',
            onPressed: () => context.pushNamed(RoutesList.auth.name),
          ),
          const CommonRouteViewer(),
        ],
      ),
    );
  }
}
