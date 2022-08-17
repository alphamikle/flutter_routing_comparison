import 'package:flutter/material.dart';
import 'package:navigator_comparison/common/common_button.dart';
import 'package:navigator_comparison/common/common_image.dart';
import 'package:navigator_comparison/common/common_route_viewer.dart';
import 'package:navigator_comparison/vrouter_app/service/routing/routes_list.dart';
import 'package:vrouter/vrouter.dart';

class NotFoundView extends StatelessWidget {
  const NotFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Not found'),
      ),
      backgroundColor: Color.lerp(const Color.fromRGBO(39, 125, 161, 1), Colors.white, 0.90),
      body: ListView(
        children: [
          const CommonImage(setNumber: 5),
          CommonButton(
            title: 'Go to home',
            onPressed: () => context.vRouter.to(RoutesList.root.path, isReplacement: true),
          ),
          const CommonRouteViewer(),
        ],
      ),
    );
  }
}
