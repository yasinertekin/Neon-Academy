part of '../custom_alert_view.dart';

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
