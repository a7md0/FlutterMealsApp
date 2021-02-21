import 'dart:js';

import 'package:flutter/material.dart';

import '../models/category.dart';

class CategoryMealsScreen extends StatelessWidget {
  static final String routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;

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
