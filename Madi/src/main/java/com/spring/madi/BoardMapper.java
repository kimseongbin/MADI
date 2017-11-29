package com.spring.madi;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;


public interface BoardMapper {

	//인욱
	void writeBoard(BoardReplyVO boardReplyVO);
	//인욱
	ArrayList<BoardReplyVO> getBoard(BoardReplyVO boardReplyVO);
	//인욱
	ArrayList<BoardReplyVO> contentBoard();

	public void insertBoard(RecipeVO recipeVO);
	public ArrayList<BoardVO> boardList();

	//(진산) 자신의 게시글 목록 구하기
	ArrayList<BoardVO> getBoards(String user_id);
	//(진산) 자신의 게시글 개수 구하기
	int getBoardCount(String user_id);
	//(진산) 연월일 구하기
	//String getTime(String user_id);
	// (성빈) : recipeId와 연결된 Board 데이터 조회 메소드
	BoardVO getBoardByRecipeId(RecipeVO recipeVO);
	// (성빈) : board_num과 연결된 BOARD REPLY 데이터 조회 메소드
	ArrayList<BoardReplyVO> getReplyByBoardNum(BoardVO boardVO);
	//(진산)자신 +  팔로잉한 사람들의 게시글 목록 구하기...String[]로 하면 배열
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
	// (성빈)좋아요 카운트 증가
	void updateBoardLikePlus(UserLikeBoVO userLikeBoVO);
	// (성빈)좋아요 카운트 감소
	void updateBoardLikeMinus(UserLikeBoVO userLikeBoVO);
	// (성빈) 좋아하는 게시판 추가
	void insertUserLikeBo(UserLikeBoVO userLikeBovO);
	// (성빈) 종아하는 게시판 삭제
	void deleteUserLikeBo(UserLikeBoVO userLikeBoVO);
	// (성빈) 게시판 댓글 삭제
	void deleteReply(BoardReplyVO boardReplyVO);
	
}
