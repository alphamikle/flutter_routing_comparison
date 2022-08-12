import 'package:flutter/material.dart';
import 'package:navigator_comparison/common/common_button.dart';
import 'package:navigator_comparison/common/common_image.dart';
import 'package:navigator_comparison/vrouter_app/service/routing/route_info_viewer.dart';
import 'package:navigator_comparison/vrouter_app/service/routing/routes_list.dart';
import 'package:vrouter/vrouter.dart';

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
          const CommonImage(index: 1),
          CommonButton(
            title: 'Go to details',
            onPressed: () => context.vRouter.toNamed(RoutesList.homeDetails.name),
          ),
          const RouteInfoViewer(),
        ],
      ),
    );
  }
}
