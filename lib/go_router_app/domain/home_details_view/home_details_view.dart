import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigator_comparison/common/common_button.dart';
import 'package:navigator_comparison/common/common_image.dart';
import 'package:navigator_comparison/common/common_route_viewer.dart';

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
          const CommonImage(),
          CommonButton(
            title: 'Go back to',
            onPressed: () => GoRouter.of(context).pop(),
          ),
          const CommonRouteViewer(),
        ],
      ),
    );
  }
}
