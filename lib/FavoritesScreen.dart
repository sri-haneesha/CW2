import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  final List<String> favoriteRecipes;

  FavoritesScreen({required this.favoriteRecipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Recipes', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      ),
      body: favoriteRecipes.isEmpty
          ? Center(
              child: Text(
                'No favorites yet!',
                style: TextStyle(fontSize: 20, color: Colors.grey[700]),
              ),
            )
          : ListView.builder(
              itemCount: favoriteRecipes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    favoriteRecipes[index],
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                  ),
                );
              },
            ),
    );
  }
}
