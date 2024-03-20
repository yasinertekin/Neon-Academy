import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

final class MascotDownloadPage extends StatelessWidget {
  const MascotDownloadPage({
    required this.imageUrl,
    super.key,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return _MascotDownloadView(
      imageUrl: imageUrl,
    );
  }
}

class _MascotDownloadView extends StatelessWidget {
  const _MascotDownloadView({
    required this.imageUrl,
    super.key,
  });

  final String? imageUrl;

  Future<void> _launchInWebView(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalNonBrowserApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mascot Download'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Mascot Download'),
                const SizedBox(height: 20),
                if (imageUrl != null)
                  Image.network(imageUrl!)
                else
                  const Icon(Icons.account_circle, size: 100),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    await _launchInWebView(Uri.parse(imageUrl!));
                  },
                  child: const Text('Download'),
                ),
                CupertinoContextMenuAction(
                  child: const Text('Copy or Share Link'),
                  onPressed: () {
                    Clipboard.setData(
                      ClipboardData(text: imageUrl!),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
