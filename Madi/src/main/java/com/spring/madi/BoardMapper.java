package com.spring.madi;

import java.util.ArrayList;


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
	//(진산) 팔로잉한 사람들의 게시글 목록 구하기...String[]로 하면 배열
	ArrayList<BoardVO> getFollowingBoards(String[] following_user_id);
	//(진산) 좋아요 하나 추가
	void updateBoardLike(int board_num, String user_id);
	// (성빈) : recipeId와 연결된 Board 데이터 조회 메소드
	BoardVO getBoardByRecipeId(RecipeVO recipeVO);
	// (성빈) : board_num과 연결된 BOARD REPLY 데이터 조회 메소드
	ArrayList<BoardReplyVO> getReplyByBoardNum(BoardVO boardVO);
}
