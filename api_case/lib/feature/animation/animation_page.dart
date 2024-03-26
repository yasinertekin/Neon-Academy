import 'dart:async';

import 'package:flutter/material.dart';

class AnimationPage extends StatelessWidget {
  const AnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _AnimationView();
  }
}

class _AnimationView extends StatefulWidget {
  const _AnimationView({super.key});

  @override
  State<_AnimationView> createState() => _AnimationViewState();
}

class _AnimationViewState extends State<_AnimationView> {
  bool _isVisible = true;

  bool _isRotated = false;

  final double _offset = 0;
  final bool _moveDown = true;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _toggleRotation() {
    setState(() {
      _isRotated = !_isRotated;
    });
  }

  bool isBig = false;

  void _startAnimation() {
    setState(() {
      isBig = !isBig;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: _isVisible,
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: _toggleVisibility,
                      child: Text(
                        _isVisible ? 'Hide' : 'Show',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.rotate(
                      angle: _isRotated ? 4 : 0,
                      child: const FlutterLogo(size: 100),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: _toggleRotation,
                      child: Text(
                        _isRotated ? 'Rotate' : 'Reset',
                      ),
                    ),
                  ],
                ),
                const MyAnimatedText(),
                const SizedBox(height: 16),
                Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      height: isBig ? 200 : 100,
                      width: isBig ? 200 : 100,
                      color: isBig ? Colors.blue : Colors.red,
                      child: const Center(
                        child: Text(
                          'Büyüt ve Küçült',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: _startAnimation,
                      child: const Text('Start'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyAnimatedText extends StatefulWidget {
  const MyAnimatedText({super.key});

  @override
  _MyAnimatedTextState createState() => _MyAnimatedTextState();
}

class _MyAnimatedTextState extends State<MyAnimatedText> {
  double _offset = 0;
  bool _moveDown = true;
  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          margin: EdgeInsets.only(top: _offset), // Yatay yönde kaydırma
          child: const Text(
            'Yukarı ve Aşağı',
            style: TextStyle(fontSize: 24),
          ),
        ),
        ElevatedButton(
          onPressed: _startAnimation,
          child: const Text('Start'),
        ),
        ElevatedButton(
          onPressed: _stopAnimation,
          child: const Text('Stop'),
        ),
      ],
    );
  }

  void _startAnimation() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        _offset =
            _moveDown ? 50.0 : 0.0; // Metni 50 birim aşağı veya yukarı kaydırır
        _moveDown = !_moveDown; // Yönü tersine çevirir
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _stopAnimation() {
    _timer?.cancel();
  }
}
