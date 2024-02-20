import 'package:flutter/material.dart';
import 'package:text_field_case/text_field_case_view.dart';

void main() {
  runApp(const _MyApp());
}

final class _MyApp extends StatelessWidget {
  const _MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TextFieldCaseView(),
    );
  }
}
