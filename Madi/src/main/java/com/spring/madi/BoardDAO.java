package com.spring.madi;

import java.util.ArrayList;

public interface BoardDAO {
	//(진산) 자신의 게시물 불러오기
	ArrayList<BoardVO> getBoards(String user_id);
	//(진산) 팔로잉한 사람의 게시물 불러오기
	//ArrayList<BoardVO> getFollowingBoards(String[] following_user_id2);
	//(진산) 좋아요 하나 추가
	void updateBoardLike(String user_id);
}
