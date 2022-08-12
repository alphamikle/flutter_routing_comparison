import 'package:flutter/material.dart';

class CommonImage extends StatelessWidget {
  const CommonImage({
    required this.index,
    super.key,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Image.asset('assets/image_$index.jpg'),
    );
  }
}
