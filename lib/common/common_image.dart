import 'package:flutter/material.dart';
import 'package:navigator_comparison/main.dart';
import 'package:navigator_comparison/vrouter_app/domain/image_view/tappable_image.dart' as vr;

class CommonImage extends StatelessWidget {
  const CommonImage({
    required this.setNumber,
    super.key,
  });

  final int setNumber;

  @override
  Widget build(BuildContext context) {
    final int min = setNumber * 4;
    final int max = (setNumber + 1) * 4;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: GridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          children: [
            for (int i = min; i < max; i++) kWithGoRouter ? Container() : vr.TappableImage(setNumber: i),
          ],
        ),
      ),
      // child: GridView(child: Image.asset(generator.getRandomImage())),
    );
  }
}
