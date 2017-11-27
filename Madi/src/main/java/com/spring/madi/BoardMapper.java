package com.spring.madi;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;


public interface BoardMapper {

	//인욱
	void writeBoard(BoardReplyVO boardReplyVO);
	//인욱
	ArrayList<BoardReplyVO> getBoard();
	//인욱
	ArrayList<BoardReplyVO> contentBoard();

	public void insertBoard(BoardVO boardVO);
	public ArrayList<BoardVO> boardList();

	//(진산) 자신의 게시글 목록 구하기
	ArrayList<BoardVO> getBoards(String user_id);
	//(진산) 자신의 게시글 개수 구하기
	int getBoardCount(String user_id);
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
}
