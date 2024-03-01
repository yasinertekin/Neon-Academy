import 'package:custom_grid_view/neon_apps.dart';
import 'package:flutter/material.dart';

class NeonDetail extends StatelessWidget {
  const NeonDetail({
    super.key,
    required this.neonApps,
  });

  final NeonApps neonApps;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Neon Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(neonApps.appIcon),
            Text(neonApps.appName),
            Text(neonApps.appreleseDate),
            Text(neonApps.appCategory),
            Text(neonApps.storeURL),
          ],
        ),
      ),
    );
  }
}
