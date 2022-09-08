import 'package:flutter/material.dart';
import 'package:meals/models/settings.dart';
import 'screens/category_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'utils/app_routes.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/settings_screen.dart';
import 'models/meal.dart';
import 'data/dummy_data.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _favoriteMeals = [];
  List<Meal> _availableMeals = dummyMeals;
  Settings settings = Settings();

  void _filterMeals(Settings settings) {
    setState(() {
      _availableMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isfavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

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
        AppRoutes.HOME: (ctx) => TabsScreen(_favoriteMeals),
        AppRoutes.CATEGORIES_MEAL: (cxt) =>
            CategoriesMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAIL: (cxt) =>
            MealDetailScreen(_toggleFavorite, _isfavorite),
        AppRoutes.SETTINGS: (cxt) => SettingsSreens(_filterMeals, settings),
      },
      onUnknownRoute: (_) {
        return MaterialPageRoute(builder: (a) {
          return const CategoriesScreen();
        });
      },
    );
  }
}
