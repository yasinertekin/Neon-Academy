import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SegmentedControlChallenge(),
    );
  }
}

class SegmentedControlChallenge extends StatefulWidget {
  const SegmentedControlChallenge({super.key});

  @override
  _SegmentedControlChallengeState createState() =>
      _SegmentedControlChallengeState();
}

class _SegmentedControlChallengeState extends State<SegmentedControlChallenge> {
  int _currentSelection = 0;

  final Map<int, Widget> _segments = const <int, Widget>{
    0: Text(
      'Neon Academy 2023',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    1: Text('Neon'),
    2: Text('Apps'),
  };

  final Map<int, Color> _segmentColors = const <int, Color>{
    0: Colors.green,
    1: Colors.blue,
    2: Colors.red,
  };

  final Map<int, double> _segmentSizes = const <int, double>{
    0: 300.0,
    1: 259.0,
    2: 150.0,
  };

  void _onValueChanged(int value) {
    setState(() {
      _currentSelection = value;
    });
  }

  double? _getSegmentSize(int index) {
    return _currentSelection == index ? _segmentSizes[index] : 250.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Segmented Control Challenge'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: _getSegmentSize(_currentSelection),
              child: CupertinoSegmentedControl<int>(
                unselectedColor: Colors.white,
                padding: EdgeInsets.zero,
                children: _segments,
                selectedColor: _segmentColors[_currentSelection],
                borderColor: Colors.black,
                pressedColor: Colors.grey[400],
                onValueChanged: _onValueChanged,
                groupValue: _currentSelection,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
