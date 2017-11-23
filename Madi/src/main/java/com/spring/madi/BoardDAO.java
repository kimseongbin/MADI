package com.spring.madi;

import java.util.ArrayList;

public interface BoardDAO {

	
	//인욱 : 보드 댓글 디비 저장
	public void writeBoard(BoardReplyVO boardReplyVO);
	//인욱 : 보드 댓글 불러오기
	public ArrayList<BoardReplyVO> getBoards(); 
	//인욱 : 보드 게시판 클릭시 기존의 댓글 보여주기
	ArrayList<BoardReplyVO> contentBoard();
}

