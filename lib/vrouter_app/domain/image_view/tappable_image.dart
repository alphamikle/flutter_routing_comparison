import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigator_comparison/common/common_images_generator.dart';
import 'package:navigator_comparison/vrouter_app/service/routing/routes_list.dart';
import 'package:vrouter/vrouter.dart';

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
      onTap: () => context.vRouter.toNamed(
        RoutesList.imageDetails.name,
        pathParameters: {
          ParamsList.imagePath.name: imagePath,
        },
      ),
      child: Hero(
        tag: imagePath,
        child: Image.asset(imagePath),
      ),
    );
  }
}
