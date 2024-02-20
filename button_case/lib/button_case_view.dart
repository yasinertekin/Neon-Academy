import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

final class ButtonCaseView extends StatefulWidget {
  const ButtonCaseView({super.key});

  @override
  State<ButtonCaseView> createState() => _ButtonCaseViewState();
}

Color color = Colors.blue;

bool isButtonActive = false;

class _ButtonCaseViewState extends State<ButtonCaseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ButtonCaseView'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    isButtonActive = !isButtonActive;
                    setState(() {});
                  },
                  child: const Text('Butonu Aktif Et'),
                ),
                ElevatedButton(
                  onPressed: isButtonActive
                      ? () {
                          isButtonActive = !isButtonActive;
                          setState(() {});
                        }
                      : null,
                  child: isButtonActive
                      ? const Text('Aktif')
                      : const Text('Aktif Değil'),
                ),
              ],
            ),
            GestureDetector(
              onTapDown: (_) {
                color = Colors.amber;
                setState(() {});
                print(color);
                print('Button tapped!');
              },
              onTapUp: (_) {
                color = Colors.purple;
                print(color);
                setState(() {});
              },
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
                padding: const EdgeInsets.all(15),
                child: const Text(
                  'GestureDetector',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                // Add functionality to display daily specials
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
                shadowColor: Colors.black,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
                padding: const EdgeInsets.all(15),
                textStyle: const TextStyle(
                  fontSize: 20,
                ),
                alignment: Alignment.center,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/civciv.jpg',
                  ),
                  const Text(
                    'ElevatedButton',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(2, 2),
                          blurRadius: 3.0,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ShakeButton(
              onPressed: () {},
            ),
            Center(
              child: PopupMenuButton<String>(
                itemBuilder: (BuildContext context) {
                  return {'Destek Çağır', 'Kasaba Halkını Uyar'}
                      .map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
                onSelected: (String choice) {
                  // Seçilen seçeneğe göre farklı işlemler gerçekleştirilebilir
                  switch (choice) {
                    case 'Destek Çağırmak':
                      // Destek çağırmak için gerekli işlemler buraya yazılabilir
                      break;
                    case 'Kasaba Halkını Uyarmak':
                      // Kasaba halkını uyarmak için gerekli işlemler buraya yazılabilir
                      break;
                    // Diğer seçenekler için case'ler buraya eklenir
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShakeButton extends StatefulWidget {
  final VoidCallback onPressed;

  const ShakeButton({super.key, required this.onPressed});

  @override
  _ShakeButtonState createState() => _ShakeButtonState();
}

class _ShakeButtonState extends State<ShakeButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPressed();
        _animationController.forward(from: 0.0);
        // Ses çalma işlemi
        final player = AudioPlayer();
        player.play(
          UrlSource(
              'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'),
        );
        setState(() {});
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0.0, _animationController.value * 10),
            child: child,
          );
        },
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color:
                _animationController.isAnimating ? Colors.green : Colors.blue,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: const Text(
            'Soygun Düğmesi',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
