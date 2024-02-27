import 'package:flutter/material.dart';

final class CustomProgressIndicatorView extends StatefulWidget {
  const CustomProgressIndicatorView({super.key});

  @override
  State<CustomProgressIndicatorView> createState() =>
      _CustomProgressIndicatorViewState();
}

final class _CustomProgressIndicatorViewState
    extends State<CustomProgressIndicatorView> {
  int _progress = 0;

  void _incrementProgress() {
    setState(() {
      // Increment progress by 1, reset to 0 if it reaches 10
      _progress = (_progress + 1) % 11;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicator Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Progress: $_progress',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            LinearProgressIndicator(
              backgroundColor: Colors.black,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
              value: _progress / 10.0, // Normalize progress to 0-1 range
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _incrementProgress,
              child: const Text('Complete Task'),
            ),
          ],
        ),
      ),
    );
  }
}
