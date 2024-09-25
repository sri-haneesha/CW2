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
        'Parmigiano Reggiano',
        'Carbonara is a classic, 5-ingredient Roman pasta dish made with pasta, eggs, guanciale, Pecorino Romano cheese and black pepper. It’s made by tempering eggs, cheese and starchy pasta cooking water into a luscious creamy pasta sauce. The taste is rich, salty and addictive! There is absolutely no heavy cream in traditional carbonara sauce.'
      ],
    },
    {
      'name': 'Pizza',
      'Ingredients': [
        'Dough',
        'Favourite Sauce',
        'Favourite Cheese',
        'Olive Oil',
        'Oregano',
        'Lets dive into the art of homemade pizza dough! It may seem like a lot of work, but the results promise a delicious meal and the satisfaction of mastering a kitchen staple. With just a handful of ingredients and a bit of patience for rising and resting, you'll soon be on your way to creating a pizza crust that's crispy on the outside and delightfully chewy on the inside.'
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
        'The BEST Homemade Mac and Cheese of your LIFE. Outrageously cheesy, ultra creamy, and topped with a crunchy Panko-Parmesan topping, this mac and cheese recipe is most definitely a keeper.'
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
