import 'package:custom_alert/custom_alert_mixin.dart';
import 'package:flutter/material.dart';

final class CustomAlertView extends StatefulWidget {
  const CustomAlertView({super.key});

  @override
  State<CustomAlertView> createState() => _CustomAlertViewState();
}

final class _CustomAlertViewState extends State<CustomAlertView>
    with CustomAlertMixin {
  @override
  showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const _CustomAlertDialog();
      },
    );
  }

  @override
  void secondShowAlertDialog(BuildContext context) {
    showDialog(
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
                  Navigator.of(context).pop();
                },
                child: const Text('OK!'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close!'),
              ),
            ],
          ),
        );
      },
    );
  }

  final String _secondShowAlertDialogButtonTitle = 'Ok';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Alert View'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                showAlertDialog(context);
              },
              child: const Text('Show Alert Dialog'),
            ),
            ElevatedButton(
              onPressed: () {
                secondShowAlertDialog(context);
              },
              child: const Text('Show Second Alert Dialog'),
            ),
          ],
        ),
      ),
    );
  }
}

final class _CustomAlertDialog extends StatelessWidget {
  const _CustomAlertDialog({
    this.title,
    this.content,
    this.actions,
  });

  final Widget? title;

  final Widget? content;

  final Widget? actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title ?? const Text('Warning!'),
      content: content ?? const Text('This is a custom alert dialog.'),
      actions: <Widget>[
        actions ??
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK!'),
            ),
      ],
    );
  }
}
