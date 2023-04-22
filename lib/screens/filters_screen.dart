import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _GlutenFree = false;
  var _LactoseFree = false;
  var _Vegan = false;
  var _Vegetarian = false;

  @override
  void initState() {
    _GlutenFree = widget.currentFilters['gluten']!;
    _LactoseFree = widget.currentFilters['lactose']!;
    _Vegan = widget.currentFilters['vegan']!;
    _Vegetarian = widget.currentFilters['vegetarian']!;
    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, String description, var currentValue, updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _GlutenFree,
                  'lactose': _LactoseFree,
                  'vegan': _Vegan,
                  'vegetarian': _Vegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(10),
            child: Center(
              child: Text(
                "Adjust your meal selection..",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                  "Gluten-free", "Only include gluten free meals", _GlutenFree,
                  (newValue) {
                setState(() {
                  _GlutenFree = newValue;
                });
              }),
              _buildSwitchListTile("Lactose-free",
                  "Only include lactose free meals", _LactoseFree, (newValue) {
                setState(() {
                  _LactoseFree = newValue;
                });
              }),
              _buildSwitchListTile(
                  "Vegetarian", "Only include vegetarian meals", _Vegetarian,
                  (newValue) {
                setState(() {
                  _Vegetarian = newValue;
                });
              }),
              _buildSwitchListTile("Vegan", "Only include vegan meals", _Vegan,
                  (newValue) {
                setState(() {
                  _Vegan = newValue;
                });
              })
            ],
          ))
        ],
      ),
    );
  }
}
