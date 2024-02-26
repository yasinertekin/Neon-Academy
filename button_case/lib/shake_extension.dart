import 'dart:math';

import 'package:flutter/material.dart';

extension ShakeExtension on Widget {
  Widget shake({int duration = 500, double offset = 6.0}) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: offset),
      duration: Duration(milliseconds: duration),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(sin(value * pi) * offset, 0),
          child: child,
        );
      },
      child: this,
    );
  }
}
