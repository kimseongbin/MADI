package com.spring.madi;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RecipeDAOService implements RecipeDAO {
	
	// DB와 Mybatis 연결을 위한 연결 객체
		@Autowired
		private SqlSession sqlSession;
		
		public RecipeVO getRecipeById(RecipeVO recipeVO) {
			//Mapper객체 생성 (Mapper는 정의된 메소드 이름을 사용해 Mybatis를 통해 호출할 쿼리문을 찾는다)
			RecipeMapper recipeMapper = sqlSession.getMapper(RecipeMapper.class);
			
			RecipeVO vo = new RecipeVO();
			vo = recipeMapper.getRecipeById(recipeVO);
			
			return vo;
		}
		
		public ArrayList<RecipeIrdntVO> getRecipeIrdntById(RecipeVO recipeVO){
			//Mapper객체 생성 (Mapper는 정의된 메소드 이름을 사용해 Mybatis를 통해 호출할 쿼리문을 찾는다)
			RecipeMapper recipeMapper = sqlSession.getMapper(RecipeMapper.class);
			
			ArrayList<RecipeIrdntVO> recipeIrdnt = new ArrayList<RecipeIrdntVO>();
			recipeIrdnt = recipeMapper.getRecipeIrdntById(recipeVO);
			
			return recipeIrdnt;
		}
		
		public ArrayList<RecipeProcessVO> getRecipeProcessById(RecipeVO recipeVO) {
			//Mapper객체 생성 (Mapper는 정의된 메소드 이름을 사용해 Mybatis를 통해 호출할 쿼리문을 찾는다)
			RecipeMapper recipeMapper = sqlSession.getMapper(RecipeMapper.class);
			
			ArrayList<RecipeProcessVO> recipeProcess = new ArrayList<RecipeProcessVO>();
			recipeProcess = recipeMapper.getRecipeProcessById(recipeVO);
			
			return recipeProcess;
		}
		
		
		@Override
		public ArrayList<RecipeVO> postList() {
			// 게시물 목록
			ArrayList<RecipeVO> postList = new ArrayList<RecipeVO>();
			RecipeMapper recipeMapper = sqlSession.getMapper(RecipeMapper.class);
			
			postList = recipeMapper.postList();
		
			return postList;
		}
		 
		@Override
		public void insertRecipe(RecipeVO recipeVO) {
			
			// 게시물 등록
			RecipeMapper recipeMapper = sqlSession.getMapper(RecipeMapper.class);
			recipeMapper.insertRecipe(recipeVO);
		}
		
		// 성빈 : 배열 형태의 ty_code값이 여러번 입력될 경우 해당 recipe 목록을 조회하는 메소드
		@Override
		public ArrayList<RecipeVO> getRecipesByTy_code(String[] ty_code) {
			//Mapper객체 생성 (Mapper는 정의된 메소드 이름을 사용해 Mybatis를 통해 호출할 쿼리문을 찾는다)
			System.out.println(ty_code[0]);
			RecipeMapper recipeMapper = sqlSession.getMapper(RecipeMapper.class);
			
			ArrayList<RecipeVO> recipeList = new ArrayList<RecipeVO>();
			recipeList = recipeMapper.getRecipesByTy_code(ty_code);
			System.out.println(recipeList==null?"null":"not null");
			System.out.println("recipeLsit szie is " + recipeList.size());
			return recipeList;
		}
	
}
