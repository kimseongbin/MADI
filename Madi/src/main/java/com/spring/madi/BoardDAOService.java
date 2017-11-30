package com.spring.madi;

import java.util.ArrayList;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardDAOService implements BoardDAO {

	@Autowired
	private SqlSession sqlSession;
	
	HashMap<String, Object> resultMap;

	@Override
	public ArrayList<BoardReplyVO> getBoard(BoardReplyVO boardReplyVO) {
		ArrayList<BoardReplyVO> replyList = new ArrayList<BoardReplyVO>();
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		//getBoards()의 메소드명과 Mapper.xml의 id명은 동일해야한다
		replyList = boardMapper.getBoard(boardReplyVO);
		//memberList = memberMappder.getMembers("tab_mybatis");
		//System.out.println(memberMapper.getCount());
		return replyList;
	}
	// (성빈), (수정) : 댓글 입력 메소드 
	@Override
	public void writeBoard(BoardReplyVO boardReplyVO){		
		//인욱: 맵퍼연결?
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		try {
			boardMapper.writeBoard(boardReplyVO);
		} catch (Exception e) {
			System.out.println("SYSTEM  :  댓글 입력 오류 발생, BoardDAOService; writeBoard; 댓글 입력에 실패했습니다.");
			System.out.println("SYSTEM  :  댓글 입력 파라미터, BoardDAOService; writeBoard; board_num : " + boardReplyVO.getBoard_num());
			System.out.println("SYSTEM  :  댓글 입력 파라미터, BoardDAOService; writeBoard; user_id : " + boardReplyVO.getUser_id());
			System.out.println("SYSTEM  :  댓글 입력 파라미터, BoardDAOService; writeBoard; user_img : " + boardReplyVO.getUser_img());
			System.out.println("SYSTEM  :  댓글 입력 파라미터, BoardDAOService; writeBoard; rep_content : " + boardReplyVO.getRep_content());
			e.printStackTrace();
		}
	}
	@Override
	public ArrayList<BoardReplyVO> contentBoard(){
		//인욱:맵퍼 연결
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		ArrayList<BoardReplyVO> replyList1 = new ArrayList<BoardReplyVO>();
		replyList1 = boardMapper.contentBoard();
		
		return replyList1;
	}
	
	// (성빈) 수정 : 입력받은 RecipeVO 객체를 그대로 전달해 Board Table에 레시피 기본 정보를 입력하는 메소드
	// 반드시 recipe를 먼저 입력한 후에 이 메소드를 사용할 것
	// 그렇지 않을 경우 MAX함수를 사용해 생성한 레시피 아이디와 Board 입력 시의 Board_num의 값이 서로 일치하지 않게 됨.
	public void insertBoard(RecipeVO recipeVO) {
		
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		try {
			boardMapper.insertBoard(recipeVO);
		} catch (Exception e) {
			System.out.println("SYSTEM  :  BoardDAOService, insertBoard;  RecipeVO로부터 Board 입력 실패 " + e.getMessage());
			e.printStackTrace();
		}
		
	}
	
	@Override
	public ArrayList<BoardVO> boardList() {
		
		ArrayList<BoardVO> boardList = new ArrayList<BoardVO>();
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		
		boardList = boardMapper.boardList();
		
		return boardList;
	}


	//(진산)게시글 목록 구하기
	@Override
	public ArrayList<BoardVO> getBoards(String user_id) {
		BoardMapper boardMapper= sqlSession.getMapper(BoardMapper.class);
		ArrayList<BoardVO> boardList= new ArrayList<BoardVO>();
		boardList= boardMapper.getBoards(user_id);
		return boardList;
	}
	// (진산) 연월일만 구하기
//	public String getTime(String user_id) {
//		BoardMapper boardMapper= sqlSession.getMapper(BoardMapper.class);
//		String time= boardMapper.getTime(user_id);
//		return time;
//	}
	//(진산)자신 + 팔로잉한 사람들의 게시글 목록 구하기
	@Override
	public ArrayList<BoardVO> getAllBoards(String user_id) {
		BoardMapper boardMapper= sqlSession.getMapper(BoardMapper.class);
		ArrayList<BoardVO> allBoardList= new ArrayList<BoardVO>();
		allBoardList= boardMapper.getAllBoards(user_id);
		return allBoardList;
	}
	//(진산) 좋아요 눌렀었는지 체크
	@Override
	public UserLikeBoVO getUserLike(BoardVO boardVO) {
		BoardMapper boardMapper= sqlSession.getMapper(BoardMapper.class);
		UserLikeBoVO result= boardMapper.getUserLike(boardVO);
		return result;
	}
	//(진산)좋아요 user_like_bo에 user_id, board_num 추가
	@Override
	public void insertUserLike(BoardVO boardVO) {
		BoardMapper boardMapper= sqlSession.getMapper(BoardMapper.class);
		boardMapper.insertUserLike(boardVO);
	}
	//(진산) 좋아요 board에다 like 숫자 1 추가
	@Override
	public void likePlusOne(BoardVO boardVO) {
		BoardMapper boardMapper= sqlSession.getMapper(BoardMapper.class);
		boardMapper.likePlusOne(boardVO);
	}
	//(진산)좋아요가 이미 있어서  user_like_bo에서 삭제하는 문장
	@Override
	public void deleteUserLike(BoardVO boardVO) {
		BoardMapper boardMapper= sqlSession.getMapper(BoardMapper.class);
		boardMapper.deleteUserLike(boardVO);
	}
	//(진산) 좋아요가 이미 있어서 board에서 1 마이너스함
	@Override
	public void likeMinusOne(BoardVO boardVO) {
		BoardMapper boardMapper= sqlSession.getMapper(BoardMapper.class);
		boardMapper.likeMinusOne(boardVO);
	}
	
	// (성빈) : recipe_id와 연결된 Board 데이터 조회 메소드
	@Override
	public BoardVO getBoardByRecipeId(RecipeVO recipeVO) {
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		BoardVO boardVO = boardMapper.getBoardByRecipeId(recipeVO);
		if(boardVO == null) {
			System.out.println("SYSTEM  :  게시글 조회 결과, BoardDAOServcie; getBoardByRecipeId, boardVO가 null입니다. return new BoardVO");
			boardVO = new BoardVO();
		}
		return boardVO;
	}
	// (성빈) : board_num과 연결된 BoardReply 데이터 조회 메소드
	@Override
	public ArrayList<BoardReplyVO> getReplyByBoardNum(BoardVO boardVO) {
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		ArrayList<BoardReplyVO> ReplyList = boardMapper.getReplyByBoardNum(boardVO);
		if(ReplyList.size() == 0) {
			System.out.println("SYSTEM  :  게시글 댓글 리스트 조회 결과, BoardDAOService; getReplyByBoardNum, ArrayList<BoardReplyVO>의 Size가 0입니다.");
		}
		return ReplyList;
	}
	// (성빈) : 이미 좋아요를 누른 게시판인지 구하는 메소드
	public UserLikeBoVO doesAlreadyLike(UserLikeBoVO userLikeBoVO) {
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		UserLikeBoVO vo = boardMapper.doesAlreadyLike(userLikeBoVO);
		return vo;
	}
	// 성빈 좋아요 추가
	@Override
	public void updateBoardLikePlus(UserLikeBoVO userLikeBoVO) {
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		try {
			boardMapper.updateBoardLikePlus(userLikeBoVO);
		} catch (Exception e) {
			System.out.println("SYSTEM  :  BoardDAOService, updateBoardLikePlus, 게시판 좋아요 카운트 +1 실패");
			e.printStackTrace();
		}
		
	}
	// 성빈 좋아요 감소
	@Override
	public void updateBoardLikeMinus(UserLikeBoVO userLikeBoVO) {
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		try {
			boardMapper.updateBoardLikeMinus(userLikeBoVO);
		} catch (Exception e) {
			System.out.println("SYSTEM  :  BoardDAOService, updateBoardLikeMinus, 게시판 좋아요 카운트 -1 실패");
			e.printStackTrace();
		}
		
	}
	// 좋아하는 게시판 추가
	@Override
	public void insertUserLikeBo(UserLikeBoVO userLikeBoVO) {
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		try {
			boardMapper.insertUserLikeBo(userLikeBoVO);
		} catch (Exception e) {
			System.out.println("SYSTEM  :  BoardDAOService, insertUserLikeBO, 좋아하는 게시판에 insert 실패");
			e.printStackTrace();
		}
		
	}
	// 좋아하는 게시판 삭제
	@Override
	public void deleteUserLikeBo(UserLikeBoVO userLikeBoVO) {
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		try {
			boardMapper.deleteUserLikeBo(userLikeBoVO);
		} catch (Exception e) {
			System.out.println("SYSTEM  : BoardDAOService, deleteUserLikeBo, 좋아하는 게시판 delete 실패");
			e.printStackTrace();
		}
	}
	// 게시글 댓글 삭제
	@Override
	public void deleteReply(BoardReplyVO boardReplyVO) {
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		try {
			boardMapper.deleteReply(boardReplyVO);
		} catch (Exception e) {
			System.out.println("SYSTEM  : BoardDAOService, deleteReply, 좋아하는 게시판 댓글 delete 실패");
			e.printStackTrace();
		}
		
	}
	// 유저가 좋아하는 게시판 목록 불러오기
	@Override
	public ArrayList<UserLikeBoVO> getUserLikeBoardList(String user_id) {
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		ArrayList<UserLikeBoVO> userLikeBoardList = boardMapper.getUserLikeBoardList(user_id);
		return userLikeBoardList;
	}
}

