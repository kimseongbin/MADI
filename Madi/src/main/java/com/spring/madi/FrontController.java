package com.spring.madi;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.runner.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
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
	
	
	@Autowired
	private MemberDAOService memberDAOService;
			
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
		List<BoardReplyVO> replyList = boardDAOService.getBoard();
		rs.addObject("replyList", replyList);
		//넘겨줄 페이지 이름 기술
		rs.setViewName("recipeDetail1");
		return rs;
		
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

	@RequestMapping("/test.do")
	public String test()
	{
		
		return "test";
	}
	
	@RequestMapping("/checkMember.do")
	public ModelAndView checkMember(MemberVO memberVO)
	{	
		
		ModelAndView mav = new ModelAndView();
		
		//로그인 정보가 들어오면 이메일 확인 후 x에 저장
		MemberVO x = memberDAOService.checkMember(memberVO);
		
		//db에서 확인한 id 값이 null이면 간단회원가입 페이지로, null이 아니면 로그인 성공 (recipe 페이지로)
		
		if(x == null){
			mav.addObject("index", x);
			mav.setViewName("index");
			return mav;
			
		}else{
			mav.addObject("recipe", x);
			mav.setViewName("recipe");
			return mav;
		}
				
	}
	//카카오톡 로그아웃 (리다이렉트 -> 메인페이지)
	@RequestMapping("/logout.do")
	public String logout(HttpSession session){
		session.invalidate();
		
		return "redirect:/test.do";
	}
	
	
	
	
	@RequestMapping("/test1.do")
	public String test1()
	{
		return "test1";
	}
}
