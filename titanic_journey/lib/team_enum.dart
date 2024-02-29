enum TeamEnum {
  flutter,
  ios,
  android,
  design,
}

extension TeamEnumExtension on TeamEnum {
  String get name {
    switch (this) {
      case TeamEnum.flutter:
        return 'Flutter';
      case TeamEnum.ios:
        return 'iOS';
      case TeamEnum.android:
        return 'Android';
      case TeamEnum.design:
        return 'Design';
    }
  }
}
