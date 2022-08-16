import 'package:flutter/material.dart';
import 'package:navigator_comparison/vrouter_app/vrouter_app.dart';

const bool kWithGoRouter = bool.fromEnvironment('USE_GO');

void main() {
  // runApp(
  //   kWithGoRouter ? const VRouterApp() : const VRouterApp(),
  // );
  runApp(const VRouterApp());
}
