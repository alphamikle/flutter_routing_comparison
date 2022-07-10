import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:navigator_comparison/constants/constants.dart';
import 'package:navigator_comparison/home_section/home_section.dart';

const int _kTabsCount = 3;

class MainView extends StatefulWidget {
  const MainView({
    required this.activeTabIndex,
    super.key,
  });

  final int activeTabIndex;

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with SingleTickerProviderStateMixin {
  late final TabController _tabController = TabController(length: _kTabsCount, vsync: this);

  @override
  void didUpdateWidget(MainView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.activeTabIndex != widget.activeTabIndex) {
      int targetIndex = widget.activeTabIndex;
      if (targetIndex > _kTabsCount) {
        targetIndex = _kTabsCount;
      } else if (targetIndex < 0) {
        targetIndex = 0;
      }
      _tabController.animateTo(targetIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(kAppTitle),
      ),
      bottomNavigationBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(MdiIcons.homeOutline), label: 'Home', activeIcon: Icon(MdiIcons.home)),
          BottomNavigationBarItem(icon: Icon(MdiIcons.homeOutline), label: 'Settings', activeIcon: Icon(MdiIcons.home)),
          BottomNavigationBarItem(icon: Icon(MdiIcons.accountOutline), label: 'Profile', activeIcon: Icon(MdiIcons.account)),
        ],
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: const [
          HomeSection(index: 1),
          HomeSection(index: 2),
          HomeSection(index: 3),
        ],
      ),
    );
  }
}
