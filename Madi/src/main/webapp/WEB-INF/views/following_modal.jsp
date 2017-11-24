<%@page import="java.util.List"%>
<%@page import="com.spring.madi.MemberFollowVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- (진산) 팔로잉 모달창 -->
<%
	List<MemberFollowVO> followingList = (ArrayList<MemberFollowVO>)request.getAttribute("followingList");
%>

<%
	for(int i = 0; i < followingList.size(); i++) {
		MemberFollowVO following = followingList.get(i);
%>
		<li class="li fol">
			<img src="<%=following.getFollowing_user_img()%>" class="img-circle" height="40"width="40">&nbsp;
			<a href="#">
				<strong>
					<%=following.getFollowing_user_id()%>
				</strong>
			</a>&nbsp;
			<button type="button" class="btn btn-danger btn-sm" onclick="deleteFollowing('<%=following.getUser_id()%>', '<%=following.getFollowing_user_id()%>')"style="border-radius: 20px;">
				<strong>삭제</strong>
			</button>
		</li>
<%
	}
%>