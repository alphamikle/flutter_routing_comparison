import 'package:flutter/material.dart';
import 'package:navigator_comparison/common/common_route_viewer.dart';

class ImageView extends StatelessWidget {
  const ImageView({
    required this.imagePath,
    super.key,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image view'),
        // leading: BackButton(onPressed: () => context.vRouter.historyBack()),
      ),
      backgroundColor: Color.lerp(const Color.fromRGBO(67, 170, 139, 1), Colors.white, 0.90),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: Hero(
                tag: imagePath,
                child: Image.asset(
                  imagePath,
                ),
              ),
            ),
          ),
          const CommonRouteViewer(),
        ],
      ),
    );
  }
}
