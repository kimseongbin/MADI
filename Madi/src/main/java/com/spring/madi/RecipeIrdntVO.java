package com.spring.madi;

import org.springframework.stereotype.Component;

@Component
public class RecipeIrdntVO {

	private int recipe_id;
	private String irdnt_name;
	private String irdnt_cpcty;
	private int irdnt_ty_code;
	private String irdnt_ty_name;
	
	public String getIrdnt_ty_name() {
		return irdnt_ty_name;
	}
	public void setIrdnt_ty_name(String irdnt_ty_name) {
		this.irdnt_ty_name = irdnt_ty_name;
	}
	
	public int getRecipe_id() {
		return recipe_id;
	}
	public void setRecipe_id(int recipe_id) {
		this.recipe_id = recipe_id;
	}
	public String getIrdnt_name() {
		return irdnt_name;
	}
	public void setIrdnt_name(String irdnt_name) {
		this.irdnt_name = irdnt_name;
	}
	public String getIrdnt_cpcty() {
		return irdnt_cpcty;
	}
	public void setIrdnt_cpcty(String irdnt_cpcty) {
		this.irdnt_cpcty = irdnt_cpcty;
	}
	public int getIrdnt_ty_code() {
		return irdnt_ty_code;
	}
	public void setIrdnt_ty_code(int irdnt_ty_code) {
		this.irdnt_ty_code = irdnt_ty_code;
	}

}
