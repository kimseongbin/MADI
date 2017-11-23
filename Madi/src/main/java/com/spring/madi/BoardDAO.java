package com.spring.madi;

import java.util.ArrayList;

public interface BoardDAO {

	//인욱 : 보드 댓글 디비 저장
	public void writeBoard(BoardReplyVO boardReplyVO);
	//인욱 : 보드 댓글 불러오기
	public ArrayList<BoardReplyVO> getBoard(); 
	//인욱 : 보드 게시판 클릭시 기존의 댓글 보여주기
	ArrayList<BoardReplyVO> contentBoard();

	
	// 게시물 입력
	public void insertBoard(BoardVO boardVO);
	
	// 게시물 목록
	public ArrayList<BoardVO> boardList();

	//(진산) 자신의 게시물 불러오기
	ArrayList<BoardVO> getBoards(String user_id);
	//(진산) 팔로잉한 사람의 게시물 불러오기
	//ArrayList<BoardVO> getFollowingBoards(String[] following_user_id2);
	//(진산) 좋아요 하나 추가
	void updateBoardLike(String user_id);
}
