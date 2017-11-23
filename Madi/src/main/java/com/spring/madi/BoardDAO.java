package com.spring.madi;

import java.util.ArrayList;

public interface BoardDAO {
	
	// 게시물 입력
	public void insertBoard(BoardVO boardVO);
	
	// 게시물 목록
	public ArrayList<BoardVO> boardList();

}
