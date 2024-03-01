import 'package:flutter/material.dart';
import 'package:list_view_case/fake_news.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SliverList(),
    );
  }
}

final class FakeNewsView extends StatelessWidget {
  const FakeNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        // scrollDirection: Axis.vertical,
        itemCount: FakeNewsList.news.length,

        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                leading: Image.asset(FakeNewsList.news[index].imageUrl),
                title: Text(FakeNewsList.news[index].title),
                subtitle: Text(FakeNewsList.news[index].description),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SliverList extends StatelessWidget {
  const SliverList({super.key});

  final _gridDelegate = const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 10,
    crossAxisSpacing: 10,
    childAspectRatio: 1,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        semanticChildCount: FakeNewsList.news.length,
        slivers: <Widget>[
          SliverAppBar(
            title: const Text('Fake News'),
            floating: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('assets/img_one.png', fit: BoxFit.cover),
            ),
          ),
          SliverGrid(
            gridDelegate: _gridDelegate,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Card(
                  child: Column(
                    children: <Widget>[
                      Image.asset(FakeNewsList.news[index].imageUrl),
                      Text(FakeNewsList.news[index].title),
                    ],
                  ),
                );
              },
              childCount: FakeNewsList.news.length,
            ),
          ),
        ],
      ),
    );
  }
}
