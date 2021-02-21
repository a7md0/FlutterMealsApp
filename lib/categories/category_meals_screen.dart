import 'package:flutter/material.dart';

import '../models/category.dart';
import '../models/meal.dart';

import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static final String routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, idx) {
          return Text(categoryMeals[idx].title);
        },
      ),
    );
  }
}
