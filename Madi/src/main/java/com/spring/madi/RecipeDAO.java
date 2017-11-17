package com.spring.madi;

import java.util.ArrayList;

public interface RecipeDAO {

	public RecipeVO getRecipeById(RecipeVO recipeVO);
	public ArrayList<RecipeIrdntVO> getRecipeIrdntById(RecipeVO recipeVO);
	public ArrayList<RecipeProcessVO> getRecipeProcessById(RecipeVO recipeVO);
	
}
