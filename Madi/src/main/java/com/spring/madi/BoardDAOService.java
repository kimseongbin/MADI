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
	@Override
	public ArrayList<BoardVO> getFollowingBoards(String[] following_user_id) {
		BoardMapper boardMapper= sqlSession.getMapper(BoardMapper.class);
		ArrayList<BoardVO> followingboardList= new ArrayList<BoardVO>();
		followingboardList= boardMapper.getFollowingBoards(following_user_id);
		return followingboardList;
	}
	//(진산)좋아요 누르면 하나 오른다
	@Override
	public void updateBoardLike(int board_num, String user_id) {
		System.out.println("d-u1=" + user_id);
		BoardMapper boardMapper= sqlSession.getMapper(BoardMapper.class);
		System.out.println("d-u2=" + board_num);
		boardMapper.updateBoardLike(board_num, user_id);
		System.out.println("d-u3=" + user_id);
	}
	
	// (성빈) : recipe_id와 연결된 Board 데이터 조회 메소드
	@Override
	public BoardVO getBoardByRecipeId(RecipeVO recipeVO) {
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		BoardVO boardVO = boardMapper.getBoardByRecipeId(recipeVO);
		if(boardVO == null) {
			System.out.println("SYSTEM  :  게시글 조회 결과, BoardDAOServcie; getBoardByRecipeId, boardVO가 null입니다. return new BoardVO");
			boardVO = new BoardVO();
		}
		return boardVO;
	}
	// (성빈) : board_num과 연결된 BoardReply 데이터 조회 메소드
	@Override
	public ArrayList<BoardReplyVO> getReplyByBoardNum(BoardVO boardVO) {
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		ArrayList<BoardReplyVO> ReplyList = boardMapper.getReplyByBoardNum(boardVO);
		if(ReplyList.size() == 0) {
			System.out.println("SYSTEM  :  게시글 댓글 리스트 조회 결과, BoardDAOService; getReplyByBoardNum, ArrayList<BoardReplyVO>의 Size가 0입니다.");
		}
		return ReplyList;
	}
}

