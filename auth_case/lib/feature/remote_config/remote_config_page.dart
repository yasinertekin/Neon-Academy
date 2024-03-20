import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

class RemoteConfigPage extends StatelessWidget {
  const RemoteConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _RemoteConfigView();
  }
}

class _RemoteConfigView extends StatefulWidget {
  const _RemoteConfigView({super.key});

  @override
  State<_RemoteConfigView> createState() => _RemoteConfigViewState();
}

final class _RemoteConfigViewState extends State<_RemoteConfigView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(_fetchRemoteConfig);
  }

  final remoteConfig = FirebaseRemoteConfig.instance;

  Future<void> _fetchRemoteConfig() async {
    await remoteConfig.fetchAndActivate();
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(hours: 1),
      ),
    );

    await remoteConfig.setDefaults(<String, dynamic>{
      'title': 'Default Title',
      'isHidden': false,
      'imagePath': 'https://via.placeholder.com/200',
      'number': '0',
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Remote Config'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              remoteConfig.getString('title'),
            ),
            const SizedBox(height: 20),
            if (remoteConfig.getBool('isHidden'))
              const SizedBox()
            else
              Image.network(
                remoteConfig.getString('imagePath'),
                height: 200,
              ),
            const SizedBox(height: 20),
            Text(
              remoteConfig.getString('number'),
            ),
            ElevatedButton(
              onPressed: () {
                remoteConfig.getBool('isHidden')
                    ? remoteConfig
                        .setDefaults(<String, dynamic>{'isHidden': false})
                    : remoteConfig
                        .setDefaults(<String, dynamic>{'isHidden': true});
                Future.delayed(const Duration(seconds: 1), () {
                  setState(() {});
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'isHidden changed to ${remoteConfig.getBool('isHidden')} ',
                    ),
                  ),
                );
              },
              child: const Text('Click me'),
            ),
          ],
        ),
      ),
    );
  }
}
