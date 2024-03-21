import 'package:custom_grid_view/neon_apps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';

import 'neon_detail.dart';

final class NeonAppsView extends StatefulWidget {
  const NeonAppsView({super.key});

  @override
  State<NeonAppsView> createState() => _NeonAppsViewState();
}

final class _NeonAppsViewState extends State<NeonAppsView> {
  List<NeonApps> myApps = [];
  bool isLoading = false;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _changeLoading() {
    isLoading = !isLoading;

    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _refreshController.dispose();
  }

  Future<void> _launchInWebView(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalNonBrowserApplication)) {
      throw Exception('Could not launch $url');
    }
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

  Future<void> updateBackground(int index) async {
    setState(() {
      myApps = List.from(myApps); // Yeni bir değiştirilebilir kopya oluştur
      myApps[index] = myApps[index].copyWith(
        backgroundColor: Colors.primaries[index % Colors.primaries.length],
      );
    });
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
      body: SmartRefresher(
        onRefresh: () async {
          _loadApps();
          _refreshController.refreshCompleted();
        },
        controller: _refreshController,
        enablePullDown: true,
        enablePullUp: false,
        footer: const ClassicFooter(
          loadStyle: LoadStyle.ShowWhenLoading,
          completeDuration: Duration(milliseconds: 500),
          noDataText: 'No more data',
          loadingText: 'Loading...',
          canLoadingIcon: Icon(Icons.arrow_upward),
          idleText: 'Load more',
          failedText: 'Load failed!',
          idleIcon: Icon(Icons.arrow_upward),
          canLoadingText: 'Release to load more',
          noMoreIcon: Icon(Icons.arrow_upward),
        ),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 60,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.5,
                  mainAxisExtent:
                      myApps.any((element) => element.height > 150) ? 400 : 250,
                ),
                itemCount: myApps.length,
                itemBuilder: (BuildContext context, int index) {
                  return CupertinoContextMenu(
                    actions: [
                      CupertinoContextMenuAction(
                        trailingIcon: Icons.open_in_new,
                        child: const Text('Open in App Store'),
                        onPressed: () async {
                          await updateBackground(index);

                          _launchInWebView(Uri.parse(myApps[index].storeURL));
                        },
                      ),
                    ],
                    child: GestureDetector(
                      onTap: () async {
                        await updateBackground(index);
                        Navigator.push(
                          context,
                          MaterialPageRoute<Widget>(
                            builder: (context) => NeonDetail(
                              neonApps: myApps[index],
                            ),
                          ),
                        );
                      },
                      child: Card(
                        color: myApps[index].backgroundColor,
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
                    ),
                  );
                },
              ),
      ),
    );
  }
}
