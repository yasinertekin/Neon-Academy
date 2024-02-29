import 'package:flutter/material.dart';

@immutable
final class NeonApps {
  final String appIcon;
  final String appName;
  final String appreleseDate;
  final String appCategory;
  final String storeURL;
  final double height;

  const NeonApps({
    required this.appIcon,
    required this.appName,
    required this.appreleseDate,
    required this.appCategory,
    required this.storeURL,
    required this.height,
  });
}

@immutable
final class NeonAppsList {
  const NeonAppsList._();
  static final List<NeonApps> apps = [
    const NeonApps(
      appIcon: 'assets/img_math.png',
      appName: 'Neon App 1',
      appreleseDate: '2021-10-01',
      appCategory: 'Business',
      height: 150,
      storeURL: 'https://www.google.com',
    ),
    const NeonApps(
      appIcon: 'assets/time_wrap.png',
      appName: 'Neon App 2',
      appreleseDate: '2021-10-02',
      appCategory: 'Entertainment',
      storeURL: 'https://www.google.com',
      height: 150,
    ),
    const NeonApps(
      appIcon: 'assets/img_math.png',
      appName: 'Neon App 3',
      appreleseDate: '2021-10-03',
      appCategory: 'Education',
      storeURL: 'https://www.google.com',
      height: 150,
    ),
    const NeonApps(
      appIcon: 'assets/time_wrap.png',
      appName: 'Neon App 4',
      appreleseDate: '2021-10-04',
      appCategory: 'Health & Fitness',
      storeURL: 'https://www.google.com',
      height: 200,
    ),
    const NeonApps(
      appIcon: 'assets/time_wrap.png',
      appName: 'Neon App 10',
      appreleseDate: '2021-10-10',
      appCategory: 'Shopping',
      height: 200,
      storeURL: 'https://www.google.com',
    )
  ];
}
