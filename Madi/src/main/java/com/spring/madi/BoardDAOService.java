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
	//(진산)자신 + 팔로잉한 사람들의 게시글 목록 구하기
	@Override
	public ArrayList<BoardVO> getAllBoards(String user_id) {
		BoardMapper boardMapper= sqlSession.getMapper(BoardMapper.class);
		ArrayList<BoardVO> allBoardList= new ArrayList<BoardVO>();
		allBoardList= boardMapper.getAllBoards(user_id);
		return allBoardList;
	}
	//(진산) 좋아요 눌렀었는지 체크
	@Override
	public UserLikeBoVO getUserLike(BoardVO boardVO) {
		BoardMapper boardMapper= sqlSession.getMapper(BoardMapper.class);
		UserLikeBoVO result= boardMapper.getUserLike(boardVO);
		return result;
	}
	//(진산)좋아요 user_like_bo에 user_id, board_num 추가
	@Override
	public void insertUserLike(BoardVO boardVO) {
		BoardMapper boardMapper= sqlSession.getMapper(BoardMapper.class);
		boardMapper.insertUserLike(boardVO);
	}
	//(진산) 좋아요 board에다 like 숫자 1 추가
	@Override
	public void likePlusOne(BoardVO boardVO) {
		BoardMapper boardMapper= sqlSession.getMapper(BoardMapper.class);
		boardMapper.likePlusOne(boardVO);
	}
	//(진산)좋아요가 이미 있어서  user_like_bo에서 삭제하는 문장
	@Override
	public void deleteUserLike(BoardVO boardVO) {
		BoardMapper boardMapper= sqlSession.getMapper(BoardMapper.class);
		boardMapper.deleteUserLike(boardVO);
	}
	//(진산) 좋아요가 이미 있어서 board에서 1 마이너스함
	@Override
	public void likeMinusOne(BoardVO boardVO) {
		BoardMapper boardMapper= sqlSession.getMapper(BoardMapper.class);
		boardMapper.likeMinusOne(boardVO);
	}
}

