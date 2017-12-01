<%@page import="com.spring.madi.NotificationVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- (진산)margin-top 지움 -->
<%
	ArrayList<NotificationVO> notificationList = (ArrayList<NotificationVO>) request.getAttribute("notificationList");
%>

<%
	if(notificationList.size() == 0) {
%>
		<li class="list-group-item">
			메시지가 없습니다.
		</li>			
<%		
	} else {
		for(int i = 0; i < notificationList.size(); i++) {
			NotificationVO notificationVO = notificationList.get(i);	
			if(notificationVO.getNotice_type().equals("팔로우 신청")) {			
%>				<!-- 팔로우 신청 시 알림 메시지 -->
				<li class="list-group-item" id="n<%=notificationVO.getNotice_id()%>">
					<strong>From</strong> &nbsp;
					<%=notificationVO.getNotice_from() %>&nbsp;:&nbsp;
					<br/> 
					<strong><%=notificationVO.getContent() %><br/>받으시겠습니까?</strong>
					<button class="btn" style="border-radius: 10px;" onclick="updateNotification('<%=notificationVO.getNotice_id()%>', '수락');">
						 수락
					</button>
					<button class="btn"  style="border-radius: 10px;" onclick="updateNotification('<%=notificationVO.getNotice_id()%>', '거절');">
						거절
					</button>
				</li>
<%
			} else if(notificationVO.getNotice_type().equals("좋아요 추가")) {
%>
				<!-- 좋아요 추가 시 알림 메시지 -->		
				<li class="list-group-item" id="n<%=notificationVO.getNotice_id()%>">
					<strong>From</strong>&nbsp;  
					<%=notificationVO.getNotice_from() %>&nbsp;:&nbsp;
					<br/>
					<strong><%=notificationVO.getContent() %></strong>
					<button class="btn" onclick="updateNotification('<%=notificationVO.getNotice_id()%>', '거절');"><span class="glyphicon glyphicon-remove"></span></button>
				</li>
<%
			} else {
%>				<!-- 댓글 추가 시 알림 메시지 -->		
				<li class="list-group-item" id="n<%=notificationVO.getNotice_id()%>">
					<strong>From</strong> &nbsp; 
					<%=notificationVO.getNotice_from() %>&nbsp;:&nbsp;
					<br/>
					<a href="./recipeDetail.do?recipe_id=<%=notificationVO.getNotice_type()%>">
						<strong><%=notificationVO.getContent() %></strong>
						</a>
					<button class="btn" onclick="updateNotification('<%=notificationVO.getNotice_id()%>', '거절');"><span class="glyphicon glyphicon-remove"></span></button>
				</li>
<%
			} // else 
		} // for
	} // else
%>