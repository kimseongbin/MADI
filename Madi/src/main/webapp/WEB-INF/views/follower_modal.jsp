<%@page import="java.util.ArrayList"%>
<%@page import="com.spring.madi.MemberFollowVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- (진산) 팔로워 모달창 -->
<%
	List<MemberFollowVO> followerList = (ArrayList<MemberFollowVO>)request.getAttribute("followerList");
%>

<%
	for(int i = 0; i < followerList.size(); i++) {
		MemberFollowVO follower = followerList.get(i);
%>
		<li class="li fol">
			<img src="<%=follower.getUser_img()%>" class="img-circle" height="40"width="40">&nbsp;
			<a href="#">
				<strong>
					<%=follower.getUser_id()%>
				</strong>
			</a>&nbsp;
			<button type="button" class="btn btn-danger btn-sm" onclick="deleteFollower('<%=follower.getUser_id()%>', '<%=follower.getFollowing_user_id()%>')"style="border-radius: 20px;">
				<strong>삭제</strong>
			</button>
		</li>
<%
	}
%>
<!-- 지우면 창에서도 -1이 바로 반영된다 -->
<script>
	function followerMinus() {
		document.getElementById("followerSize").innerHTML = <%=followerList.size()%>;
	}
</script>