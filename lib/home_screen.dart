import 'package:flutter/material.dart';
import 'details_screen.dart';
import 'favorites_screen.dart';

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
        'Parmigiano Reggiano',
        'Carbonara is a classic, 5-ingredient Roman pasta dish made with pasta, eggs, guanciale, Pecorino Romano cheese and black pepper.'
      ],
    },
    {
      'name': 'Pizza',
      'Ingredients': [
        'Dough',
        'Favorite Sauce',
        'Favorite Cheese',
        'Olive Oil',
        'Oregano',
        'Lets dive into the art of homemade pizza dough!'
      ],
    },
    {
      'name': 'Mac & Cheese',
      'Ingredients': [
        'Elbow Macaroni',
        'Butter',
        'Milk',
        'Cheese',
        'Salt & Pepper',
        'The BEST Homemade Mac and Cheese of your LIFE.'
      ],
    },
  ];

  List<String> favoriteRecipes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe List', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                recipes[index]['name'],
                style: TextStyle(fontSize: 20, color: Colors.black87),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                      recipe: recipes[index]['name'],
                      ingredients: recipes[index]['Ingredients'],
                      onFavoriteToggle: (isFavorite) {
                        setState(() {
                          if (isFavorite) {
                            favoriteRecipes.add(recipes[index]['name']);
                          } else {
                            favoriteRecipes.remove(recipes[index]['name']);
                          }
                        });
                      },
                      isFavorite: favoriteRecipes.contains(recipes[index]['name']),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.favorite),
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FavoritesScreen(favoriteRecipes: favoriteRecipes),
            ),
          );
        },
      ),
    );
  }
}
