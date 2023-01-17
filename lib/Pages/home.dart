import 'package:flutter/material.dart';
import 'package:food_api/Models/food_model.dart';
import 'package:food_api/Models/recipe.api.dart';
import 'package:food_api/Pages/recipe_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> _recipe = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    _recipe = await RecipeApi.getRecipe();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.restaurant_menu),
          Text(
            'Food Recipe',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ])),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _recipe.length,
                itemBuilder: ((context, index) {
                  return RecipeCard(
                    title: _recipe[index].name,
                    rating: _recipe[index].rating.toString(),
                    cookTime: _recipe[index].totalTime,
                    thumbnailUrl: _recipe[index].images,
                  );
                })));
  }
}
