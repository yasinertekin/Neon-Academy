import 'package:flutter/material.dart';

@immutable
final class NeonApps {
  final String appIcon;
  final String appName;
  final String appreleseDate;
  final String appCategory;
  final String storeURL;
  final double height;
  final Color backgroundColor;

  const NeonApps({
    required this.appIcon,
    required this.appName,
    required this.appreleseDate,
    required this.appCategory,
    required this.storeURL,
    required this.height,
    this.backgroundColor = Colors.white,
  });

  /// Copy With
  NeonApps copyWith({
    String? appIcon,
    String? appName,
    String? appreleseDate,
    String? appCategory,
    String? storeURL,
    double? height,
    Color? backgroundColor,
  }) =>
      NeonApps(
        appIcon: appIcon ?? this.appIcon,
        appName: appName ?? this.appName,
        appreleseDate: appreleseDate ?? this.appreleseDate,
        appCategory: appCategory ?? this.appCategory,
        storeURL: storeURL ?? this.storeURL,
        height: height ?? this.height,
        backgroundColor: backgroundColor ?? this.backgroundColor,
      );
}

@immutable
final class NeonAppsList {
  const NeonAppsList._();
  static const List<NeonApps> apps = [
    NeonApps(
      appIcon: 'assets/img_math.png',
      appName: 'Neon App 1',
      appreleseDate: '2021-10-01',
      appCategory: 'Business',
      height: 150,
      storeURL: 'https://www.google.com',
    ),
    NeonApps(
      appIcon: 'assets/time_wrap.png',
      appName: 'Neon App 2',
      appreleseDate: '2021-10-02',
      appCategory: 'Entertainment',
      storeURL: 'https://www.google.com',
      height: 150,
    ),
    NeonApps(
      appIcon: 'assets/img_math.png',
      appName: 'Neon App 3',
      appreleseDate: '2021-10-03',
      appCategory: 'Education',
      storeURL: 'https://www.google.com',
      height: 150,
    ),
    NeonApps(
      appIcon: 'assets/time_wrap.png',
      appName: 'Neon App 4',
      appreleseDate: '2021-10-04',
      appCategory: 'Health & Fitness',
      storeURL: 'https://www.google.com',
      height: 200,
    ),
    NeonApps(
      appIcon: 'assets/time_wrap.png',
      appName: 'Neon App 10',
      appreleseDate: '2021-10-10',
      appCategory: 'Shopping',
      height: 200,
      storeURL: 'https://www.google.com',
    )
  ];
}
