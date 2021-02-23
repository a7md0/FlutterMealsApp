import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  Map<String, bool> filters;
  Function saveFilters;

  FiltersScreen({Map<String, bool> filters, Function saveFilters}) {
    this.filters = Map<String, bool>.from(filters);
    this.saveFilters = saveFilters;
  }

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => widget.saveFilters(widget.filters),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchTile(
                  title: 'Gluten-free',
                  subtitle: 'Only include gluten-free meals.',
                  value: widget.filters['glutenFree'],
                  onChanged: (newValue) {
                    setState(() {
                      widget.filters['glutenFree'] = newValue;
                    });
                  },
                ),
                _buildSwitchTile(
                  title: 'Lactose-free',
                  subtitle: 'Only include gluten-free meals.',
                  value: widget.filters['lactoseFree'],
                  onChanged: (newValue) {
                    setState(() {
                      widget.filters['lactoseFree'] = newValue;
                    });
                  },
                ),
                _buildSwitchTile(
                  title: 'Vegetarian',
                  subtitle: 'Only include vegetarian meals.',
                  value: widget.filters['vegetarian'],
                  onChanged: (newValue) {
                    setState(() {
                      widget.filters['vegetarian'] = newValue;
                    });
                  },
                ),
                _buildSwitchTile(
                  title: 'Vegan',
                  subtitle: 'Only include vegan meals.',
                  value: widget.filters['vegan'],
                  onChanged: (newValue) {
                    setState(() {
                      widget.filters['vegan'] = newValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSwitchTile({
    String title,
    String subtitle,
    bool value,
    Function onChanged,
  }) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }
}
