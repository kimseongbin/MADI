package com.spring.madi;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.madi.MemberFollowVO;
import com.spring.madi.MemberMapper;
import com.spring.madi.MemberVO;

@Service
public class MemberDAOService implements MemberDAO {

	@Autowired
	private SqlSession sqlSession;
	//(진산)로그인한 자신의 id 불러오기
	@Override
	public MemberVO getMember(String user_id) {
		MemberVO member= new MemberVO();
		MemberMapper memberMapper= sqlSession.getMapper(MemberMapper.class);
		member= memberMapper.getMember(user_id);
		return member;
	}
	//(진산) 임시 MemberFollow에서 following_user_id 불러오기
//	@Override 
//	public MemberFollowVO getFollowing_user_id(String user_id) {
//		MemberFollowVO memberFollow= new MemberFollowVO();
//		MemberMapper memberMapper= sqlSession.getMapper(MemberMapper.class);
//		memberFollow= memberMapper.getFollowing_user_id(user_id);
//		return memberFollow;
//	}
	//(진산)팔로워 목록 구하기
	@Override
	public ArrayList<MemberFollowVO> getFollower(String user_id) {
		ArrayList<MemberFollowVO> followerList= new ArrayList<MemberFollowVO>();
		MemberMapper memberMapper= sqlSession.getMapper(MemberMapper.class);
		followerList= memberMapper.getFollower(user_id);
		return followerList;
	}
	@Override
	//(진산)팔로잉 목록 구하기
	public ArrayList<MemberFollowVO> getFollowing(String user_id) {
		ArrayList<MemberFollowVO> followingList= new ArrayList<MemberFollowVO>();
		MemberMapper memberMapper= sqlSession.getMapper(MemberMapper.class);
		followingList= memberMapper.getFollowing(user_id);
		return followingList;
	}
	//(진산)팔로워 추천 리스트
	@Override
	public ArrayList<MemberFollowVO> getRecommendFollower(String user_id) {
		ArrayList<MemberFollowVO> recommendList= new ArrayList<MemberFollowVO>();
		MemberMapper memberMapper= sqlSession.getMapper(MemberMapper.class);
		recommendList= memberMapper.getRecommendFollower(user_id);
		return recommendList;
	}
	//(진산)팔로잉 한 명 삭제
	@Override
	public void deleteFollowing(String user_id, String following_user_id) {
		MemberMapper memberMapper= sqlSession.getMapper(MemberMapper.class);
		System.out.println("d-u=" + user_id);
		System.out.println("f=" + following_user_id);
		memberMapper.deleteFollowing(user_id, following_user_id);
	}
	//(진산)팔로워 한 명 삭제
	@Override
	public void deleteFollower(String user_id, String following_user_id) {
		MemberMapper memberMapper= sqlSession.getMapper(MemberMapper.class);
		System.out.println("d-u=" + user_id);
		System.out.println("d-f=" + following_user_id);
		memberMapper.deleteFollower(user_id, following_user_id);
	}
	//(진산)팔로잉 한 명 추가
	@Override
	public void insertFollowing(String user_id, String following_user_id, String user_img, String following_user_img) {
		MemberMapper memberMapper= sqlSession.getMapper(MemberMapper.class);
		System.out.println("d-u=" + user_id);
		System.out.println("d-f=" + following_user_id);
		System.out.println("d-u-i=" + user_img);
		System.out.println("d-f-i=" + following_user_img);
		memberMapper.insertFollowing(user_id, following_user_id, user_img, following_user_img);
	}
}
