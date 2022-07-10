import 'package:flutter/material.dart';

typedef RouterFactory = AppRouter Function(BuildContext context);

abstract class AppRouter {
  void goTo(String path);
  void goBack();
}
