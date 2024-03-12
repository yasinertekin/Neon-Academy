import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scroll_view_rescue/scroll_veiw_rescue.dart';

mixin ScrollViewMixin on State<ScrollViewRescue> {
  List<String> data = [
    'Spell 1',
    'Spell 2',
    'Spell 3',
    'Spell 4',
  ];

  ScrollController _scrollController = ScrollController();

  ScrollController get scrollController => _scrollController;

  bool isEndOfList = false;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        isEndOfList = true;
      });
    }
  }

  void loadAdditionalSpells() {
    if (data.length >= 8) return;
    List<String> newItems = ['Spell 5', 'Spell 6', 'Spell 7', 'Spell 8'];
    Future.microtask(() => setState(() => data.addAll(newItems)));
  }
}
