part of '../home_page.dart';

final class _FoodList extends StatelessWidget {
  const _FoodList({
    this.recipes,
  });

  final List<Recipes>? recipes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recipes?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        final recipe = recipes?[index];
        return _FoodCard(
          recipe: recipe!,
        );
      },
    );
  }
}
