package com.spring.madi;

import java.util.ArrayList;

import com.spring.madi.RecipeVO;


public interface RecipeMapper {
	
	RecipeVO getRecipeById(RecipeVO recipeVO);
	ArrayList<RecipeIrdntVO> getRecipeIrdntById(RecipeVO recipeVO);
	ArrayList<RecipeProcessVO> getRecipeProcessById(RecipeVO recipeVO);
	
	ArrayList<RecipeVO> postList();
	void insertRecipe(RecipeVO recipeVO);
	// 성빈 : 배열 형태의 ty_code값이 여러번 입력될 경우 해당 recipe 목록을 조회하는 메소드
	ArrayList<RecipeVO> getRecipesByTy_code(String[] ty_code);
	
}
