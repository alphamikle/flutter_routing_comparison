import 'package:flutter/material.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({
    required this.index,
    required this.onButtonPressed,
    required this.buttonTitle,
    super.key,
  });

  final int index;
  final VoidCallback onButtonPressed;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text('This is a $index-th image'),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Image.asset('assets/image_$index.jpg'),
            ),
            ElevatedButton(
              onPressed: onButtonPressed,
              child: Text('Go to "$buttonTitle"'),
            ),
          ],
        ),
      ),
    );
  }
}
