import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/screens/filters_screen.dart';

import './screens/tabs_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'glutenFree': false,
    'lactoseFree': false,
    'vegetarian': false,
    'vegan': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeals, _toggleFavorite),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavorite, _isMealFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(
              filters: _filters,
              saveFilters: _setFilters,
            ),
      },
    );
  }

  void _setFilters(Map<String, bool> filtersData) {
    setState(() {
      _filters = filtersData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['glutenFree'] && meal.isGlutenFree == false) {
          return false;
        }
        if (_filters['lactoseFree'] && meal.isLactoseFree == false) {
          return false;
        }
        if (_filters['vegetarian'] && meal.isVegetarian == false) {
          return false;
        }
        if (_filters['vegan'] && meal.isVegan == false) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    final idx = _favoriteMeals.indexWhere((m) => m.id == meal.id);

    setState(() {
      if (idx >= 0) {
        _favoriteMeals.removeAt(idx);
      } else {
        _favoriteMeals.add(meal);
      }
    });
  }

  bool _isMealFavorite(Meal meal) {
    return _favoriteMeals.any((m) => m.id == meal.id);
  }
}
