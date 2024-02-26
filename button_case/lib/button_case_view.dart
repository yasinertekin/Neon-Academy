import 'package:audioplayers/audioplayers.dart';
import 'package:button_case/shake_extension.dart';
import 'package:flutter/material.dart';

final class ButtonCaseView extends StatefulWidget {
  const ButtonCaseView({super.key});

  @override
  State<ButtonCaseView> createState() => _ButtonCaseViewState();
}

Color color = Colors.blue;

class _ButtonCaseViewState extends State<ButtonCaseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ButtonCaseView'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _PopUpButton(),
            _ActiveInactiveButton(),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            _ColorfulButton(),
            SizedBox(
              height: 20,
            ),
            _ImageButton(),
            SizedBox(
              height: 20,
            ),
            ShakeButton(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

final class _PopUpButton extends StatelessWidget {
  const _PopUpButton();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PopupMenuButton<String>(
        itemBuilder: (BuildContext context) {
          return {'Destek Çağır', 'Kasaba Halkını Uyar'}.map((String choice) {
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
    );
  }
}

final class _ImageButton extends StatelessWidget {
  const _ImageButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), // Kenar yarıçapı
          gradient: const LinearGradient(
            colors: [Colors.red, Colors.orange], // Gradient renkleri
            stops: [0.0, 0.5], // Gradient durakları
            begin: Alignment.topCenter, // Gradient başlangıç konumu
            end: Alignment.bottomCenter, // Gradient bitiş konumu
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0, 5), // Gölge boyutu ve yönü
              blurRadius: 5, // Gölge bulanıklık yarıçapı
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Günlük Spesiyaller'),
                    content: const SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text('Bugünkü Özel Yemek: Kırmızı Biberli Steak'),
                          Text('İçecek: Mojito Kokteyli'),
                          Text('Tatlı: Çikolatalı Brownie'),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Kapat'),
                      ),
                    ],
                  );
                });
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Kenar yarıçapı
              side: const BorderSide(
                width: 2, // Kenarlık genişliği
                color: Colors.blue, // Kenarlık rengi
              ),
            ),
          ),
          child: Ink(
            decoration: BoxDecoration(
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/civciv.jpg'), // Arka plan resmi
              ),
              borderRadius: BorderRadius.circular(10), // Kenar yarıçapı
            ),
            child: Container(
              constraints: const BoxConstraints(
                  minWidth: 250, minHeight: 100), // Buton boyutu
              alignment: Alignment.center,
              child: const Text(
                'Günlük Özel Teklifler',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final class ShakeButton extends StatefulWidget {
  const ShakeButton({
    super.key,
  });

  @override
  _ShakeButtonState createState() => _ShakeButtonState();
}

final class _ShakeButtonState extends State<ShakeButton>
    with SingleTickerProviderStateMixin {
  bool isButtonActive = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: GestureDetector(
        onTap: () {
          isButtonActive = !isButtonActive;
          // Ses çalma işlemi
          final player = AudioPlayer();
          player.play(
            UrlSource(
                'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'),
          );

          setState(() {});
        },
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: const Text(
            'Soygun Düğmesi',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ).shake(
      duration: isButtonActive ? 500 : 0,
      offset: isButtonActive ? 6.0 : 0,
    );
  }
}

final class _ActiveInactiveButton extends StatefulWidget {
  const _ActiveInactiveButton({super.key});

  @override
  State<_ActiveInactiveButton> createState() => _ActiveInactiveButtonState();
}

class _ActiveInactiveButtonState extends State<_ActiveInactiveButton> {
  bool isButtonActive = false;
  @override
  Widget build(BuildContext context) {
    return Row(
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
          child:
              isButtonActive ? const Text('Aktif') : const Text('Aktif Değil'),
        ),
      ],
    );
  }
}

final class _ColorfulButton extends StatefulWidget {
  const _ColorfulButton({super.key});

  @override
  State<_ColorfulButton> createState() => _ColorfulButtonState();
}

final class _ColorfulButtonState extends State<_ColorfulButton> {
  Color color = Colors.purple;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
    );
  }
}
