import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:navigator_comparison/common/common_images_generator.dart';
import 'package:navigator_comparison/go_router_app/service/routing/routes_list.dart';

class TappableImage extends StatelessWidget {
  const TappableImage({
    required this.setNumber,
    super.key,
  });

  final int setNumber;

  @override
  Widget build(BuildContext context) {
    final CommonImagesGenerator generator = context.read();
    final String imagePath = generator.getRandomImageSet(setNumber);

    return InkWell(
      onTap: () => context.pushNamed(
        RoutesList.imageDetails.name,
        params: {
          SegmentsList.imagePath.name: imagePath,
        },
      ),
      child: Hero(
        tag: imagePath,
        child: Image.asset(imagePath),
      ),
    );
  }
}
