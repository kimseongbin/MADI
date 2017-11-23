package com.spring.madi;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


/**
 * Handles requests for the application home page.
 */

@Controller
public class FrontController {
	
	@Autowired
	private RecipeDAOService recipeDAOService;
	
	@Autowired
	private BoardDAOService boardDAOService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(FrontController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "index";
	}
	
	// 게시물 보기 controller
	@RequestMapping("/postList.do")
	public ModelAndView postList(RecipeVO recipeVO)
	{
		ModelAndView result = new ModelAndView();
		List<RecipeVO> postList = recipeDAOService.postList();
		
		result.addObject("postList", postList);
		result.setViewName("postList");
		
		return result;
	}
		
	@RequestMapping("/mypage.do")
	public String myPage()
	{
		return "mypage";
	}
	
	@RequestMapping("/recipe.do")
	public String recipe()
	{
		return "recipe";
	}
	
	@RequestMapping("/recipeDetail.do")
	public String recipeDetail(RecipeVO recipeVO, Model model)
	{	
		
		RecipeVO vo = recipeDAOService.getRecipeById(recipeVO);
		model.addAttribute("recipeVO", vo);
		
		return "recipeDetail";
	}
	
	
	// 레시피 등록 controller
	@RequestMapping("/recipeInsert.do")
	public ModelAndView recipeInsert(RecipeVO recipeVO, MultipartHttpServletRequest request) throws Exception
	{

		ModelAndView mav = new ModelAndView();

		// 파일 업로드 안돼요 오빠가 하셔야해요
/*		String name = request.getParameter("img_url");
		MultipartFile mf = request.getFile("file");
		
		//String uploadPath = request.getSession().getServletContext().getRealPath("/upload");
		String uploadPath = "C://upload//";//직접 업로드할 위치 지정
		String originalFileExtension = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
		String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
				
		//지정한 주소에 파일 저장
		if(mf.getSize() != 0) {
			//mf.transferTo(new File(uploadPath+"/"+mf.getOriginalFilename()));
			mf.transferTo(new File(uploadPath+storedFileName));
		}		
		
		recipeDAOService.insertRecipe(recipeVO);*/

		
		BoardVO boardVO = new BoardVO();
		

//		boardVO.setUser_id(recipeVO.getUser_id());
		boardVO.setBoard_title(recipeVO.getRecipe_title());
		boardVO.setBoard_summry(recipeVO.getRecipe_desc());
		boardVO.setBoard_img(recipeVO.getImg_url());
		boardVO.setBoard_recipe_id(recipeVO.getRecipe_id());
		
		boardDAOService.insertBoard(boardVO);		
		
//		mav.addObject("fileName", mf.getOriginalFilename());
		mav.setViewName("redirect:/postList.do");
		
		return mav;
				
	}

	
	
	

}
