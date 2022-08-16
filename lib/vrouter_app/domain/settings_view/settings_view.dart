import 'package:flutter/material.dart';
import 'package:navigator_comparison/common/common_button.dart';
import 'package:navigator_comparison/common/common_image.dart';
import 'package:navigator_comparison/common/common_route_viewer.dart';
import 'package:navigator_comparison/vrouter_app/service/routing/routes_list.dart';
import 'package:vrouter/vrouter.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      backgroundColor: Color.lerp(const Color.fromRGBO(249, 199, 79, 1), Colors.white, 0.90),
      body: ListView(
        children: [
          const CommonImage(setNumber: 1),
          CommonButton(
            title: 'Go to "${RoutesList.homeDetails.path}"',
            onPressed: () => context.vRouter.toNamed(RoutesList.homeDetails.name),
          ),
          const CommonRouteViewer(),
        ],
      ),
    );
  }
}
