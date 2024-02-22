import 'package:flutter/material.dart';

import 'custom_slider_view.dart';

void main() {
  runApp(const MyApp());
}

final class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        sliderTheme: SliderThemeData(
          activeTrackColor: Colors.green,
          inactiveTrackColor: Colors.red,
          trackShape: const RectangularSliderTrackShape(),
          trackHeight: 4.0,
          thumbColor: Colors.blue,
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
          overlayColor: Colors.purple.withAlpha(32),
          overlayShape: const RoundSliderOverlayShape(overlayRadius: 28.0),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CustomSliderView(),
    );
  }
}
