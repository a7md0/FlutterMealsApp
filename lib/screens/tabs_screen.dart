import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

import './categories_screen.dart';
import './favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _tabs = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavoritesScreen(), 'title': 'Favorites'},
  ];
  int _activeTabIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tabs[_activeTabIdx]['title'] as String),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: _tabs[_activeTabIdx]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectTab,
        currentIndex: _activeTabIdx,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
    // DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text('Meals'),
    //       bottom: TabBar(
    //         tabs: [
    //           Tab(
    //             icon: Icon(Icons.category),
    //             text: 'Categories',
    //           ),
    //           Tab(
    //             icon: Icon(Icons.star),
    //             text: 'Favorites',
    //           ),
    //         ],
    //       ),
    //     ),
    //     body: TabBarView(
    //       children: [
    //         CategoriesScreen(),
    //         FavoritesScreen(),
    //       ],
    //     ),
    //   ),
    // );
  }

  void _selectTab(int idx) {
    setState(() {
      _activeTabIdx = idx;
    });
  }
}
