import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetail extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function toggleFavorite;
  final Function isMealFavorite;
  MealDetail(this.toggleFavorite, this.isMealFavorite);

  @override
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      height: 150,
      width: 300,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.all(10),
                height: 300,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    selectedMeal.imageUrl,
                    fit: BoxFit.cover,
                  ),
                )),
            buildSectionTitle(context, "Ingredients"),
            buildContainer(
              ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: ((context, index) {
                    return Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 10),
                        child: Text(
                          selectedMeal.ingredients[index],
                          // style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    );
                  })),
            ),
            buildSectionTitle(context, "Steps"),
            buildContainer(
              ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: ((context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text("# ${index + 1}"),
                          ),
                          title: Text(selectedMeal.steps[index]),
                        ),
                        Divider(
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ],
                    );
                  })),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          toggleFavorite(mealId);
        },
        child: Icon(
          isMealFavorite(mealId) ? Icons.star : Icons.star_border,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
