import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:navigator_comparison/constants/constants.dart';
import 'package:navigator_comparison/home_section/home_section.dart';
import 'package:navigator_comparison/routing/app_router.dart';
import 'package:navigator_comparison/routing/routes.dart';

const int _kTabsCount = 3;

class MainView extends StatefulWidget {
  const MainView({
    required this.activeTabIndex,
    required this.routerFactory,
    super.key,
  });

  final int activeTabIndex;
  final RouterFactory routerFactory;

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with SingleTickerProviderStateMixin {
  late final TabController _tabController = TabController(length: _kTabsCount, vsync: this);

  int _generateIndex() => Random().nextInt(5) + 1;

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
    final AppRouter appRouter = widget.routerFactory(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(kAppTitle),
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _tabController.index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.homeOutline),
            label: 'Home',
            activeIcon: Icon(MdiIcons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.cogOutline),
            label: 'Settings',
            activeIcon: Icon(MdiIcons.cog),
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.accountOutline),
            label: 'Profile',
            activeIcon: Icon(MdiIcons.account),
          ),
        ],
        onTap: (index) => appRouter.goTo(Routes.rootRoutes[index]),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          HomeSection(
            index: _generateIndex(),
            onButtonPressed: () => appRouter.goTo(Routes.homeDetails),
            buttonTitle: Routes.homeDetails,
          ),
          HomeSection(
            index: _generateIndex(),
            onButtonPressed: () => appRouter.goTo(Routes.auth),
            buttonTitle: Routes.auth,
          ),
          HomeSection(
            index: _generateIndex(),
            onButtonPressed: () => appRouter.goTo(Routes.homeDetails),
            buttonTitle: Routes.homeDetails,
          ),
        ],
      ),
    );
  }
}
