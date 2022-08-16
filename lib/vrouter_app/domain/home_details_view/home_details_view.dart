import 'package:flutter/material.dart';
import 'package:navigator_comparison/common/common_button.dart';
import 'package:navigator_comparison/common/common_image.dart';
import 'package:navigator_comparison/common/common_route_viewer.dart';
import 'package:vrouter/vrouter.dart';

class HomeDetailsView extends StatelessWidget {
  const HomeDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home details'),
      ),
      backgroundColor: Color.lerp(const Color.fromRGBO(243, 114, 44, 1), Colors.white, 0.90),
      body: ListView(
        children: [
          const CommonImage(setNumber: 3),
          CommonButton(
            title: 'Go back to: ${context.vRouter.previousUrl}',
            onPressed: () => context.vRouter.historyBack(),
          ),
          const CommonRouteViewer(),
        ],
      ),
    );
  }
}
