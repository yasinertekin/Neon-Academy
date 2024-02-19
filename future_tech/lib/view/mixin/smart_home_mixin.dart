import 'package:flutter/material.dart';
import 'package:future_tech/model/smart_home_category.dart';
import 'package:future_tech/view/smart_home_view.dart';

/// SmartHomeViewMixin
mixin SmartHomeViewMixin on State<SmartHomeView> implements TickerProvider {
  late final TabController _tabController;

  /// tabController
  TabController get tabController => _tabController;

  /// tabViewsList
  late final List<Tab> _tabViewsList = SmartHomeCategoryList.items
      .map(
        (SmartHomeCategory category) => Tab(
          text: category.name,
        ),
      )
      .toList();

  /// tabViewsList
  List<Tab> get tabViews => _tabViewsList;

  @override
  void initState() {
    super.initState();
    _initTabController(SmartHomeCategoryList.items.length, this);
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
