package com.spring.madi;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardDAOService implements BoardDAO {

	@Autowired
	private SqlSession sqlSession;
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
	public ArrayList<BoardVO> getFollowingBoards(String[] following_user_id2) {
		BoardMapper boardMapper= sqlSession.getMapper(BoardMapper.class);
		ArrayList<BoardVO> followingboardList= new ArrayList<BoardVO>();
		followingboardList= boardMapper.getFollowingBoards(following_user_id2);
		return followingboardList;
	}
	//(진산)좋아요 누르면 하나 오른다
	public void updateBoardLike(String user_id) {
		BoardMapper boardMapper= sqlSession.getMapper(BoardMapper.class);
		boardMapper. updateBoardLike (user_id);
	}
}
