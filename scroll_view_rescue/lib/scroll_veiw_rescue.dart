import 'package:flutter/material.dart';
import 'package:scroll_view_rescue/scroll_view_mixin.dart';

final class ScrollViewRescue extends StatefulWidget {
  const ScrollViewRescue({super.key});
  @override
  State<ScrollViewRescue> createState() => _ScrollViewRescueState();
}

final class _ScrollViewRescueState extends State<ScrollViewRescue>
    with ScrollViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _ScrollViewAppBar(),
      body: ListView.builder(
        controller: scrollController,
        itemCount: data.length + 1,
        itemBuilder: (context, index) {
          if (index == data.length) {
            if (isEndOfList) {
              return const Center(
                child: Text(
                  'End of List!',
                  style: TextStyle(fontSize: 18),
                ),
              );
            } else {
              loadAdditionalSpells();
              return const Center(child: CircularProgressIndicator());
            }
          }

          return _IndexCard(
            index: index,
          );
        },
      ),
    );
  }
}

class _ScrollViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _ScrollViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 50,
      title: const Text('Scroll View Rescue'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _IndexCard extends StatelessWidget {
  const _IndexCard({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.22,
      child: Card(
        color: Colors.deepPurple,
        child: Center(
          child: Text(
            'index ${index + 1}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
