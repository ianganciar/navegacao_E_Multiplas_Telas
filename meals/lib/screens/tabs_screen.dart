import 'package:flutter/material.dart';
import 'category_screen.dart';
import 'favorite_screen.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('Food App')),
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categorias',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favoritos',
              ),
            ]),
          ),
          body: const TabBarView(children: [
            CategoriesScreen(),
            FavoriteScreen(),
          ]),
        ));
  }
}
