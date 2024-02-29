import 'package:custom_grid_view/neon_apps.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final class NeonAppsView extends StatefulWidget {
  const NeonAppsView({super.key});

  @override
  State<NeonAppsView> createState() => _NeonAppsViewState();
}

final class _NeonAppsViewState extends State<NeonAppsView> {
  List<NeonApps> myApps = [];
  bool isLoading = false;

  void _changeLoading() {
    isLoading = !isLoading;

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _loadApps();
  }

  void _loadApps() async {
    _changeLoading();
    await Future.delayed(const Duration(seconds: 1));
    myApps = NeonAppsList.apps;
    setState(() {});

    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Neon Apps'),
        actions: [
          IconButton(
            onPressed: () {
              _loadApps();
              setState(() {});
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.9,
                mainAxisExtent: 300,
              ),
              itemCount: myApps.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () async {
                    final Uri url = Uri.parse(
                      myApps[index].storeURL,
                    );
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Image.asset(
                          alignment: Alignment.center,
                          myApps[index].appIcon,
                          height: myApps[index].height,
                          width: myApps[index].height,
                          fit: BoxFit.cover,
                        ),
                        Text(myApps[index].appName),
                        Text(myApps[index].appreleseDate),
                        Text(myApps[index].appCategory),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
