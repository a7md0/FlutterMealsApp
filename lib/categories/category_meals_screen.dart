import 'package:flutter/material.dart';

import '../models/category.dart';

class CategoryMealsScreen extends StatelessWidget {
  final Category category;

  CategoryMealsScreen(this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        child: Text('The receipes for the Category!'),
      ),
    );
  }
}
