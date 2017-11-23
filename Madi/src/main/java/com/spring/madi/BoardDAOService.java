package com.spring.madi;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardDAOService implements BoardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	public void insertBoard(BoardVO boardVO) {
		
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		boardMapper.insertBoard(boardVO);
	}
	
	@Override
	public ArrayList<BoardVO> boardList() {
		
		ArrayList<BoardVO> boardList = new ArrayList<BoardVO>();
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		
		boardList = boardMapper.boardList();
		
		return boardList;
	}

}
