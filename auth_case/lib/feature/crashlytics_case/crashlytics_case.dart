import 'package:flutter/material.dart';

class CrashlyticsCase extends StatelessWidget {
  const CrashlyticsCase({super.key});

  @override
  Widget build(BuildContext context) {
    return const _CrashlyticsCaseView();
  }
}

class _CrashlyticsCaseView extends StatelessWidget {
  const _CrashlyticsCaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => throw Exception(),
              child: const Text('Throw Test Exception'),
            ),
          ],
        ),
      ),
    );
  }
}
