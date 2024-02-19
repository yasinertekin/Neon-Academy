import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:future_tech/model/smart_home.dart';
import 'package:future_tech/model/smart_home_category.dart';
import 'package:future_tech/view/mixin/smart_home_mixin.dart';

/// SmartHomeView
final class SmartHomeView extends StatefulWidget {
  /// SmartHomeView
  const SmartHomeView({super.key});
  @override
  State<SmartHomeView> createState() => _SmartHomeViewState();
}

final class _SmartHomeViewState extends State<SmartHomeView>
    with SmartHomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: SmartHomeCategoryList.items.length,
      child: _SmartHomeBody(tabController: tabController, tabViews: tabViews),
    );
  }

  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick);
  }
}

final class _SmartHomeBody extends StatelessWidget {
  const _SmartHomeBody({
    required this.tabController,
    required this.tabViews,
  });

  final TabController tabController;
  final List<Tab> tabViews;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: const Text('Smart Home'),
        bottom: TabBar(
          controller: tabController,
          tabs: tabViews,
        ),
      ),
      body: _SmartHomeView(
        tabController: tabController,
      ),
    );
  }
}

final class _SmartHomeView extends StatelessWidget {
  const _SmartHomeView({
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: _tabController,
      children: SmartHomeCategoryList.items
          .map(
            (SmartHomeCategory category) => ListView(
              children: SmartHomeList.items
                  .where(
                    (SmartHome smartHome) =>
                        smartHome.category.name == category.name,
                  )
                  .map(
                    (SmartHome smartHome) => Card(
                      child: _SmartHomeCard(
                        smartHome,
                      ),
                    ),
                  )
                  .toList(),
            ),
          )
          .toList(),
    );
  }
}

// ignore: must_be_immutable
final class _SmartHomeCard extends StatefulWidget {
  _SmartHomeCard(
    this.smartHome,
  );

  SmartHome smartHome;

  @override
  State<_SmartHomeCard> createState() => _SmartHomeCardState();
}

final class _SmartHomeCardState extends State<_SmartHomeCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: IconButton(
        icon: widget.smartHome.isOpen
            ? const Icon(
                Icons.power_settings_new,
                color: Colors.red,
              )
            : const Icon(
                Icons.power_settings_new_outlined,
                color: Colors.grey,
              ),
        onPressed: () {
          setState(() {
            widget.smartHome = widget.smartHome.copyWith(
              isOpen: !widget.smartHome.isOpen,
            );
          });
        },
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          widget.smartHome.image,
        ),
      ),
      title: Text(widget.smartHome.name),
    );
  }
}
