// import 'package:flutter/material.dart';
// import 'package:hero_case/view/maze_game_view.dart';

// mixin MazeGameViewMixin<T extends StatefulWidget> on State<T> {
//   int lives = 3;
//   int currentLevelIndex = 0;
//   final Map<String, Direction> Levels = {
//     'assets/first.png': Direction.up,
//     'assets/second.png': Direction.right,
//     'assets/third.png': Direction.down,
//     'assets/fourth.png': Direction.left,
//     'assets/fifth.png': Direction.down,
//     'assets/sixth.png': Direction.down,
//   };

//   void moveToNextLevel(Direction direction) {
//     if (Levels.values.elementAt(currentLevelIndex) == direction) {
//       if (currentLevelIndex < Levels.length - 1) {
//         setState(() {
//           currentLevelIndex++;
//           if (currentLevelIndex == 1) {
//             Navigator.push(context, MaterialPageRoute(builder: (context) {
//               return const SecondPage();
//             }));
//           }
//         });
//       } else {
//         // Oyunu kazandınız
//         showDialog<void>(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: const Text('Tebrikler!'),
//               content: const Text('Labirenti başarıyla geçtiniz!'),
//               actions: <Widget>[
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                     resetGame();
//                   },
//                   child: const Text('Tekrar Oyna'),
//                 ),
//               ],
//             );
//           },
//         );
//       }
//     } else {
//       // Yanlış yöne hareket etti, canını kaybetti
//       setState(() {
//         lives--;
//         if (lives == 2) {
//           showDialog<void>(
//             context: context,
//             builder: (BuildContext context) {
//               return AlertDialog(
//                 title: const Text('Dikkat!'),
//                 content:
//                     const Text('Yanlış yöne hareket ettiniz. Canınız 2 oldu.'),
//                 actions: <Widget>[
//                   TextButton(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     child: const Text('Tamam'),
//                   ),
//                 ],
//               );
//             },
//           );
//         }
//         if (lives == 1) {
//           AdaptiveDialog.show(
//             context,
//             dialog: const OneHeart(),
//           );
//         }
//         if (lives <= 0) {
//           // Canı kalmadı, oyunu kaybetti
//           showDialog<void>(
//             barrierDismissible: false,
//             context: context,
//             builder: (BuildContext context) {
//               return AlertDialog(
//                 title: const Text('Oyun Bitti'),
//                 content: const Text('Üzgünüm, labirenti geçemediniz.'),
//                 actions: <Widget>[
//                   TextButton(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                       resetGame();
//                     },
//                     child: const Text('Tekrar Dene'),
//                   ),
//                 ],
//               );
//             },
//           );
//         }
//       });
//     }
//   }

//   void resetGame() {
//     setState(() {
//       currentLevelIndex = 0;
//       lives = 3;
//     });
//   }
// }

// @immutable
// final class AdaptiveDialog {
//   const AdaptiveDialog._();

//   static Future<T?> show<T>(
//     BuildContext context, {
//     required AlertDialog dialog,
//   }) {
//     return showAdaptiveDialog(
//       context: context,
//       builder: (context) {
//         return dialog;
//       },
//     );
//   }
// }

// @immutable
// final class OneHeart extends AlertDialog {
//   const OneHeart({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog.adaptive(
//       title: const Text('Dikkat!'),
//       content: const Text('Yanlış yöne hareket ettiniz. Canınız 1 oldu.'),
//       actions: <Widget>[
//         TextButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           child: const Text('Tamam'),
//         ),
//       ],
//     );
//   }
// }

// final class NoHeart extends AlertDialog {
//   const NoHeart({
//     super.key,
//     required this.onTryAgain,
//   });

//   final VoidCallback onTryAgain;

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog.adaptive(
//       title: const Text('Oyun Bitti'),
//       content: const Text('Üzgünüm, labirenti geçemediniz.'),
//       actions: <Widget>[
//         TextButton(
//           onPressed: onTryAgain,
//           child: const Text('Tekrar Dene'),
//         ),
//       ],
//     );
//   }
// }
