part of '../home_page.dart';

final class _FoodCard extends StatelessWidget {
  const _FoodCard({
    required this.recipe,
  });

  final Recipes recipe;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(recipe.image.toString()),
        trailing: Text(recipe.difficulty.toString()),
        title: Text(recipe.name.toString()),
        subtitle: Text(recipe.rating.toString()),
      ),
    );
  }
}
