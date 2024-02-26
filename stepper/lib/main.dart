import 'package:flutter/material.dart';
import 'package:stepper/custom_stepper_view.dart';

void main() {
  runApp(const _MyApp());
}

final class _MyApp extends StatelessWidget {
  const _MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
        colorScheme: const ColorScheme.light(primary: Colors.blue),
      ),
      home: CustomStepperView(),
    );
  }
}
