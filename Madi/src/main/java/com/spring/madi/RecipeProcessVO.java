package com.spring.madi;

import org.springframework.stereotype.Component;

@Component
public class RecipeProcessVO {

	private int recipe_id;
	private int cooking_no;
	private String cooking_desc;
	private String step_img_url;
	private String step_tip;
	
	public int getRecipe_id() {
		return recipe_id;
	}
	public void setRecipe_id(int recipe_id) {
		this.recipe_id = recipe_id;
	}
	public int getCooking_no() {
		return cooking_no;
	}
	public void setCooking_no(int cooking_no) {
		this.cooking_no = cooking_no;
	}
	public String getCooking_desc() {
		return cooking_desc;
	}
	public void setCooking_desc(String cooking_desc) {
		this.cooking_desc = cooking_desc;
	}
	public String getStep_img_url() {
		return step_img_url;
	}
	public void setStep_img_url(String step_img_url) {
		this.step_img_url = step_img_url;
	}
	public String getStep_tip() {
		return step_tip;
	}
	public void setStep_tip(String step_tip) {
		this.step_tip = step_tip;
	}

}
