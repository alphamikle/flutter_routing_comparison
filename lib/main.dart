import 'package:flutter/material.dart';
import 'package:navigator_comparison/constants/constants.dart';
import 'package:navigator_comparison/main_view/main_view.dart';

void main() {
  runApp(const NavigatorComparator());
}

class NavigatorComparator extends StatelessWidget {
  const NavigatorComparator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: kAppTitle,
      home: MainView(
        activeTabIndex: 0,
      ),
    );
  }
}
