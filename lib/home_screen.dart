import 'package:flutter/material.dart';
import 'details_screen.dart';
import 'FavoritesScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> recipes = [
    {
      'name': 'Carbonara',
      'Ingredients': [
        'Spaghetti',
        'Salt',
        'Egg',
        'Pepper',
        'Parmigiano Reggiano'
      ],
    },
    {
      'name': 'Pizza',
      'Ingredients': [
        'Dough',
        'Favourite Sauce',
        'Favourite Cheese',
        'Olive Oil',
        'Oregano'
      ],
    },
    {
      'name': 'Mac & Cheese',
      'Ingredients': [
        'Elbow Macaroni',
        'Butter',
        'Milk',
        'Cheese',
        'Salt & Pepper'
      ],
    },
  ];

  List<String> favoriteRecipes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe List'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(recipes[index]['name']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                    recipe: recipes[index]['name'],
                    ingredients: recipes[index]['ingredients'],
                    onFavoriteToggle: (isFavorite) {
                      setState(() {
                        if (isFavorite) {
                          favoriteRecipes.add(recipes[index]['name']);
                        } else {
                          favoriteRecipes.remove(recipes[index]['name']);
                        }
                      });
                    },
                    isFavorite:
                        favoriteRecipes.contains(recipes[index]['name']),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.favorite),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  FavoritesScreen(favoriteRecipes: favoriteRecipes),
            ),
          );
        },
      ),
    );
  }
}
