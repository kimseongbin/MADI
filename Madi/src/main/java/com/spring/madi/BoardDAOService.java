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
	public ArrayList<BoardReplyVO> getBoard() {
		ArrayList<BoardReplyVO> replyList = new ArrayList<BoardReplyVO>();
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		//getBoards()의 메소드명과 Mapper.xml의 id명은 동일해야한다
		replyList = boardMapper.getBoard();
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


	//(진산)게시글 목록 구하기
	@Override
	public ArrayList<BoardVO> getBoards(String user_id) {
		BoardMapper boardMapper= sqlSession.getMapper(BoardMapper.class);
		ArrayList<BoardVO> boardList= new ArrayList<BoardVO>();
		boardList= boardMapper.getBoards(user_id);
		return boardList;
	}
	//(진산)팔로잉한 사람들의 게시글 목록 구하기
//	@Override
//	public ArrayList<BoardVO> getFollowingBoards(String[] following_user_id2) {
//		BoardMapper boardMapper= sqlSession.getMapper(BoardMapper.class);
//		ArrayList<BoardVO> followingboardList= new ArrayList<BoardVO>();
//		followingboardList= boardMapper.getFollowingBoards(following_user_id2);
//		return followingboardList;
//	}
	//(진산)좋아요 누르면 하나 오른다
	public void updateBoardLike(String user_id) {
		BoardMapper boardMapper= sqlSession.getMapper(BoardMapper.class);
		boardMapper. updateBoardLike (user_id);
	}
}

