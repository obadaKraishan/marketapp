import 'package:cloud_firestore/cloud_firestore.dart';

class Ingredient {
  final String ingredientId;
  final String quantity;

  Ingredient({
    required this.ingredientId,
    required this.quantity,
  });

  factory Ingredient.fromMap(Map<String, dynamic> data) {
    return Ingredient(
      ingredientId: data['ingredient_id'],
      quantity: data['quantity'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ingredient_id': ingredientId,
      'quantity': quantity,
    };
  }
}

class RecipeModel {
  final String id;
  final String title;
  final List<Ingredient> ingredients;
  final String instructions;
  final List<String> relatedProducts;

  RecipeModel({
    required this.id,
    required this.title,
    required this.ingredients,
    required this.instructions,
    required this.relatedProducts,
  });

  factory RecipeModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return RecipeModel(
      id: doc.id,
      title: data['title'],
      ingredients: List<Ingredient>.from(data['ingredients'].map((item) => Ingredient.fromMap(item))),
      instructions: data['instructions'],
      relatedProducts: List<String>.from(data['related_products']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'ingredients': ingredients.map((item) => item.toMap()).toList(),
      'instructions': instructions,
      'related_products': relatedProducts,
    };
  }
}
