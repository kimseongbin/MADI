package com.spring.madi;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MemberDAOService implements MemberDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.spring.madi.MemberMapper";
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
	public ArrayList<MemberVO> getFollower(String user_id) {
		MemberMapper memberMapper= sqlSession.getMapper(MemberMapper.class);
		ArrayList<MemberVO> followerList= memberMapper.getFollower(user_id);
		return followerList;
	}
	@Override
	//(진산)팔로잉 목록 구하기
	public ArrayList<MemberVO> getFollowing(String user_id) {
		MemberMapper memberMapper= sqlSession.getMapper(MemberMapper.class);
		ArrayList<MemberVO> followingList= memberMapper.getFollowing(user_id);
		return followingList;
	}
	//(진산)팔로워 추천 리스트
	@Override
	public ArrayList<MemberVO> getRecommendFollower(String user_id) {
		ArrayList<MemberVO> recommendList= new ArrayList<MemberVO>();
		MemberMapper memberMapper= sqlSession.getMapper(MemberMapper.class);
		recommendList= memberMapper.getRecommendFollower(user_id);
		return recommendList;
	}
	//(진산) 추천리스트 새로고침
	@Override
	public ArrayList<MemberFollowVO> getReloadRecommend() {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		ArrayList<MemberFollowVO> memberFollowVO= memberMapper.getReloadRecommend();
		return memberFollowVO;
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
		try {
			memberMapper.insertFollowing(user_id, following_user_id, user_img, following_user_img);
		} catch (Exception e) {
			System.out.println("SYSTEM  :  MemberDAOService, insertFollowing; 팔로잉 추가 실패 요청한 사람 : " + user_id);
		}
	}
	@Override // 성빈 : 로그인 체크를 위한 password 조회 메소드
	public MemberVO getPasswordByUserId(MemberVO memberVO) {
		System.out.println("로그인 요청 : 패스워드 조회 시작");
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		MemberVO vo = memberMapper.getPasswordByUserId(memberVO);
		System.out.println("로그인 요청 : 패스워드 조회 성공");
		return vo;
	}

	@Override // 성빈 : 회원가입 메소드 (입력된 회원정보를 member 테이블에 insert한다)
	public void setMember(MemberVO memberVO) {
		System.out.println("회원가입 요청 : 회원가입 시작");
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		try {
			memberMapper.setMember(memberVO);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("회원가입 요청 : 회원가입 실패 " + e.getMessage());
		}
		return;
	}
	@Override// 인욱: 카카오 로그인시 간편회원가입 메소드
	public void set_Member(MemberVO memberVO){
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		memberMapper.set_Member(memberVO);
		//MemberVO memberinfo = memberMapper.getUserInfoById(memberVO.getUser_id());
		
		return ;
	}
	public int checkEmail(MemberVO memberVO){
		
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		int x = memberMapper.checkEmail(memberVO);
		return x;
	}
	

	@Override // 성빈 : Member_Box 테이블에서 내 재료 목록을 불러오기 위한 조회 메소드
	public ArrayList<MemberBoxVO> getMyIrdntByUserId(String user_id) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		ArrayList<MemberBoxVO> myIrdntList = memberMapper.getMyIrdntByUserId(user_id);
		if(myIrdntList.size()==0) {
			System.out.println("SYSTEM  :  MemberDAOService, getMyIrdntByUserId; 읽어온 내 재료 목록의 개수가 0입니다.");
		}
		return myIrdntList;
	}
	
	//(진산) 냉장고에 재료가 있는지 알아보기
	@Override
	public MemberBoxVO getCheckIrdnt(MemberBoxVO memberBoxVO) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		MemberBoxVO irdntList= memberMapper.getCheckIrdnt(memberBoxVO);
		return irdntList;
	}
	//(진산) 냉장고에 재료 입력하기
	@Override
	public void insertIrdnt(MemberBoxVO memberBoxVO) {
		MemberMapper memberMapper= sqlSession.getMapper(MemberMapper.class);
		memberMapper.insertIrdnt(memberBoxVO);
	}
	//(진산) 냉장고 재료 중복이라 삭제하기
	@Override
	public void deleteIrdnt(MemberBoxVO memberBoxVO) {
		MemberMapper memberMapper= sqlSession.getMapper(MemberMapper.class);
		try {
			memberMapper.deleteIrdnt(memberBoxVO);
		} catch (Exception e) {
			System.out.println("SYSTEM  :  MemberDAOServcie, delteIrdnt; 내 냉장고 재료 삭제 오류 발생 user_id : " + memberBoxVO.getUser_id() + " my_irdnt : " + memberBoxVO.getMy_irdnt());
			e.printStackTrace();
		}
		
	}
	
	@Override // 성빈 : 회원 기본 정보 조회 메소드
	public MemberVO getUserInfoById(String user_id) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		MemberVO memberVO = memberMapper.getUserInfoById(user_id);
		return memberVO;
	}

	
	//(인욱)카카오 아이디 db에서 확인 후 ->값을 가져옴 
	@Override
	public MemberVO checkMember(MemberVO memberVO){
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		System.out.println();
		MemberVO x = memberMapper.checkMember(memberVO);
		
		return x;
	}
	@Override
	public void setFollowing(MemberFollowVO memberFollowVO) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		try {
			memberMapper.setFollowing(memberFollowVO);
		} catch (Exception e) {
			System.out.println("SYSTEM  :  MeberDAOService, setFollowing; 팔로잉 추가 실패");
			e.printStackTrace();
		} 
		
	}
	// 팔로우 한 적 있는 체크
	@Override
	public int checkFollowing(MemberFollowVO memberFollowVO) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		return memberMapper.checkFollowing(memberFollowVO);
		
	}
	@Override
	public ArrayList<MemberVO> getRecommendByFollowerCnt(String user_id) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		return memberMapper.getRecommendByFollowerCnt(user_id);
	}
	@Override
	public ArrayList<MemberVO> getRecommendByRecipeCnt() {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		return memberMapper.getRecommendByRecipeCnt();
	}
	@Override
	public ArrayList<MemberVO> getRecommendByLikeCnt() {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		return memberMapper.getRecommendByLikeCnt();
	}
	
	// 예진 회원 정보수정
	@Override 
	public int updateInfo(MemberVO memberVO) {
		return sqlSession.update(namespace + ".updateInfo", memberVO);

	}
	@Override
	public int checkUserId(String user_id) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		return memberMapper.checkUserId(user_id);
	}
	// 예진 차단 등록
	@Override
	public int insertBlockMember(BlockMemberVO blockVO) {		
		return sqlSession.insert(namespace + ".insertBlockMember", blockVO); 		
	}
	
	// 예진 차단 리스트
	@Override
	public List<BlockMemberVO> getBlockMember(String user_id) {
		return sqlSession.selectList(namespace + ".getBlockMember", user_id);
	}
	
	//예진 차단한 id 팔로잉에서 지우기
	public void deleteBlockMember(BlockMemberVO blockVO) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", blockVO.getUser_id());
		map.put("block_user_id", blockVO.getBlock_user_id());	
		sqlSession.delete(namespace + ".deleteBlockMember", map);	
	}
	// 예진: 임시 비밀번호 부여
	@Transactional
	public void tempPassword(String tempPassword, String user_email) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("temp_pwd", tempPassword);
		map.put("user_email", user_email);
		sqlSession.update(namespace + ".randomPassword", map);
		
	}
	// 예진: 이메일 존재 여부
	public int existEmail(String userEmail) {
		return sqlSession.selectOne(namespace + ".existEmail", userEmail);	
	}
}
