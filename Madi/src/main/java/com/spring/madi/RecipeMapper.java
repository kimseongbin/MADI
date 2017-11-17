package com.spring.madi;

import java.util.ArrayList;

public interface RecipeMapper {
	
	RecipeVO getRecipeById(RecipeVO recipeVO);
	ArrayList<RecipeIrdntVO> getRecipeIrdntById(RecipeVO recipeVO);
	ArrayList<RecipeProcessVO> getRecipeProcessById(RecipeVO recipeVO);
	
}
