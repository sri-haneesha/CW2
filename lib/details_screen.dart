import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final String recipe;
  final List<String> ingredients;
  final Function(bool) onFavoriteToggle;
  final bool isFavorite;

  DetailsScreen({
    required this.recipe,
    required this.ingredients,
    required this.onFavoriteToggle,
    required this.isFavorite,
  });

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      widget.onFavoriteToggle(isFavorite);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.recipe} Details', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ingredients for ${widget.recipe}:',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            SizedBox(height: 10),
            ...widget.ingredients.map((ingredient) => Text(
                  '- $ingredient',
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                )).toList(),
            SizedBox(height: 20),
            Text('Recipe details:', style: TextStyle(fontSize: 20, color: Colors.black87)),
            SizedBox(height: 10),
            Text(
              getRecipeDescription(widget.recipe),
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: toggleFavorite,
              child: Text(isFavorite ? 'Unmark as Favorite' : 'Mark as Favorite'),
              style: ElevatedButton.styleFrom(primary: Colors.red),
            ),
          ],
        ),
      ),
    );
  }

  String getRecipeDescription(String recipe) {
    switch (recipe) {
      case 'Carbonara':
        return 'Carbonara is a classic Roman pasta dish known for its simplicity and rich flavor. To prepare it, start by cooking spaghetti in a pot of salted boiling water until it reaches al dente. In a separate bowl, whisk together eggs and grated Parmigiano Reggiano cheese. In a skillet, cook pancetta until it becomes crispy, then remove it from the heat. Once the pasta is cooked, drain it and immediately toss it into the skillet with the pancetta, allowing the residual heat to warm the pasta. Quickly mix in the egg and cheese mixture, stirring vigorously to create a creamy sauce. Serve hot, garnished with freshly cracked black pepper and additional cheese if desired.';
      case 'Pizza':
        return 'Homemade pizza is a delightful dish that allows for endless customization. Start by preparing your pizza dough, letting it rise until it doubles in size. Preheat your oven to a high temperature, around 475°F (245°C). Roll out the dough on a floured surface to your desired thickness. Spread your favorite sauce evenly over the base, then generously sprinkle with cheese. Add toppings of your choice, such as pepperoni, vegetables, or herbs. Bake the pizza in the preheated oven for about 10-15 minutes or until the crust is golden and the cheese is bubbly. Slice and enjoy your delicious creation fresh out of the oven!';
      case 'Mac & Cheese':
        return 'Mac and cheese is the ultimate comfort food, beloved by both kids and adults alike. To make it, start by cooking elbow macaroni in a pot of salted boiling water until tender. While the pasta cooks, melt butter in a saucepan over medium heat. Stir in flour to create a roux, cooking for a minute until golden. Gradually whisk in milk, allowing the mixture to thicken. Once thickened, remove from heat and stir in a generous amount of cheese until melted and smooth. Combine the cheese sauce with the drained macaroni, mixing well to ensure every piece is coated. Serve hot, and if you like, top with breadcrumbs and bake for a crispy finish.';
      default:
        return 'No description available.';
    }
  }
}
