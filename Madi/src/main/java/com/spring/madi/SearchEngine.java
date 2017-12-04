package com.spring.madi;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.StringTokenizer;

// 성빈 : 재료 별 레시피 검색을 위한 Class
public class SearchEngine {
	
	// 성빈 : 기본 생성자
	public SearchEngine() {

	}

	// 성빈 : 주재료, 부재료, 양념 입력값을 토큰으로 분해해 list로 리턴하는 메소드
	// 예를 들어, 주재료 입력값이 String 타입의 "/양파/부추/당근/등심"라고 할 때, list에 양파, 부추, 당근, 등심으로
	// 분해해 add한다
	// list의 size는 4가 되고 각각의 list에는 재료의 입력값이 저장된다.
	public ArrayList<String> splitStringBySlash(String str) {
		ArrayList<String> irdntList = new ArrayList<String>();

		StringTokenizer stk = new StringTokenizer(str, "/", false);
		while (stk.hasMoreElements()) {
			String splitString = stk.nextToken();
			irdntList.add(splitString);
		}

		return irdntList;
	}

	// 성빈: where 조건절에 재료의 개수만큼 like 조건을 추가한 subQuery문을 리턴하는 메소드
	// 재료의 개수에 따라 like 조건이 추가된다.
	public String getLikeSubQuery(ArrayList<String> irdntList) {

		String likeSubQuery = "select * from recipe_irdnt where";

		for (int i = 0; i < irdntList.size(); i++) {
			if (i == 0) {
				likeSubQuery += " irdnt_name Like '%" + irdntList.get(i) + "%'";
			} else {
				likeSubQuery += " OR" + " irdnt_name Like '%" + irdntList.get(i) + "%'";
			}
		}

		return likeSubQuery;
	}

	// 성빈: likeSubQuery로 검색한 recipe list에서 각각의 recipe_id 별 main인 재료가 몇 번 들어가는지를
	// 검색하는 쿼리문을 리턴하는 메소드
	public String getMainSubQuery(String likeSubQuery) {
		String mainSubQuery = "select recipe_id, count(irdnt_ty_code) as main from (" + likeSubQuery
				+ ") where irdnt_ty_code = 3060001 group by recipe_id";
		return mainSubQuery;
	}

	// 성빈: likeSubQuery로 검색한 recipe list가 sub인 경우를 검색하는 쿼리문을 리턴하는 메소드
	public String getSubSubQuery(String likeSubQuery) {
		String subSubQuery = "select recipe_id, count(irdnt_ty_code) as sub from (" + likeSubQuery
				+ ") where irdnt_ty_code = 3060002 group by recipe_id";
		return subSubQuery;
	}

	// 성빈: likeSubQuery로 검색한 recipe list가 source인 경우를 검색하는 쿼리문을 리턴하는 메소드
	public String getSourceSubQuery(String likeSubQuery) {
		String sourceSubQuery = "select recipe_id, count(irdnt_ty_code) as source from (" + likeSubQuery
				+ ") where irdnt_ty_code = 3060003 group by recipe_id";
		return sourceSubQuery;
	}

