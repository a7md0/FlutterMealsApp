import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../widgets/category_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  final Function toggleFavorite;

  FavoritesScreen(this.favoriteMeals, this.toggleFavorite);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    }

    return ListView.builder(
      itemCount: favoriteMeals.length,
      itemBuilder: (ctx, idx) {
        return MealItem(
          meal: favoriteMeals[idx],
          favoriteMeal: (meal) => toggleFavorite(meal),
        );
      },
    );
  }
}
