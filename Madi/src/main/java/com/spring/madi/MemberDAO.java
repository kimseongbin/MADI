package com.spring.madi;

import java.util.ArrayList;
import java.util.Map;

public interface MemberDAO {
	//(진산) 로그인한 아이디 자신에 대한 member정보
	MemberVO getMember(String user_id);
	//(진산) 임시--MemberFollow에서 팔로잉한 사람 불러오기
	//MemberFollowVO getFollowing_user_id(String user_id);
	//(진산)팔로워 수 카운트
	ArrayList<MemberFollowVO> getFollower(String user_id);	
	//(진산)팔로잉 수 카운트
	ArrayList<MemberFollowVO> getFollowing(String user_id);
	//(진산)팔로워 추천 리스트
	ArrayList<MemberFollowVO> getRecommendFollower(String user_id);
	//(진산) 추천 리스트 새로고침
	ArrayList<MemberFollowVO> getReloadRecommend();
	//(진산)팔로잉 한 명 삭제
	void deleteFollowing(String following_user_id, String user_id);
	//(진산)팔로워 한 명 삭제
	void deleteFollower(String user_id, String following_user_id);
	//(진산)팔로잉 한 명 추가
	void insertFollowing(String user_id, String following_user_id, String user_img, String following_user_img);

	//성빈 : 로그인 체크를 위한 password 조회 메소드
	public MemberVO getPasswordByUserId(MemberVO memberVO);
	// 성빈 : 회원가입 메소드 (입력된 회원정보를 member 테이블에 insert한다)
	public void setMember(MemberVO memberVO);
	// 성빈 : Member_Box 테이블에서 내 재료 목록을 불러오기 위한 조회 메소드
	public ArrayList<MemberBoxVO> getMyIrdntByUserId(String user_id);
	//(진산) 재료가 중복인지 확인하기
	public MemberBoxVO getCheckIrdnt(MemberBoxVO memberBoxVO);
	//(진산) 냉장고에 재료 입력하기
	public void insertIrdnt(MemberBoxVO memberBoxVO);
	//(진산) 냉장고 재료가 중복이라 삭제하기
	public void deleteIrdnt(MemberBoxVO memberBoxVO);

	// 성빈 : 회원  기본 정보 조회 쿼리 (사용안한 메소드, 필요할까봐)
	public MemberVO getUserInfoById(String user_id);
	// 성빈 : following 추가
	public void setFollowing(MemberFollowVO memberFollowVO);
	// 성빈 : follwing 체크
	public MemberFollowVO checkFollowing(MemberFollowVO memberFollowVO);
	
	// 회원 정보수정
	public int updateInfo(MemberVO memberVO);
}
