import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    required this.title,
    required this.onPressed,
    this.color,
    super.key,
  });

  final String title;
  final VoidCallback? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: ElevatedButton(
        style: color == null
            ? null
            : ButtonStyle(
                backgroundColor: MaterialStateProperty.all(color),
              ),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
