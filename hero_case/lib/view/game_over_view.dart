import 'package:flutter/material.dart';

class GameOverView extends StatelessWidget {
  const GameOverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Over'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Shrek is love, Shrek is life',
              style: TextStyle(
                fontSize: 20,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset(
              'assets/shrek.png',
            ),
            const Text(
              'Game Over',
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
