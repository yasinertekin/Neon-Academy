import 'package:custom_page/feature/view/custom_page_view.dart';
import 'package:custom_page/product/enum/custom_page_view_type.dart';
import 'package:flutter/material.dart';

/// A view model for the [CustomPageView].
final class CustomPageViewModel extends ChangeNotifier {
  CustomPageViewType _currentPage = CustomPageViewType.one;

  /// The current page of the [CustomPageView].
  CustomPageViewType get currentPage => _currentPage;

  /// Updates the current page of the [CustomPageView].
  void updateCurrentPage(CustomPageViewType newPage) {
    _currentPage = newPage;
    notifyListeners();
  }
}
