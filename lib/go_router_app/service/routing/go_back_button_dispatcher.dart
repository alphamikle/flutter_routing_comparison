import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoBackButtonDispatcher extends RootBackButtonDispatcher {
  GoBackButtonDispatcher({
    required BuildContext context,
  }) : _context = context;

  final BuildContext _context;
  Timer? _exitTimer;

  @override
  Future<bool> didPopRoute() async {
    invokeCallback(Future.value(true));
    if (GoRouter.of(_context).canPop()) {
      GoRouter.of(_context).pop();
    } else if (_exitTimer != null) {
      // DO NOTHING
    } else {
      _exitTimer = Timer(const Duration(seconds: 1), () => _exitTimer = null);
      ScaffoldMessenger.of(_context).hideCurrentSnackBar();
      ScaffoldMessenger.of(_context).showSnackBar(
        const SnackBar(
          duration: Duration(milliseconds: 800),
          content: Text('Press again to exit'),
        ),
      );
    }
    return invokeCallback(Future.value(false));
  }
}
