package com.spring.madi;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
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
	public ModelAndView myPage(HttpServletRequest request)
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
		List<MemberFollowVO> recommendList= memberDAOService.getRecommendFollower(user_id);
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
	public ModelAndView deleteFollowing(MemberFollowVO memberFollow, HttpServletRequest request) {
		String user_id= memberFollow.getUser_id();
		String following_user_id = request.getParameter("following_user_id");
		System.out.println("u=" + user_id);
		System.out.println("f=" + following_user_id);
		ModelAndView result= new ModelAndView();	
		memberDAOService.deleteFollowing(user_id, following_user_id);
		System.out.println("팔로잉 삭제 성공");
		
		List<MemberFollowVO> followingList= memberDAOService.getFollowing(user_id);
		result.addObject("followingList", followingList);
		result.setViewName("following_modal");
		return result;
	}
	//(진산)팔로워 한 명 삭제
	@RequestMapping("/deleteFollower.do")
	public ModelAndView deleteFollower(MemberFollowVO memberFollow, HttpServletRequest request) {
		String user_id= memberFollow.getUser_id();
		String following_user_id = request.getParameter("following_user_id");
		System.out.println("u=" + user_id);
		System.out.println("f=" + following_user_id);
		ModelAndView result= new ModelAndView();	
		memberDAOService.deleteFollower(user_id, following_user_id);
		System.out.println("팔로워 삭제 성공");
		List<MemberFollowVO> followerList= memberDAOService.getFollower(following_user_id);
		System.out.println("followerList size is "+followerList.size());
		result.addObject("followerList", followerList);
		result.setViewName("follower_modal");
		return result;
	}	
	//(진산) 팔로잉 한 명 추가
	@RequestMapping("/insertFollowing.do")
	public ModelAndView insertFollowing(MemberFollowVO memberFollow, HttpServletRequest request) {
		String user_id= memberFollow.getUser_id();
		String following_user_id = request.getParameter("following_user_id");
		String user_img= memberFollow.getUser_img();
		String following_user_img= memberFollow.getFollowing_user_img();
		System.out.println("u=" + user_id);
		System.out.println("f=" + following_user_id);
		System.out.println("u-i=" + user_img);
		System.out.println("f-i=" + following_user_img);
		ModelAndView result= new ModelAndView();
		memberDAOService.insertFollowing(user_id, following_user_id, user_img, following_user_img);
		
		MemberVO member= memberDAOService.getMember(user_id);
		System.out.println("추가 성공");
		List<MemberFollowVO> recommendList= memberDAOService.getRecommendFollower(user_id);
		System.out.println("recommendList.size()=" + recommendList.size());
		result.addObject("recommendList", recommendList);
		result.addObject("member", member);
		result.setViewName("insertFollowing_modal");
		return result;
	}
	//(진산) 좋아요 클릭시 한 개 추가
	@RequestMapping("/updateBoardLike.do")
	public ModelAndView updateBoardLike(BoardVO board) {
		String user_id= board.getUser_id();
		int board_num= board.getBoard_num();
		//String[] following_user_id= null;
		ModelAndView result= new ModelAndView();
		System.out.println("u=" + user_id);
		System.out.println("n=" + board_num);
		boardDAOService.updateBoardLike(board_num, user_id);
		System.out.println("u=" + user_id);
		System.out.println("n=" + board_num);
		System.out.println("좋아요 성공");
		List<BoardVO> boardList= boardDAOService.getBoards(user_id);
		//List<BoardVO> followingBoardList= boardDAOService.getFollowingBoards(following_user_id);
		//result.addObject("followingBoardList ", followingBoardList);
		result.addObject("boardList", boardList);
		result.setViewName("updateBoardLike_modal");
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
