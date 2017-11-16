package com.spring.madi;

import org.springframework.stereotype.Component;

@Component
public class RecipeVO {
	//reipce_info
	private int recipe_id;
	private String recipe_title;
	private String recipe_desc;
	private int nation_code;
	private int ty_code;
	private String cooking_time;
	private String img_url;
	private String detail_url;
	private String user_id;
	//recipe_irdnt
	private String[] irdnt_name;
	private String[] irdnt_cpcty;
	private int irdnt_ty_code;
	//recipe_process
	private int[] cooking_no;
	private String[] cooking_desc;
	private String[] step_img_url;
	private String[] step_tip;
	//nation
	private String nation_name;
	//recipe_type
	private String ty_name;
	
	//reipce_info
	public int getRecipe_id() {
		return recipe_id;
	}

	public void setRecipe_id(int recipe_id) {
		this.recipe_id = recipe_id;
	}

	public String getRecipe_title() {
		return recipe_title;
	}

	public void setRecipe_title(String recipe_title) {
		this.recipe_title = recipe_title;
	}

	public String getRecipe_desc() {
		return recipe_desc;
	}

	public void setRecipe_desc(String recipe_desc) {
		this.recipe_desc = recipe_desc;
	}

	public int getNation_code() {
		return nation_code;
	}

	public void setNation_code(int nation_code) {
		this.nation_code = nation_code;
	}

	public int getTy_code() {
		return ty_code;
	}

	public void setTy_code(int ty_code) {
		this.ty_code = ty_code;
	}

	public String getCooking_time() {
		return cooking_time;
	}

	public void setCooking_time(String cooking_time) {
		this.cooking_time = cooking_time;
	}

	public String getImg_url() {
		return img_url;
	}

	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}

	public String getDetail_url() {
		return detail_url;
	}

	public void setDetail_url(String detail_url) {
		this.detail_url = detail_url;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	//recipe_irdnt
	public String[] getIrdnt_name() {
		return irdnt_name;
	}

	public void setIrdnt_name(String[] irdnt_name) {
		this.irdnt_name = irdnt_name;
	}

	public String[] getIrdnt_cpcty() {
		return irdnt_cpcty;
	}

	public void setIrdnt_cpcty(String[] irdnt_cpcty) {
		this.irdnt_cpcty = irdnt_cpcty;
	}

	public int getIrdnt_ty_code() {
		return irdnt_ty_code;
	}

	public void setIrdnt_ty_code(int irdnt_ty_code) {
		this.irdnt_ty_code = irdnt_ty_code;
	}
	//recipe_process
	public int[] getCooking_no() {
		return cooking_no;
	}

	public void setCooking_no(int[] cooking_no) {
		this.cooking_no = cooking_no;
	}

	public String[] getCooking_desc() {
		return cooking_desc;
	}

	public void setCooking_desc(String[] cooking_desc) {
		this.cooking_desc = cooking_desc;
	}

	public String[] getStep_img_url() {
		return step_img_url;
	}

	public void setStep_img_url(String[] step_img_url) {
		this.step_img_url = step_img_url;
	}

	public String[] getStep_tip() {
		return step_tip;
	}

	public void setStep_tip(String[] step_tip) {
		this.step_tip = step_tip;
	}
	//nation
	public String getNation_name() {
		return nation_name;
	}

	public void setNation_name(String nation_name) {
		this.nation_name = nation_name;
	}
	//recipe_type
	public String getTy_name() {
		return ty_name;
	}

	public void setTy_name(String ty_name) {
		this.ty_name = ty_name;
	}
	
	
	

}
