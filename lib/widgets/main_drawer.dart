import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(height: 20),
          _buildListTile(
            title: 'Meals',
            iconData: Icons.restaurant,
            context: context,
            routeName: '/',
          ),
          _buildListTile(
            title: 'Filters',
            iconData: Icons.settings,
            context: context,
            routeName: FiltersScreen.routeName,
          ),
        ],
      ),
    );
  }

  Widget _buildListTile({
    @required String title,
    @required IconData iconData,
    @required BuildContext context,
    @required String routeName,
  }) {
    return ListTile(
        leading: Icon(
          iconData,
          size: 26,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () => Navigator.of(context).pushReplacementNamed(routeName));
  }
}
