<%@page import="com.spring.madi.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="com.spring.madi.MemberFollowVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- (진산) 팔로잉 모달창 -->
<%
MemberVO memberVO= (MemberVO)request.getAttribute("memberVO");
List<MemberVO> followingList= (ArrayList<MemberVO>)request.getAttribute("followingList");
%>

								<%
									if (followingList.size() == 0) {
								%>
								<li class="w3-animate-opacity">현재 회원님께선 아직 팔로잉한 친구가 없습니다.</li>
								<%
									} else {
										for (int j = 0; j < followingList.size(); j++) {
											MemberVO following = followingList.get(j);
								%>
								<li class="w3-animate-left"><img
									src="<%=following.getUser_img()%>" class="img-circle"
									height="30" width="30"> &nbsp; <strong><%=following.getUser_name()%></strong>
									&nbsp;
									<button type="button" class="btn btn-danger btn-sm"
										onclick="deleteFollowing(this,'<%=memberVO.getUser_id()%>', '<%=following.getUser_id()%>')"
										style="border-radius: 20px;">
										<strong>삭제</strong>
									</button></li>
								<%
									}
								}
								%>
<!-- 지우면 창에서도 -1이 바로 반영된다 -->
<script>
function followingMinus() {
	document.getElementById("followingSize").innerHTML = <%=followingList.size()%>;
}
</script>