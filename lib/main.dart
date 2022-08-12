import 'package:flutter/material.dart';
import 'package:navigator_comparison/vrouter_app/domain/root_view/bloc/root_view_bloc.dart';
import 'package:navigator_comparison/vrouter_app/vrouter_app.dart';

void main() {
  runApp(
    VRouterApp(
      rootViewBloc: RootViewBloc(),
    ),
  );
}
