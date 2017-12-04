<%@page import="com.spring.madi.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.spring.madi.MemberFollowVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- (진산) 팔로워 모달창 -->
<%
MemberVO memberVO= (MemberVO)request.getAttribute("memberVO");
List<MemberVO> followerList= (ArrayList<MemberVO>)request.getAttribute("followerList");
%>

								<%
									if (followerList.size() == 0) {
								%>
								<li class="w3-animate-opacity">현재 회원님의 팔로워 목록이 비어있습니다.</li>
								<%
									} else {
										for (int i = 0; i < followerList.size(); i++) {
											MemberVO follower = followerList.get(i);
								%>
								<li class="w3-animate-left"><img
									src="<%=follower.getUser_img()%>" class="img-circle"
									height="30" width="30"> &nbsp; <strong><%=follower.getUser_name()%></strong>
									&nbsp;
									<button type="button" class="btn btn-danger btn-sm"
										onclick="deleteFollower(this,'<%=memberVO.getUser_id()%>', '<%=follower.getUser_id()%>')"
										style="border-radius: 20px;">
										<strong>삭제</strong>
									</button></li>
								<%
									}
								}
								%>
<!-- 지우면 창에서도 -1이 바로 반영된다 -->
<script>
	function followerMinus() {
	document.getElementById("followerSize").innerHTML = <%=followerList.size()%>;
	}
</script>