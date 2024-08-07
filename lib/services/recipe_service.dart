import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketapp/data/models/recipe_model.dart';

class RecipeService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createRecipe(RecipeModel recipe) async {
    await _firestore.collection('recipes').doc(recipe.id).set(recipe.toMap());
  }

  Future<RecipeModel?> getRecipe(String recipeId) async {
    DocumentSnapshot doc = await _firestore.collection('recipes').doc(recipeId).get();
    if (doc.exists) {
      return RecipeModel.fromDocument(doc);
    }
    return null;
  }

  Future<void> updateRecipe(RecipeModel recipe) async {
    await _firestore.collection('recipes').doc(recipe.id).update(recipe.toMap());
  }

  Future<void> deleteRecipe(String recipeId) async {
    await _firestore.collection('recipes').doc(recipeId).delete();
  }

  Future<List<RecipeModel>> getAllRecipes() async {
    QuerySnapshot querySnapshot = await _firestore.collection('recipes').get();
    return querySnapshot.docs.map((doc) => RecipeModel.fromDocument(doc)).toList();
  }
}
