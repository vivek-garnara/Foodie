import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildListTile(String title, IconData icon, VoidCallback tapHandler) {
      return ListTile(
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          title,
          style: TextStyle(
              fontFamily: "RobotoCondensed",
              fontWeight: FontWeight.w500,
              fontSize: 24),
        ),
        onTap: tapHandler,
      );
    }

    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            padding: EdgeInsets.all(15),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              "Coocking up!",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          buildListTile("Meal", Icons.restaurant, (() {
            Navigator.of(context).pushReplacementNamed("/");
          })),
          buildListTile("Filters", Icons.settings, (() {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          }))
        ],
      ),
    );
  }
}
