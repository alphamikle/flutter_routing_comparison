import 'package:flutter/material.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({
    required this.index,
    super.key,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/image_$index.jpg'),
      ),
    );
  }
}
