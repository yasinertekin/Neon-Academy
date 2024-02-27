import 'package:flutter/material.dart';

class ScrollViewRescue extends StatelessWidget {
  ScrollViewRescue({super.key});

  final List<String> labels = List.generate(8, (index) => 'Label ${index + 1}');
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final List<String> labels =
        List.generate(8, (index) => 'Label ${index + 1}');

    void showEndOfScrollViewAlert(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('End of Scroll View'),
            content: const Text('You have reached the end of the scroll view.'),
            actions: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      body: SafeArea(
        child: NotificationListener<ScrollEndNotification>(
          onNotification: (notification) {
            if (_scrollController.position.extentAfter == 0) {
              showEndOfScrollViewAlert(context);
            }
            return true;
          },
          child: ListView.builder(
            controller: _scrollController,
            itemCount: labels.length,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              if (index < 3) {
                return ListTile(
                  title: Text(labels[index]),
                );
              } else {
                return SizedBox(
                    height: MediaQuery.of(context).size.height * 2,
                    child: ListTile(
                      title: Text(labels[index]),
                    ));
              }
            },
          ),
        ),
      ),
    );
  }
}