	// 성빈: 3개의 list, 주재료, 부재료, 양념에 대한 list를 받아 이에 해당하는 recipe list를 리턴하는 메소드
	// 동적 SQL 쿼리문 작성을 위해 JDBC를 사용
	public ArrayList<RecipeVO> searchRecipesByIngredients(String main, String sub, String source) {
		SearchEngine se = new SearchEngine();
		ArrayList<RecipeVO> recipeList = new ArrayList<RecipeVO>();
		String mainSQL = se.getMainSubQuery(se.getLikeSubQuery(se.splitStringBySlash(main)));
		String subSQL = se.getSubSubQuery(se.getLikeSubQuery(se.splitStringBySlash(sub)));
		String sourceSQL = se.getSourceSubQuery(se.getLikeSubQuery(se.splitStringBySlash(source)));
		String recipeListSQL = "select a.recipe_id, a.main, b.sub, c.source"
								+ " from (" + mainSQL + ") a, (" + subSQL + ") b, (" + sourceSQL + ") c" 
								+ " where a.recipe_id = b.recipe_id and b.recipe_id = c.recipe_id"
								+ " order by a.main desc, b.sub desc, c.source desc";
		try {
			Connection conn = JDBCUtil.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(recipeListSQL);
			while(rs.next()) {
				RecipeVO recipeVO = new RecipeVO();
				recipeVO.setRecipe_id(rs.getInt("recipe_id"));
				recipeList.add(recipeVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return recipeList;
	}
	// 성빈 : recipeList로부터 recipe의 기본 정보를 추출하는 메소드
	// 파라메터로 전달받은 recipeList객체에 기본 정보를 저장해 리턴한다. 
	public ArrayList<RecipeVO> getRecipesBySearch(ArrayList<RecipeVO> recipeList) {
		
		String sql = "select * from recipe_info a, nation b, recipe_type c where a.nation_code = b.nation_code and a.ty_code = c.ty_code and recipe_id = ?";
		try {
			Connection conn = JDBCUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = null;
			for (int i = 0; i < recipeList.size(); i++) {
				pstmt.setInt(1, recipeList.get(i).getRecipe_id());
				rs = pstmt.executeQuery();
				rs.next();
				recipeList.get(i).setRecipe_title(rs.getString("recipe_title"));
				recipeList.get(i).setRecipe_desc(rs.getString("recipe_desc"));
				recipeList.get(i).setImg_url(rs.getString("img_url"));
				recipeList.get(i).setCooking_time(rs.getString("cooking_time"));
				recipeList.get(i).setUser_id(rs.getString("user_id"));
				recipeList.get(i).setNation_code(rs.getInt("nation_code"));
				recipeList.get(i).setNation_name(rs.getString("nation_name"));
				recipeList.get(i).setTy_code(rs.getInt("ty_code"));
				recipeList.get(i).setTy_name(rs.getString("ty_name"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return recipeList;
	}
	
	// 성빈 : 내 재료 목록으로부터 레시피 목록을 검색하여 List형태로 리턴하는 메소드
	public ArrayList<RecipeVO> searchRecipeListByMybox(ArrayList<MemberBoxVO> myIrdntList) {
		
		String likeSubQuery = "select * from recipe_irdnt where";
		ArrayList<RecipeVO> recipeList = new ArrayList<RecipeVO>();
		for (int i = 0; i < myIrdntList.size(); i++) {
			if (i == 0) {
				likeSubQuery += " irdnt_name Like '%" + myIrdntList.get(i).getMy_irdnt() + "%'";
			} else {
				likeSubQuery += " OR" + " irdnt_name Like '%" + myIrdntList.get(i).getMy_irdnt() + "%'";
			}
		}
		
		try {
			Connection conn = JDBCUtil.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(likeSubQuery);
			
			while(rs.next()) {
				RecipeVO recipeVO = new RecipeVO();
				recipeVO.setRecipe_id(rs.getInt("recipe_id"));
				recipeList.add(recipeVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return recipeList;		
	}
	// 성빈 : 검색한 레시피 목록으로부터 레시피에 대한 기 본 정보를 검색하여 List형태로 리턴하는 메소드
	public ArrayList<RecipeVO> getRecipeListByMybox(ArrayList<RecipeVO> recipeList) {
		
		String sql = "select * from recipe_info a, nation b, recipe_type c where a.nation_code = b.nation_code and a.ty_code = c.ty_code and recipe_id = ?";
		try {
			Connection conn = JDBCUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = null;
			for (int i = 0; i < recipeList.size(); i++) {
				pstmt.setInt(1, recipeList.get(i).getRecipe_id());
				rs = pstmt.executeQuery();
				rs.next();
				recipeList.get(i).setRecipe_title(rs.getString("recipe_title"));
				recipeList.get(i).setRecipe_desc(rs.getString("recipe_desc"));
				recipeList.get(i).setImg_url(rs.getString("img_url"));
				recipeList.get(i).setCooking_time(rs.getString("cooking_time"));
				recipeList.get(i).setUser_id(rs.getString("user_id"));
				recipeList.get(i).setNation_code(rs.getInt("nation_code"));
				recipeList.get(i).setNation_name(rs.getString("nation_name"));
				recipeList.get(i).setTy_code(rs.getInt("ty_code"));
				recipeList.get(i).setTy_name(rs.getString("ty_name"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return recipeList;
		
	}
	// 성빈 : 상단  Header 검색창 기능 구현을 위한 메소드
	// 검색 기능이 작동하는 순서 1) 빈칸에 의한 단어 구분 2) 영문, 한문, 숫자, 특수문자에 의한  	
	
	
}
