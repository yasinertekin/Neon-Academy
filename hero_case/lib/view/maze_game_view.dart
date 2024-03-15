import 'package:flutter/material.dart';

class MazeGame extends StatelessWidget {
  const MazeGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maze Game'),
      ),
      body: Column(
        children: [
          Image.asset('assets/first.png'),
          const SizedBox(height: 20),
          const Row(
            children: [
              _LeftButton(),
              _RightButton(),
            ],
          ),
          const Row(
            children: [
              _UpButton(
                page: SecondPage(),
              ),
              _DownButton(),
            ],
          ),
        ],
      ),
    );
  }
}

final class _DownButton extends StatelessWidget {
  const _DownButton({this.page, super.key});

  final Widget? page;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: page != null
          ? () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      page!,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    var begin = const Offset(0.0, 1.0);
                    var end = Offset.zero;
                    var curve = Curves.ease;
                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);

                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                ),
              );
            }
          : null,
      icon: const Icon(Icons.arrow_downward),
    );
  }
}

class _LeftButton extends StatelessWidget {
  const _LeftButton({this.page, super.key});

  final Widget? page;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: page != null
          ? () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      page!,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    var begin = const Offset(-1.0, 0.0);
                    var end = Offset.zero;
                    var curve = Curves.ease;
                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);

                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                ),
              );
            }
          : null,
      icon: const Icon(Icons.arrow_back),
    );
  }
}

final class _RightButton extends StatelessWidget {
  const _RightButton({
    this.page,
  });

  final Widget? page;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: page != null
          ? () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      page!,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    var begin = const Offset(1.0, 0.0);
                    var end = Offset.zero;
                    var curve = Curves.ease;
                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);

                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                ),
              );
            }
          : null,
      icon: const Icon(Icons.arrow_forward),
    );
  }
}

final class _UpButton extends StatelessWidget {
  const _UpButton({this.page});

  final Widget? page;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: page != null
          ? () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      page!,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    var begin = const Offset(0.0, -1.0);
                    var end = Offset.zero;
                    var curve = Curves.ease;
                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);

                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                ),
              );
            }
          : null,
      icon: const Icon(Icons.arrow_upward),
    );
  }
}

final class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Page'),
      ),
      body: Column(
        children: [
          Image.asset('assets/second.png'),
          const SizedBox(height: 20),
          const Row(
            children: [
              _LeftButton(),
              _RightButton(
                page: ThirdPage(),
              ),
            ],
          ),
          const Row(
            children: [
              _UpButton(),
              _DownButton(),
            ],
          ),
        ],
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Page'),
      ),
      body: Column(
        children: [
          Image.asset('assets/third.png'),
          const Row(
            children: [
              _LeftButton(),
              _RightButton(),
            ],
          ),
          const Row(
            children: [
              _UpButton(),
              _DownButton(
                page: FourthPage(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FourthPage extends StatelessWidget {
  const FourthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fourth Page'),
      ),
      body: Column(
        children: [
          Image.asset('assets/fourth.png'),
          const Row(
            children: [
              _LeftButton(
                page: FifthPage(),
              ),
              _RightButton(),
            ],
          ),
          const Row(
            children: [
              _UpButton(),
              _DownButton(),
            ],
          ),
        ],
      ),
    );
  }
}

class FifthPage extends StatelessWidget {
  const FifthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fifth Page'),
      ),
      body: Column(
        children: [
          Image.asset('assets/fifth.png'),
          const Row(
            children: [
              _LeftButton(),
              _RightButton(),
            ],
          ),
          const Row(
            children: [
              _UpButton(),
              _DownButton(
                page: SixthPage(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SixthPage extends StatelessWidget {
  const SixthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sixth Page'),
      ),
      body: Column(
        children: [
          Image.asset('assets/sixth.png'),
          const Row(
            children: [
              _LeftButton(),
              _RightButton(),
            ],
          ),
          const Row(
            children: [
              _UpButton(),
              Hero(
                tag: 'downButton',
                child: _DownButton(
                  page: SeventhPage(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SeventhPage extends StatelessWidget {
  const SeventhPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seventh Page'),
      ),
      body: Column(
        children: [
          const Text(
            'Congratulations! You have completed the maze game.',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Hero(
            tag: 'upButton',
            child: Image.asset('assets/shrek.png'),
          ),
        ],
      ),
    );
  }
}
