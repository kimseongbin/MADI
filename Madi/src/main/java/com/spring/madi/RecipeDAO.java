package com.spring.madi;

import java.util.ArrayList;

public interface RecipeDAO {

	public RecipeVO getRecipeById(RecipeVO recipeVO);
	public ArrayList<RecipeIrdntVO> getRecipeIrdntById(RecipeVO recipeVO);
	public ArrayList<RecipeProcessVO> getRecipeProcessById(RecipeVO recipeVO);
	
	// 게시물 확인
	public ArrayList<RecipeVO> postList();
	
	// 게시물 등록
	public void insertRecipe(RecipeVO recipeVO);
}
