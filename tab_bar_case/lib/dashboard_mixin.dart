import 'package:flutter/material.dart';
import 'package:tab_bar_case/dashboard_view.dart';

/// DashBoardMixin
mixin DashBoardMixin on State<DashboardView> implements TickerProvider {
  late final TabController _tabController;

  /// tabController
  TabController get tabController => _tabController;

  /// tabViewsList
  /// tabViewsList
  late final List<Tab> _tabViewsList = TabViews.values.map(
    (e) {
      return Tab(
        icon: e.getIcon(),
        text: e.getLabel(),
      );
    },
  ).toList();

  /// tabViewsList
  List<Tab> get tabViews => _tabViewsList;

  @override
  void initState() {
    super.initState();
    _initTabController(TabViews.values.length, this);
  }

  @override
  void dispose() {
    _disposeTabController();
    super.dispose();
  }

  void _initTabController(int length, TickerProvider vsync) {
    _tabController = TabController(
      length: length,
      vsync: vsync,
    );
  }

  void _disposeTabController() {
    _tabController.dispose();
  }
}

/// TabViewsExtension
extension TabViewsExtension on TabViews {
  /// icon
  Widget getIcon() {
    switch (this) {
      case TabViews.home:
        return const Icon(
          Icons.home,
        );
      case TabViews.favorites:
        return const Icon(
          Icons.category,
        );
      case TabViews.search:
        return const Icon(
          Icons.shopping_cart,
        );
      case TabViews.settings:
        return const Icon(
          Icons.settings,
        );
    }
  }

  String getLabel() {
    switch (this) {
      case TabViews.home:
        return 'Home';
      case TabViews.favorites:
        return 'Favorites';
      case TabViews.search:
        return 'Search';
      case TabViews.settings:
        return 'Settings';
    }
  }
}

enum TabViews { home, search, favorites, settings }
