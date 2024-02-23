import 'package:custom_page/product/enum/custom_page_view_type.dart';
import 'package:flutter/material.dart';

@immutable

/// PageModel
final class PageModel {
  /// PageModel
  const PageModel({
    required this.title,
    required this.description,
    required this.icon,
    required this.type,
    required this.backgroundColor,
    this.isImage = false,
  });

  /// title
  final String title;

  /// description
  final String description;

  /// icon
  final IconData icon;

  /// type
  final CustomPageViewType type;

  /// backgroundColor
  final Color backgroundColor;

  /// isImage
  final bool isImage;
}

@immutable

/// PageModelList
final class PageModelList {
  /// PageModelList
  static final List<PageModel> pageList = [
    const PageModel(
      title: 'Page 1',
      description: 'This is page 1',
      icon: Icons.looks_one_sharp,
      type: CustomPageViewType.one,
      backgroundColor: Colors.red,
    ),
    const PageModel(
      title: 'Page 2',
      description: 'This is page 2',
      icon: Icons.looks_two_sharp,
      type: CustomPageViewType.two,
      backgroundColor: Colors.blue,
    ),
    const PageModel(
      title: 'Page 3',
      description: 'This is page 3',
      icon: Icons.looks_3_sharp,
      type: CustomPageViewType.three,
      backgroundColor: Colors.green,
    ),
  ];
}
