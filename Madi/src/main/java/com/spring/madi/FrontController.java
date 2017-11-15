package com.spring.madi;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */

@Controller("/")
public class FrontController {

	private static final Logger logger = LoggerFactory.getLogger(FrontController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "index";
	}
	
	@RequestMapping("/postList.do")
	public String postList()
	{
		return "postList";
	}
	
	@RequestMapping("/myPage.do")
	public String myPage()
	{
		return "myPage";
	}
	
	@RequestMapping("/recipe.do")
	public String recipe()
	{
		return "recipe";
	}
	
	@RequestMapping("/recipeDetail.do")
	public String recipeDetail()
	{
		return "recipeDetail";
	}
	

}
