part of '../home_page.dart';

final class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({
    required this.error,
  });

  final String error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error),
    );
  }
}
