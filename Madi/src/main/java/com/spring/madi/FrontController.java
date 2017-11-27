package com.spring.madi;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	private MessageDAOService messageDAOService;
	@Autowired
	private NotificationDAOService notificationDAOService;
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
	public ModelAndView postList(RecipeVO recipeVO) {
		ModelAndView result = new ModelAndView();
		List<RecipeVO> postList = recipeDAOService.postList();

		result.addObject("postList", postList);
		result.setViewName("postList");

		return result;
	}

	// 성빈 : 로그인 모델
	// 로그인 성공 시 session에 기본 정보를 저장하고 recipe.do 페이지로 이동한다
	// 로그인 실패 시 실패한 이유를 알려주고 index화면에 머무른다
	@RequestMapping("/login.do")
	public String loginMadi(MemberVO memberVO, HttpServletResponse response, HttpSession session) {
		// 입력된 아이디로부터 DB에 있는 password 조회
		MemberVO password = memberDAOService.getPasswordByUserId(memberVO);
		// DB의 password가 존재하는지는지 검사
		if (password.getUser_pw() == null) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html");
			try {
				PrintWriter writer = response.getWriter();
				writer.write("<script>alert('아이디가 존재하지 않습니다.\n아이디를 다시 확인해주세요.')</script>");
			} catch (Exception e) {
				System.out.println("system  :  로그인 화면, 로그인 에러 발생(아이디 체크). 로그인 실패로 인한 실패 알림 메시지 전송 실패");
				e.printStackTrace();
				return "redirect:/";
			}
			return "redirect:/";
		} else {
			if (!(password.getUser_pw().equals(memberVO.getUser_pw()))) {
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html");
				try {
					PrintWriter writer = response.getWriter();
					writer.write("<script>alert('비밀번호가 일치하지 않습니다.\n비밀번호를 다시 확인해주세요.')</script>");
				} catch (Exception e) {
					System.out.println("system  :  로그인 화면, 로그인 에러 발생(비밀번호 체크). 로그인 실패로 인한 실패 알림 메시지 전송 실패");
					e.printStackTrace();
					return "redirect:/";
				}
				return "redirect:/";
			} else {
				MemberVO userInfo = memberDAOService.getUserInfoById(memberVO.getUser_id());
				session.setAttribute("user_id", userInfo.getUser_id());
				session.setAttribute("user_email", userInfo.getUser_email());
				session.setAttribute("user_name", userInfo.getUser_name());
				session.setAttribute("user_img", userInfo.getUser_img());
				return "redirect:/recipe.do";
			}
		}
	}

	// 성빈 : 회원가입 모델
	// DB에 Insert한 뒤 초기화면으로 돌아간다.
	@RequestMapping("/join.do")
	public String joinMadi(MemberVO memberVO, HttpServletResponse response) {
		try {
			memberVO.setUser_img("");
			memberDAOService.setMember(memberVO);
		} catch (Exception e) {
			System.out.println("system  :  회원가입 화면, 회원가입 에러 발생. 회원정보 INSERT 실패");
			e.printStackTrace();
			try {
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html");
				PrintWriter writer = response.getWriter();
				writer.write("<script>현재 서버가 정상적으로 작동하지 않습니다. 잠시 후에 다시 시도해주세요.</script>");
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			return null;
		}
		return "redirect:/";
	}

	// (진산)mypage.do 작업
	@RequestMapping("/mypage.do")
	public ModelAndView myPage(HttpServletRequest request)
	{	
		//String user_id = (String)session.getAttribute("user_id");
		String user_id = "user2";
		//session.setAttribute("madi", user_id);
		ModelAndView result= new ModelAndView();
		//내 알림 메시지 읽어오기
		ArrayList<NotificationVO> notificationList = notificationDAOService.getMyNoticeById(user_id);
		if(notificationList == null) {
			notificationList = new ArrayList<NotificationVO>();
		}
		result.addObject("notificationList", notificationList);
		// 내 메시지 읽어오기
		ArrayList<MessageVO> messageList = messageDAOService.getMyMessageById(user_id);
		if(messageList == null) {
			messageList = new ArrayList<MessageVO>();
		}
		result.addObject("messageList", messageList);
		//자기 자신에 대한 member정보
		MemberVO memberVO= memberDAOService.getMember(user_id);
		result.addObject("memberVO", memberVO);
		
		// 팔로워 리스트
		List<MemberFollowVO> followerList = memberDAOService.getFollower(user_id);
		result.addObject("followerList", followerList);
		// 팔로잉 리스트
		List<MemberFollowVO> followingList = memberDAOService.getFollowing(user_id);
		result.addObject("followingList", followingList);
		//팔로워 추천 리스트
		List<MemberFollowVO> recommendList= memberDAOService.getRecommendFollower(user_id);
		System.out.println("recommendList.size()=" + recommendList.size());
		result.addObject("recommendList", recommendList);
		
		//모든 게시글 위해서 불러옴 
		List<BoardVO> allBoardList = boardDAOService.getAllBoards(user_id);
		
		// 가운데 게시글 리스트
		List<BoardVO> myBoardList = boardDAOService.getBoards(user_id);
		result.addObject("myBoardList", myBoardList);
		result.addObject("allBoardList", allBoardList);
		result.setViewName("mypage");
		return result;
	}

	// (진산)팔로잉 한 명 삭제
	@RequestMapping("/deleteFollowing.do")
	public ModelAndView deleteFollowing(MemberFollowVO memberFollow, HttpServletRequest request, NotificationVO notificaitonVO) {
		String user_id= memberFollow.getUser_id();
		String following_user_id = request.getParameter("following_user_id");
//		System.out.println("u=" + user_id);
//		System.out.println("f=" + following_user_id);
		ModelAndView result= new ModelAndView();	
		memberDAOService.deleteFollowing(user_id, following_user_id);
		System.out.println("팔로잉 삭제 성공");
		
		
		System.out.println(notificaitonVO.getNotice_to());
		notificationDAOService.sendNoticeById(notificaitonVO);
		
		List<MemberFollowVO> followingList= memberDAOService.getFollowing(user_id);
		result.addObject("followingList", followingList);
		result.setViewName("following_modal");
		return result;
	}

	// (진산)팔로워 한 명 삭제
	@RequestMapping("/deleteFollower.do")
	public ModelAndView deleteFollower(MemberFollowVO memberFollow, HttpServletRequest request, NotificationVO notificaitonVO) {
		String user_id= memberFollow.getUser_id();
		String following_user_id = request.getParameter("following_user_id");
//		System.out.println("u=" + user_id);
//		System.out.println("f=" + following_user_id);
		ModelAndView result= new ModelAndView();	
		memberDAOService.deleteFollower(user_id, following_user_id);
		
		System.out.println("팔로워 삭제 성공");
		notificationDAOService.sendNoticeById(notificaitonVO);
		
		List<MemberFollowVO> followerList= memberDAOService.getFollower(following_user_id);
		System.out.println("followerList size is "+followerList.size());
		result.addObject("followerList", followerList);
		result.setViewName("follower_modal");
		return result;
	}

	// (진산) 팔로잉 한 명 추가
	@RequestMapping("/insertFollowing.do")
	public ModelAndView insertFollowing(MemberFollowVO memberFollow, HttpServletRequest request, NotificationVO notificaitonVO) {
		String user_id= memberFollow.getUser_id();
		String following_user_id = request.getParameter("following_user_id");
		String user_img= memberFollow.getUser_img();
		String following_user_img= memberFollow.getFollowing_user_img();
//		System.out.println("u=" + user_id);
//		System.out.println("f=" + following_user_id);
//		System.out.println("u-i=" + user_img);
//		System.out.println("f-i=" + following_user_img);
		ModelAndView result= new ModelAndView();
		memberDAOService.insertFollowing(user_id, following_user_id, user_img, following_user_img);
		
		MemberVO member= memberDAOService.getMember(user_id);
		System.out.println("추가 성공");

		notificationDAOService.sendNoticeById(notificaitonVO);
		
		List<MemberFollowVO> recommendList= memberDAOService.getRecommendFollower(user_id);
		System.out.println("recommendList.size()=" + recommendList.size());
		result.addObject("recommendList", recommendList);
		result.addObject("member", member);
		result.setViewName("insertFollowing_modal");
		return result;
	}

	// (진산) 좋아요 클릭시 한 개 추가...@ResponseBody를 써서 json오브젝트만 리턴하게 된다
	@RequestMapping("/updateBoardLike.do")
	public ModelAndView updateBoardLike(BoardVO boardVO, NotificationVO notificaitonVO) {
		//String[] following_user_id= null;
		ModelAndView result= new ModelAndView();
		String user_id= boardVO.getUser_id();
		int board_num= boardVO.getBoard_num();
		System.out.println("나오자나" + boardVO.getUser_id());
		UserLikeBoVO res= boardDAOService.getUserLike(boardVO);
		System.out.println(user_id);
		System.out.println(board_num);
		if (res == null) {
			boardDAOService.insertUserLike(boardVO);
			boardDAOService.likePlusOne(boardVO);
			System.out.println("좋아요 성공");
			System.out.println(notificaitonVO.getNotice_to());
			notificationDAOService.sendNoticeById(notificaitonVO);
			result.addObject("result", 1);
		} else {
			boardDAOService.deleteUserLike(boardVO);
			boardDAOService.likeMinusOne(boardVO);
			System.out.println("좋아요가 중복입니다. 삭제합니다");
			System.out.println(notificaitonVO.getNotice_to());
			notificationDAOService.sendNoticeById(notificaitonVO);
			result.addObject("result", 0);
		}		

		result.setViewName("boardLike");
		return result;

	}
	

	// 성빈 : 레시피 조회하는 페이지(recipe.jsp)의 모델
	@RequestMapping("/recipe.do")
	public String recipe(HttpSession session, Model model) {
		// 로그인 아이디 전달 받기
		String user_id = (String) session.getAttribute("user_id");
		// 로그인 체크, 세션에 아이디를 입력하지 못 했을 경우 로그인 실패로 판단하고 index화면으로 넘긴다
		if (user_id == null) {
			System.out.println("로그인에 실패하셨습니다.");
			session.invalidate();
			return "redirect:/";
		}
		// Header 기본 정보(알림/메시지/유저이미지) 정보 받아오기
		// 내 정보 받아오기
		MemberVO MemberVO = memberDAOService.getUserInfoById(user_id);
		// message 리스트 받아오기
		ArrayList<MessageVO> messageList = messageDAOService.getMyMessageById(user_id);
		// 알림 리스트 받아오기
		ArrayList<NotificationVO> notificationList = notificationDAOService.getMyNoticeById(user_id);
		// 모델에 객체 추가
		model.addAttribute("messageList", messageList);
		model.addAttribute("notificationList", notificationList);
		model.addAttribute("MemberVO", MemberVO);

		return "recipe";
	}
	@RequestMapping("/recipeDetail.do")
	public String recipeDetail(RecipeVO recipeVO, BoardVO boardVO, BoardReplyVO boardReplyVO, Model model) {
		// 인욱
		System.out.println("check1");
		RecipeVO vo = recipeDAOService.getRecipeById(recipeVO);
		// vo1 에 recipeID 에 따른 board내용을 저장
		List<BoardReplyVO> vo1 = boardDAOService.contentBoard();
		// 레시피정보, 타이틀, 설명, 만드는법 등
		model.addAttribute("recipeVO", vo);
		// 레시피 아이디에 따른 댓글 리스트
		model.addAttribute("boardReplyVO", vo1);

		return "recipeDetail";
	}

	@RequestMapping("/writeBoard.do")
	public ModelAndView writeBoard(BoardReplyVO boardReplyVO, HttpServletRequest request) {
		// System.out.println(request.getParameter("rep_content"));
		// System.out.println(request.getParameter("user_id"));
		// System.out.println(request.getParameter("board_num"));
		// System.out.println(boardReplyVO.getBoard_num());
		// System.out.println(boardReplyVO.getRep_content());
		// System.out.println(boardReplyVO.getUser_id());

		// 인욱
		// 받은 값을 DB에 저장해줌
		boardDAOService.writeBoard(boardReplyVO);
		System.out.println("check3");
		// 모델엔뷰 이용해서 DB저장값을 뿌려줌
		ModelAndView rs = new ModelAndView();
		List<BoardReplyVO> replyList = boardDAOService.getBoard();
		rs.addObject("replyList", replyList);
		// 넘겨줄 페이지 이름 기술
		rs.setViewName("recipeDetail1");
		return rs;

	}

	// 레시피 등록 controller
	@RequestMapping("/recipeInsert.do")
	public ModelAndView recipeInsert(RecipeVO recipeVO, MultipartHttpServletRequest request) throws Exception {

		ModelAndView mav = new ModelAndView();

		// 파일 업로드 안돼요 오빠가 하셔야해요
		/*
		 * String name = request.getParameter("img_url"); MultipartFile mf =
		 * request.getFile("file");
		 * 
		 * //String uploadPath =
		 * request.getSession().getServletContext().getRealPath("/upload");
		 * String uploadPath = "C://upload//";//직접 업로드할 위치 지정 String
		 * originalFileExtension =
		 * mf.getOriginalFilename().substring(mf.getOriginalFilename().
		 * lastIndexOf(".")); String storedFileName =
		 * UUID.randomUUID().toString().replaceAll("-", "") +
		 * originalFileExtension;
		 * 
		 * //지정한 주소에 파일 저장 if(mf.getSize() != 0) { //mf.transferTo(new
		 * File(uploadPath+"/"+mf.getOriginalFilename())); mf.transferTo(new
		 * File(uploadPath+storedFileName)); }
		 * 
		 * recipeDAOService.insertRecipe(recipeVO);
		 */

		BoardVO boardVO = new BoardVO();

		// boardVO.setUser_id(recipeVO.getUser_id());
		boardVO.setBoard_title(recipeVO.getRecipe_title());
		boardVO.setBoard_summry(recipeVO.getRecipe_desc());
		boardVO.setBoard_img(recipeVO.getImg_url());
		boardVO.setBoard_recipe_id(recipeVO.getRecipe_id());

		boardDAOService.insertBoard(boardVO);

		// mav.addObject("fileName", mf.getOriginalFilename());
		mav.setViewName("redirect:/postList.do");

		return mav;

	}

	// 성빈 : 카테고리 입력 값에 따른 레시피 목록 출력 메소드
	// 비동기 통신(ajax)에 의해 호출되는 메소드
	// return으로 recipeListByCateogry를 지정해 recipeListByCategory를 뷰로 보여주지 않고
	// 해당 뷰의 결과화면 recipe.jsp에 출력한다
	@RequestMapping(value = "/recipe.do", params = "sb=ty_code")
	public String getRecipesByCategory(String[] ty_code, Model model) {
		ArrayList<RecipeVO> recipeList = null;
		if (ty_code == null) {
			model.addAttribute("recipeList", recipeList);
			return "recipeListByCategory";
		} else {
			recipeList = recipeDAOService.getRecipesByTy_code(ty_code);
			model.addAttribute("recipeList", recipeList);
			return "recipeListByCategory";
		}
	}

	// 성빈 : 재료 입력 값에 따른 레시피 목록 출력 메소드
	// 비동기 통신에 의해 호출되는 메소드
	// 결과를 recipeListByIngredients에 보여주고 비동기 통신에 의해
	// 해당 결과를 recipe.jsp에 출력한다.
	@RequestMapping(value = "/recipe.do", params = "sb=irdnt")
	public String getRecipesByIngredients(String main, String sub, String source, Model model) {
		SearchEngine se = new SearchEngine();
		ArrayList<RecipeVO> recipeList = se.searchRecipesByIngredients(main, sub, source);
		if (recipeList.size() == 0) {
			recipeList = null;
		} else {
			recipeList = se.getRecipesBySearch(recipeList);
		}
		model.addAttribute("recipeList", recipeList);
		return "recipeListByIngredients";
	}

	// 성빈 : 내 냉장고 입력 값에 따른 레시피 목록 출력 메소드
	// 비동기 통신에 의해 호출되는 메소드
	// 결과를 recipeListByMybox에 보여주고 비동기 통신에 의해
	// recipe.jsp에 출력한다
	@RequestMapping(value = "/recipe.do", params = "sb=mybox")
	public String getRecipesByMybox(Model model, HttpSession session) {
		String user_id = (String) session.getAttribute("user_id");
		SearchEngine se = new SearchEngine();
		ArrayList<MemberBoxVO> myIrdntList = memberDAOService.getMyIrdntByUserId(user_id);
		ArrayList<RecipeVO> recipeList;
		if (myIrdntList.size() == 0) {
			recipeList = null;
		} else {
			recipeList = se.searchRecipeListByMybox(myIrdntList);
			recipeList = se.getRecipeListByMybox(recipeList);
		}
		model.addAttribute("recipeList", recipeList);
		return "recipeListByMybox";
	}

	// 성빈 : 메시지 전송 작업을 처리하기 위한 모델
	// 메시지 삭제 시 url 변동을 막기 위해 이 url 요청은 ajax를 통해 요청해야 합니다.
	// ResponseBody는 요청의 응답 결과를 뷰로 연결시키는 것이 아니라 특정 객체를 리턴할 수 있게 해주는
	// Spring 어노테이션으로 여기선 리턴값이 void이므로 어떤 객체(데이터)도 응답하지 않습니다.
	// DB에서 단지 check값을 수정만 해주면 되기 때문에
	// 화면 상에서는 해당 엘리먼트의 display 값을 none으로 주어 사라지는 효과를 주면 됩니다.
	@RequestMapping(value = "/updateMessage.do")
	@ResponseBody
	public void updateMessage(String message_id) {

		messageDAOService.removeMessageByMessageId(message_id);
		return;

	}

	// 성빈 : 알림 메시지 전송 작업을 처리하기 위한 모델
	// 메시지 삭제 시 url 변동을 막기 위해 이 url 요청은 ajax를 통해 요청해야 합니다.
	// ResponseBody는 요청의 응답 결과를 뷰로 연결시키는 것이 아니라 특정 객체를 리턴할 수 있게 해주는
	// Spring 어노테이션으로 여기선 리턴값이 void이므로 어떤 객체(데이터)도 응답하지 않습니다.
	// DB에서 단지 check값을 수정만 해주면 되기 때문에
	// 화면 상에서는 해당 엘리먼트의 display 값을 none으로 주어 사라지는 효과를 주면 됩니다.
	@RequestMapping(value = "/updateNotification.do")
	@ResponseBody
	public void updateNotification(String notice_id) {

		notificationDAOService.removeNoticeByNoticeId(notice_id);
		return;

	}

	@RequestMapping(value = "/notification.do")
	public String getNotification(Model model, String user_id) {
	
		ArrayList<NotificationVO> notificationList = notificationDAOService.getMyNoticeById(user_id);
		if(notificationList.size()==0) {
			notificationList = null;
		}
		model.addAttribute("notificationList", notificationList);
		return "notification";
	}
	
	// 성빈 : 안 읽은 메시지를 읽어오는 메소드
	@RequestMapping(value = "/message.do")
	public String getMessage(Model model, String user_id) {
		
		ArrayList<MessageVO> messageList = messageDAOService.getMyMessageById(user_id);
		if(messageList.size()==0) {
			messageList = null;
		}
		model.addAttribute("messageList", messageList);
		return "message";
	}

}
