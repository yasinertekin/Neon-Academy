import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tab_bar_case/dashboard_mixin.dart';

/// DashboardView
final class DashboardView extends StatefulWidget {
  /// DashboardView
  const DashboardView({super.key});
  @override
  State<DashboardView> createState() => _DashboardViewState();
}

final class _DashboardViewState extends State<DashboardView>
    with DashBoardMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TabViews.values.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            controller: tabController,
            tabs: tabViews,
          ),
        ),
        bottomNavigationBar: _BottomAppBar(
          tabController: tabController,
          tabViewsList: tabViews,
        ),
        body: _DashboardView(
          tabController: tabController,
        ),
      ),
    );
  }

  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick);
  }
}

final class _DashboardView extends StatelessWidget {
  const _DashboardView({
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: const [
        Placeholder(),
        Placeholder(),
        Placeholder(),
        Placeholder(),
      ],
    );
  }
}

final class _BottomAppBar extends StatelessWidget {
  const _BottomAppBar({
    required this.tabController,
    required this.tabViewsList,
  });

  final TabController tabController;
  final List<Tab> tabViewsList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Opacity(
        opacity: 0.5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BottomAppBar(
            surfaceTintColor: Colors.blue,
            elevation: 30,
            shadowColor: Colors.black,
            padding: const EdgeInsets.all(10),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            notchMargin: 10,
            color: Colors.amber,
            shape: const CircularNotchedRectangle(),
            child: TabBar(
              physics: const NeverScrollableScrollPhysics(),
              indicatorColor: Theme.of(context).colorScheme.secondary,
              indicatorWeight: 2,
              labelColor: Colors.red,
              unselectedLabelColor: Colors.black,
              tabAlignment: TabAlignment.center,
              automaticIndicatorColorAdjustment: true,
              onTap: (value) {},
              controller: tabController,
              tabs: tabViewsList,
            ),
          ),
        ),
      ),
    );
  }
}
