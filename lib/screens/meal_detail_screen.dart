import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static final String routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (ctx, idx) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(meal.ingredients[idx]),
                    ),
                  );
                },
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (ctx, idx) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${idx + 1}'),
                        ),
                        title: Text(meal.steps[idx]),
                      ),
                      Divider()
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }
}
