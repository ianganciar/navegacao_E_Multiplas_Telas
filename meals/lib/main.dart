import 'package:flutter/material.dart';
import 'screens/category_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'utils/app_routes.dart';
import 'screens/meal_detail_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData();

    return MaterialApp(
      title: 'Food App',
      theme: tema.copyWith(
        scaffoldBackgroundColor: const Color.fromRGBO(255, 254, 229, 1),
        colorScheme: tema.colorScheme.copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
          background: Colors.black,
        ),
        textTheme: tema.textTheme.copyWith(
            headline5: const TextStyle(
              fontFamily: 'RaleWay',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            headline6: const TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
      routes: {
        AppRoutes.HOME: (ctx) => const CategoriesScreen(),
        AppRoutes.CATEGORIES_MEAL: (cxt) => const CategoriesMealsScreen(),
        AppRoutes.MEAL_DETAIL: (cxt) => const MealDetailScreen(),
      },
      onUnknownRoute: (_) {
        return MaterialPageRoute(builder: (a) {
          return const CategoriesScreen();
        });
      },
    );
  }
}
