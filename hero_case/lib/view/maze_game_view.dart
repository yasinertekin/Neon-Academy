import 'package:flutter/material.dart';

import 'mixin/maze_game_mixin.dart';

final class MazeGame extends StatefulWidget {
  const MazeGame({super.key});

  @override
  _MazeGameState createState() => _MazeGameState();
}

final class _MazeGameState extends State<MazeGame>
    with MazeGameViewMixin, SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reset();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  Widget getTransictionEffect(
    Direction direction,
  ) {
    Widget childWidget = Image.asset(
      Levels.keys.elementAt(currentLevelIndex),
      width: 200,
      height: 200,
    );
    switch (direction) {
      case Direction.up:
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, -1.0),
            end: Offset.zero,
          ).animate(animationController),
          child: childWidget,
        );
        break;
      case Direction.right:
        childWidget = SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animationController),
          child: childWidget,
        );
        break;
      case Direction.down:
        childWidget = SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 1.0),
            end: Offset.zero,
          ).animate(animationController),
          child: childWidget,
        );
        break;
      case Direction.left:
        childWidget = SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1.0, 0.0),
            end: Offset.zero,
          ).animate(animationController),
          child: childWidget,
        );
        break;
      default:
        childWidget = SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, -1.0),
            end: Offset.zero,
          ).animate(animationController),
          child: childWidget,
        );
    }

    return childWidget;
  }

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
            getTransictionEffect(
              Direction.up,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => moveToNextLevel(Direction.up),
                  child: const Icon(Icons.arrow_upward),
                ),
                ElevatedButton(
                  onPressed: () => moveToNextLevel(Direction.right),
                  child: const Icon(Icons.arrow_forward),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => moveToNextLevel(Direction.left),
                  child: const Icon(Icons.arrow_back),
                ),
                ElevatedButton(
                  onPressed: () => moveToNextLevel(Direction.down),
                  child: const Icon(Icons.arrow_downward),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

enum Direction { up, right, down, left }
