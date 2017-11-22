package com.spring.madi;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.madi.BoardVO;
import com.spring.madi.MemberFollowVO;
import com.spring.madi.MemberVO;

/**
 * Handles requests for the application home page.
 */

@Controller
public class FrontController {
	
	@Autowired
	private RecipeDAOService recipeDAOService;
	
	@Autowired
	private MemberDAOService memberDAOService;
	
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
	
	//(진산)mypage.do 작업
	@RequestMapping("/mypage.do")
	public ModelAndView myPage(HttpSession session)
	{	
		//String user_id = (String)session.getAttribute("user_id");
		String user_id = "madi";
		//session.setAttribute("madi", user_id);
		//String[] following_user_id= null;
		ModelAndView result= new ModelAndView();
		//자기 자신에 대한 member정보
		MemberVO member= memberDAOService.getMember(user_id);
		result.addObject("member", member);
		//팔로워 리스트
		List<MemberFollowVO> followerList= memberDAOService.getFollower(user_id);
		result.addObject("followerList", followerList);
		//팔로잉 리스트
		List<MemberFollowVO> followingList= memberDAOService.getFollowing(user_id);
		result.addObject("followingList", followingList);
		//팔로워 추천 리스트
		List<MemberFollowVO> recommendList= memberDAOService.getRecommendFollower();
		result.addObject("recommendList", recommendList);
		
		//가운데 게시글 리스트
		List<BoardVO> myBoardList= boardDAOService.getBoards(user_id);
		//List<BoardVO> followingBoardList= boardDAOService.getFollowingBoards(following_user_id);
		result.addObject("myBoardList", myBoardList);
		//result.addObject("followingBoardList", followingBoardList);
		result.setViewName("mypage");
		
		return result;
	}
	//(진산)팔로잉 한 명 삭제
	@RequestMapping("/deleteFollowing.do")
	public ModelAndView deleteFollowing(MemberFollowVO memberFollow) {
		String following_user_id= memberFollow.getFollowing_user_id();
		String user_id= memberFollow.getUser_id();
		ModelAndView result= new ModelAndView();	
		memberDAOService.deleteFollowing(following_user_id, user_id);
		System.out.println("delete complete");
		List<MemberFollowVO> followingList= memberDAOService.getFollowing(user_id);
		result.addObject("followingList", followingList);
		result.setViewName("mypage");
		return result;
	}
	//(진산)팔로워 한 명 삭제
	@RequestMapping("/deleteFollower.do")
	public ModelAndView deleteFollower(MemberFollowVO memberFollow) {
		String user_id= memberFollow.getUser_id();
		String following_user_id= memberFollow.getFollowing_user_id();
		ModelAndView result= new ModelAndView();	
		memberDAOService.deleteFollower(user_id, following_user_id);
		System.out.println("delete complete");
		List<MemberFollowVO> followerList= memberDAOService.getFollower(user_id);
		result.addObject("followerList", followerList);
		result.setViewName("mypage");
		return result;
	}	
	//(진산) 팔로잉 한 명 추가
	@RequestMapping("/insertFollowing.do")
	public ModelAndView insertFollowing(MemberFollowVO memberFollow) {
		String user_id= memberFollow.getUser_id();
		ModelAndView result= new ModelAndView();
		memberDAOService.insertFollowing(memberFollow);
		System.out.println("insert complete");
		List<MemberFollowVO> followingList= memberDAOService.getFollowing(user_id);
		result.addObject("followingList", followingList);
		result.setViewName("home");
		return result;
	}
	//(진산) 좋아요 클릭시 한 개 추가
	@RequestMapping("/updateBoardLike.do")
	public ModelAndView updateBoardLike(BoardVO board) {
		String user_id= null;
		//String[] following_user_id= null;
		ModelAndView result= new ModelAndView();
		boardDAOService.updateBoardLike(user_id);
		System.out.println("update complete");
		//List<BoardVO> followingBoardList= boardDAOService.getFollowingBoards(following_user_id);
		//result.addObject("followingBoardList ", followingBoardList);
		result.setViewName("home");
		return result;
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
	

}
