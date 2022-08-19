import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/category.dart';
import '../screens/categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({Key? key, required this.category}) : super(key: key);

  void _selectCategory(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return CategoriesMealsScreen(category: category);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      borderRadius: BorderRadius.circular(20),
      splashColor: Theme.of(context).colorScheme.secondary,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.3),
                category.color,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            )),
        child: Center(
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      ),
    );
  }
}
