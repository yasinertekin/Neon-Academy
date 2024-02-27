import 'package:custom_alert/custom_alert_mixin.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

part 'widget/custom_alert_dialog.dart';
part 'widget/custom_text_field.dart';

final class CustomAlertView extends StatefulWidget {
  const CustomAlertView({super.key});

  @override
  State<CustomAlertView> createState() => _CustomAlertViewState();
}

final class _CustomAlertViewState extends State<CustomAlertView>
    with CustomAlertMixin {
  String buttonText = '';
  String text = '';

  @override
  showAlertDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return const _CustomAlertDialog();
      },
    );
  }

  @override
  void secondShowAlertDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return _CustomAlertDialog(
          title: const Text('Second Warning!'),
          content: const Text('This is a second custom alert dialog.'),
          actions: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  buttonText = 'OK';
                  setState(() {});
                  Navigator.of(context).pop();
                },
                child: const Text('Ok'), // Dinamik metin
              ),
              TextButton(
                onPressed: () {
                  buttonText = 'Close';
                  setState(() {});
                  Navigator.of(context).pop();
                },
                child: const Text('Close'), // Dinamik metin
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void thirdShowAlertDialog(
      BuildContext context, TextEditingController controller) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return _CustomAlertDialog(
          title: const Text('Third Warning!'),
          content: const Text('This is a third custom alert dialog.'),
          actions: Column(
            children: [
              _CustomTextFild(
                controller,
                (String value) {
                  text = value;
                  setState(() {});
                },
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Ok')),
            ],
          ),
        );
      },
    );
  }

  @override
  void fourthShowAlertDialog(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ListTile(
              title: Text('Unique Title for Activity Controller'),
              subtitle: Text('Subtitle for the Activity Controller'),
            ),
            ListTile(
              title: const Text('Share File'),
              onTap: () {
                //String filePath = '/path/to/your/file';
                //Share.shareFiles([filePath], text: 'Sharing file');
                Share.share(
                  'check out my website https://example.com',
                  subject: 'Look what I madeee!',
                );
              },
            ),
            ListTile(
              title: const Text('Share Image'),
              onTap: () {
                // String imagePath = '/path/to/your/image';
                // Share.shareFiles([imagePath], text: 'Sharing image');
                Share.share(
                  'check out my website https://example.com',
                  subject: 'Look what I made!',
                );
              },
            ),
            // Add more options as needed
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Alert View'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Text: $text'),
            Text('Button Text: $buttonText'),
            ElevatedButton(
              onPressed: () {
                showAlertDialog(context);
              },
              child: const Text('First Alert Dialog'),
            ),
            ElevatedButton(
              onPressed: () {
                secondShowAlertDialog(context);
              },
              child: const Text('Show Second Alert Dialog'),
            ),
            ElevatedButton(
              onPressed: () {
                thirdShowAlertDialog(
                  context,
                  controller,
                );
              },
              child: const Text('Show Third Alert Dialog'),
            ),
            ElevatedButton(
              onPressed: () {
                fourthShowAlertDialog(context);
              },
              child: const Text('Show Fourth Alert Dialog'),
            ),
          ],
        ),
      ),
    );
  }
}
