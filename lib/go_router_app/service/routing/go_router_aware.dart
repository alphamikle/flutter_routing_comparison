import 'package:flutter/material.dart';

class GoRouterAware extends StatefulWidget {
  const GoRouterAware({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<GoRouterAware> createState() => _GoRouterAwareState();
}

class _GoRouterAwareState extends State<GoRouterAware> with RouteAware {
  @override
  void didPop() {
    print('DID POP AWARE');
  }

  @override
  void didPopNext() {
    // Covering route was popped off the navigator.
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
