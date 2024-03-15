import 'package:flutter/material.dart';

class MazeView extends StatelessWidget {
  const MazeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maze Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(
                  'assets/maze.png',
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.1 - 15,
                  top: 200,
                  child: Image.asset(
                    'assets/shrek.png',
                    width: 50,
                    height: 50,
                  ),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.1 - 15,
                  top: 30,
                  child: Image.asset(
                    'assets/shrek.png',
                    width: 50,
                    height: 50,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
