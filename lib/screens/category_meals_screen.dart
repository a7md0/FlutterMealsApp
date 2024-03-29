import 'package:flutter/material.dart';

import '../models/category.dart';
import '../models/meal.dart';

import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static final String routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

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
      displayedMeals = widget.availableMeals.where((meal) {
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
          return MealItem(
            meal: displayedMeals[idx],
            // removeMeal: _removeMeal,
            favoriteMeal: () {},
          );
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
