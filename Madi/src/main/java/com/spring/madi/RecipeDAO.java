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
	
	// 성빈 : 레시피 재료 입력 메소드
	public void insertRecipeIrdnt(RecipeIrdntVO recipeIrdntVO);
	// 성빈 : 레시피 과정 입력 메소드
	public void insertRecipeProcess(RecipeProcessVO recipeProcessVO);
	
	// 성빈 : 배열 형태의 ty_code값이 여러번 입력될 경우 해당 recipe 목록을 조회하는 메소드
	public ArrayList<RecipeVO> getRecipesByTy_code(String[] ty_code);
}
