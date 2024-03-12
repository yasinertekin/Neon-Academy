import 'package:flutter/material.dart';
import 'package:hero_case/arrow_buttons.dart';
import 'package:hero_case/view/game_over_view.dart';
import 'package:hero_case/view/labirent_view_mixin.dart';

final class LabirentView extends StatefulWidget {
  const LabirentView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LabirentViewState createState() => _LabirentViewState();
}

final class _LabirentViewState extends State<LabirentView>
    with SingleTickerProviderStateMixin, LabirentViwMixin {
  int currentLevel = 0;
  int falseCount = 3;

  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateSlideAnimation() {
    _slideAnimation = Tween<Offset>(
      begin: Offset(currentLevel == 0 ? 0.0 : -1.0, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(_controller);
  }

  final Map<String, String> Levels = {
    'assets/first.png': 'Up',
    'assets/second.png': 'Right',
    'assets/third.png': 'Down',
    'assets/fourth.png': 'Left',
    'assets/fifth.png': 'Down',
    'assets/sixth.png': 'Right',
  };

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1.0, 0.0),
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.orange,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.red,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      for (int i = 0; i < falseCount; i++)
                        const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      if (currentLevel > 0)
                        SlideTransition(
                          position: _slideAnimation,
                          child: Image.asset(
                            Levels.entries.elementAt(currentLevel - 1).key,
                            key: const Key('oldImage'),
                          ),
                        ),
                      SlideTransition(
                        position: _slideAnimation,
                        child: Image.asset(
                          Levels.entries.elementAt(currentLevel).key,
                          key: const Key('newImage'),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                if (currentLevel < Levels.length - 1)
                  ArrowButtons(
                    enabledArrowButton:
                        Levels.entries.elementAt(currentLevel).value,
                    onArrowPressed: (direction) async {
                      if (Levels.entries.elementAt(currentLevel).value ==
                          direction) {
                        setState(() {
                          currentLevel++;
                        });
                      } else {
                        setState(() {
                          falseCount--;
                        });
                        if (falseCount == 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const GameOverView(),
                            ),
                          );
                        } else {
                          await _showAlertDialog(context);
                        }
                      }
                      _updateSlideAnimation();
                      _controller.forward(from: 0.0);
                    },
                  ),
                const SizedBox(height: 50),
                if (currentLevel == Levels.length - 1)
                  ElevatedButton(
                    onPressed: () {
                      falseCount = 3;
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const GameScreen(),
                        ),
                        (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: const Size(200, 60),
                    ),
                    child: const Text(
                      'Restart',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showAlertDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: const Text('Wrong direction'),
            content: Text('Remaining Life: ${falseCount - 1}'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    falseCount--;
                    if (falseCount == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GameOverView(),
                        ),
                      );
                      falseCount = 3;
                    }
                  });
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
      },
    );
  }
}

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const LabirentView();
  }
}
