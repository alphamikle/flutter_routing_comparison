import 'package:flutter/material.dart';
import 'package:navigator_comparison/go_router_app/go_router_app.dart';
import 'package:navigator_comparison/vrouter_app/vrouter_app.dart';

const bool kWithGoRouter = bool.fromEnvironment('USE_GO');

void main() {
  runApp(
    kWithGoRouter ? const GoRouterApp() : const VRouterApp(),
  );
}
