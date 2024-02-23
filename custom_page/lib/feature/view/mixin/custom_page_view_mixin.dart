import 'package:custom_page/feature/view/custom_page_view.dart';
import 'package:custom_page/feature/view_model/custom_page_view_model.dart';
import 'package:custom_page/product/enum/custom_page_view_type.dart';
import 'package:custom_page/product/model/page_model.dart';
import 'package:flutter/material.dart';

/// A mixin that provides a [PageController] to the class that uses it.
mixin PageViewMixin on State<CustomPageView> {
  final _pageController = PageController();

  final CustomPageViewModel _viewModel = CustomPageViewModel();

  /// The view model for the [CustomPageView].
  CustomPageViewModel get viewModel => _viewModel;

  /// The controller for the [PageView].
  PageController get pageController => _pageController;

  /// The types of pages that the [PageView] will display.
  final customPageViewType = CustomPageViewType.values;

  /// The list of pages that the [PageView] will display.
  final pageList = PageModelList.pageList;
  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
