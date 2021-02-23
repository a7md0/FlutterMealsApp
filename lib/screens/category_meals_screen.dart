import 'package:flutter/material.dart';

import '../models/category.dart';
import '../models/meal.dart';

import '../dummy_data.dart';

import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static final String routeName = '/category-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  Category category;
  List<Meal> displayedMeals;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (category == null) {
      category = ModalRoute.of(context).settings.arguments as Category;
      displayedMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(category.id);
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: displayedMeals.length,
        itemBuilder: (ctx, idx) {
          return MealItem(meal: displayedMeals[idx], removeMeal: _removeMeal);
        },
      ),
    );
  }

  void _removeMeal(Meal meal) {
    setState(() {
      displayedMeals.removeWhere((m) => m.id == meal.id);
    });
  }
}
