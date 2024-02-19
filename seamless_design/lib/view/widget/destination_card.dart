part of '../home_view.dart';

final class _DestinationCard extends StatelessWidget {
  const _DestinationCard({
    required this.destination,
  });

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                height: MediaQuery.of(context).size.height / 7,
                destination.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Spacer(),
          Text(
            destination.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
