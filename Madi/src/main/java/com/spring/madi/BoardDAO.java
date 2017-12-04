package com.spring.madi;

import java.util.ArrayList;

public interface BoardDAO {

	//인욱 : 보드 댓글 디비 저장
	public void writeBoard(BoardReplyVO boardReplyVO);
	//인욱 : 보드 댓글 불러오기
	public ArrayList<BoardReplyVO> getBoard(BoardReplyVO boardReplyVO); 
	//인욱 : 보드 게시판 클릭시 기존의 댓글 보여주기
	ArrayList<BoardReplyVO> contentBoard();

	
	// 게시물 입력
	public void insertBoard(RecipeVO recipeVO);
	
	// 게시물 목록
	public ArrayList<BoardVO> boardList();

	//(진산) 자신의 게시물 불러오기
	ArrayList<BoardVO> getBoards(String user_id);
	//(진산) 연월일 구하기
	//String getTime(String user_id);
	// (성빈) : recipeId와 연결된 Board 데이터 조회 메소드
	BoardVO getBoardByRecipeId(RecipeVO recipeVO);
	// (성빈) : board_num과 연결된 BOARD REPLY 데이터 조회 메소드
	ArrayList<BoardReplyVO> getReplyByBoardNum(BoardVO boardVO);
	//ArrayList<BoardVO> getFollowingBoards(String[] user_id);
	ArrayList<BoardVO> getAllBoards(String user_id);

	//(진산) 좋아요 눌렀었는지 체크
	UserLikeBoVO getUserLike(BoardVO boardVO);
	//(진산)좋아요 user_like_bo에 user_id, board_num 추가
	void insertUserLike(BoardVO boardVO);
	//(진산) 좋아요 board에다 like 숫자 1 추가
	void likePlusOne(BoardVO boardVO);
	//(진산) 좋아요 중복이라 user_like_bo에서 지우기
	void deleteUserLike(BoardVO boardVO);
	//(진산) 좋아요 중복이라 board에서 like 숫자 1 빼기
	void likeMinusOne(BoardVO boardVO);
	
	// (성빈)이미 좋아요를 누른 게시판인지 구하는 메소드
	UserLikeBoVO doesAlreadyLike(UserLikeBoVO userLikeBoVO);
	// 좋아요 증가
	void updateBoardLikePlus(UserLikeBoVO userLikeBoVO);
	// 좋아요 감소
	void updateBoardLikeMinus(UserLikeBoVO userLikeBoVO);
	// (성빈) 좋아하는 게시판 추가
	void insertUserLikeBo(UserLikeBoVO userLikeBoVO);
	// (성빈) 종아하는 게시판 삭제
	void deleteUserLikeBo(UserLikeBoVO userLikeBoVO);
	// (성빈) 내 댓글 삭제
	void deleteReply(BoardReplyVO boardReplyVO);
	// (성빈) 유저가 좋아하는 게시글 목록 불러오기
	ArrayList<UserLikeBoVO> getUserLikeBoardList(String user_id);
	int getReplySizeByBoardNum(BoardReplyVO boardReplyVO);
	// (성빈) 타임라인 구하기
	ArrayList<BoardVO> getTimelineBoard(MemberFollowVO memberFollowVO);
}
