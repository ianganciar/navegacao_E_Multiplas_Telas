import 'package:flutter/material.dart';
import '../models/category.dart';
import '../components/meal_item.dart';
import '../models/meal.dart';

class CategoriesMealsScreen extends StatelessWidget {
  const CategoriesMealsScreen(this.meal, {Key? key}) : super(key: key);

  final List<Meal> meal;

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    final categoryMeals =
        meal.where((meal) => meal.categories.contains(category.id)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) {
          return MealItem(categoryMeals[index]);
        },
      ),
    );
  }
}
