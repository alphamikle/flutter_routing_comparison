import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    required this.title,
    required this.onPressed,
    super.key,
  });

  final VoidCallback? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
