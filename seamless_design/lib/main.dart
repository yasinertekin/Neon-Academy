import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:seamless_design/view/home_view.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => const _MyApp(), // Wrap your app
    ),
  );
}

final class _MyApp extends StatelessWidget {
  const _MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const HomeView(),
    );
  }
}
