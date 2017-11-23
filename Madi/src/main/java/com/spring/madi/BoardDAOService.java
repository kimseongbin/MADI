package com.spring.madi;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardDAOService implements BoardDAO {

	@Autowired
	private SqlSession sqlSession;
	
	HashMap<String, Object> resultMap;

	@Override
	public ArrayList<BoardReplyVO> getBoards() {
		ArrayList<BoardReplyVO> replyList = new ArrayList<BoardReplyVO>();
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		//getBoards()의 메소드명과 Mapper.xml의 id명은 동일해야한다
		replyList = boardMapper.getBoards();
		//memberList = memberMappder.getMembers("tab_mybatis");
		//System.out.println(memberMapper.getCount());
		return replyList;
	}
	@Override
	public void writeBoard(BoardReplyVO boardReplyVO){
		//인욱: 맵퍼연결?
		System.out.println("!!!");
		System.out.println(boardReplyVO.getRep_content());
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		boardMapper.writeBoard(boardReplyVO);
			
	}
	@Override
	public ArrayList<BoardReplyVO> contentBoard(){
		//인욱:맵퍼 연결
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		ArrayList<BoardReplyVO> replyList1 = new ArrayList<BoardReplyVO>();
		replyList1 = boardMapper.contentBoard();
		
		return replyList1;
	}
	
	
}
