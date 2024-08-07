import 'package:marketapp/data/models/recipe_model.dart';
import 'package:marketapp/services/recipe_service.dart';

class RecipeRepository {
  final RecipeService _recipeService = RecipeService();

  Future<void> createRecipe(RecipeModel recipe) async {
    await _recipeService.createRecipe(recipe);
  }

  Future<RecipeModel?> getRecipe(String recipeId) async {
    return await _recipeService.getRecipe(recipeId);
  }

  Future<void> updateRecipe(RecipeModel recipe) async {
    await _recipeService.updateRecipe(recipe);
  }

  Future<void> deleteRecipe(String recipeId) async {
    await _recipeService.deleteRecipe(recipeId);
  }

  Future<List<RecipeModel>> getAllRecipes() async {
    return await _recipeService.getAllRecipes();
  }
}
