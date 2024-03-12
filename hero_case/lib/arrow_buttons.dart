import 'package:flutter/material.dart';
import 'package:hero_case/view/game_over_view.dart';

class ArrowButtonInfo {
  final IconData iconData;
  final bool isEnabled;

  ArrowButtonInfo(this.iconData, this.isEnabled);
}

bool status = true;
final List<ArrowButtonInfo> icons = [
  ArrowButtonInfo(Icons.arrow_upward, status),
  ArrowButtonInfo(Icons.arrow_back, status),
  ArrowButtonInfo(Icons.arrow_downward, status),
  ArrowButtonInfo(Icons.arrow_forward, status),
];

int falseCount = 3;

class ArrowButtons extends StatelessWidget {
  const ArrowButtons({
    super.key,
    required this.enabledArrowButton,
    required this.onArrowPressed,
  });

  final String enabledArrowButton;
  final Function(String) onArrowPressed;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                minimumSize: const Size(60, 60),
              ),
              onPressed: icons[0].isEnabled &&
                      icons[0].iconData == Icons.arrow_upward &&
                      enabledArrowButton == 'Up'
                  ? () => onArrowPressed('Up')
                  : () => _showAlertDialog(context),
              child: Icon(
                icons[0].iconData,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              width: 10,
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 1; i < icons.length; i++)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: const Size(60, 60),
                    ),
                    onPressed: icons[i].isEnabled &&
                            icons[i].iconData == _getArrowIcon(i) &&
                            enabledArrowButton == _getArrowDirection(i)
                        ? () => onArrowPressed(_getArrowDirection(i))
                        : () => _showAlertDialog(context),
                    child: Icon(
                      icons[i].iconData,
                      color: Colors.black,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  IconData _getArrowIcon(int index) {
    return icons[index].iconData;
  }

  String _getArrowDirection(int index) {
    switch (index) {
      case 1:
        return 'Left';
      case 2:
        return 'Down';
      case 3:
        return 'Right';
      default:
        return '';
    }
  }

  void _showAlertDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Wrong direction'),
          content: Text('Remaining Life: ${falseCount - 1}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                falseCount--;
                if (falseCount == 0) {
                  // Navigate to the Game Over View
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GameOverView(),
                    ),
                  );
                  falseCount = 3;
                }
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
