package com.spring.madi;

import java.util.ArrayList;

public interface BoardMapper {
	//(진산) 자신의 게시글 목록 구하기
	ArrayList<BoardVO> getBoards(String user_id);
	//(진산) 자신의 게시글 개수 구하기
	int getBoardCount(String user_id);
	//(진산) 팔로잉한 사람들의 게시글 목록 구하기...String[]로 하면 배열
	ArrayList<BoardVO> getFollowingBoards(String[] following_user_id2);
	//(진산) 좋아요 하나 추가
	void updateBoardLike(String user_id);
}
