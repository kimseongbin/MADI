<%@page import="com.spring.madi.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="com.spring.madi.MemberFollowVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- (진산) 추천자 팔로우 모달창 -->
<%	

	List<MemberFollowVO> recommendList= (ArrayList<MemberFollowVO>)request.getAttribute("recommendList"); 	
	MemberVO memberVO= (MemberVO)request.getAttribute("memberVO");

%>	
<%for(int y=0; y<3; y++) {
	MemberFollowVO recommend= recommendList.get(y);
%>

	<li class="li fol2"><img src="<%=recommend.getUser_img()%>" class="img-circle" height="40"
		width="40">&nbsp; <a href="#">
		<strong><%=recommend.getUser_id()%></strong></a>
		&nbsp;
		<button type="button" class="btn btn-danger btn"
			onclick="insertFollowing('<%=recommend.getFollowing_user_id()%>', '<%=recommend.getFollowing_user_id()%>','<%=recommend.getUser_img()%>', '<%=recommend.getUser_img()%>')"
			style="border-radius: 10px;">
			<strong>팔로우</strong>
		</button>&nbsp;
	</li>
<%
//System.out.println("m-u=" + recommend.getUser_id());
//System.out.println("m-f=" + recommend.getFollowing_user_id());
System.out.println("m-u-i=" + recommend.getUser_img());
//System.out.println("m-f-i=" + recommend.getFollowing_user_img());
}	%>