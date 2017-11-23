package com.spring.madi;

import java.util.ArrayList;

public interface BoardMapper {
	
	public void insertBoard(BoardVO boardVO);
	public ArrayList<BoardVO> boardList();
}
