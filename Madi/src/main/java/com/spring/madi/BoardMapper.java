package com.spring.madi;

import java.util.ArrayList;

public interface BoardMapper {

	//인욱
	void writeBoard(BoardReplyVO boardReplyVO);
	//인욱
	ArrayList<BoardReplyVO> getBoards();
	//인욱
	ArrayList<BoardReplyVO> contentBoard();
}
