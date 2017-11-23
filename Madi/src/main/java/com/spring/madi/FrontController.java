package com.spring.madi;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@RequestMapping("/postList.do")
	public String postList()
	{
		return "postList";
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
	public String recipeDetail(RecipeVO recipeVO, BoardVO boardVO, BoardReplyVO boardReplyVO, Model model)
	{	
		//인욱
		System.out.println("check1");
		RecipeVO vo = recipeDAOService.getRecipeById(recipeVO);
		//vo1 에 recipeID 에 따른 board내용을 저장
		List<BoardReplyVO> vo1= boardDAOService.contentBoard();		
		//레시피정보, 타이틀, 설명, 만드는법 등
		model.addAttribute("recipeVO", vo);
		//레시피 아이디에 따른 댓글 리스트
		model.addAttribute("boardReplyVO", vo1);
		
		return "recipeDetail";
	}
	@RequestMapping("/writeBoard.do")
	public ModelAndView writeBoard(BoardReplyVO boardReplyVO, HttpServletRequest request){
		//System.out.println(request.getParameter("rep_content"));
		//System.out.println(request.getParameter("user_id"));
		//System.out.println(request.getParameter("board_num"));
		//System.out.println(boardReplyVO.getBoard_num());
		//System.out.println(boardReplyVO.getRep_content());
		//System.out.println(boardReplyVO.getUser_id());
		
		//인욱
		//받은 값을 DB에 저장해줌
		boardDAOService.writeBoard(boardReplyVO);
		System.out.println("check3");
		//모델엔뷰 이용해서 DB저장값을 뿌려줌
		ModelAndView rs = new ModelAndView();
		List<BoardReplyVO> replyList = boardDAOService.getBoards();
		rs.addObject("replyList", replyList);
		//넘겨줄 페이지 이름 기술
		rs.setViewName("recipeDetail1");
		return rs;
		
	}
	
}
