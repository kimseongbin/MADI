<%@page import="com.spring.madi.NotificationVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
		
%>
			<li class="list-group-item" id="n<%=notificationVO.getNotice_id()%>" style="margin-top: 100px;">
				<strong>From </strong> 
				<img src="./resources/profile/bird.jpg" class="img-circle" height="20" width="20" alt="Avatar"> 
				<a><%=notificationVO.getNotice_from() %></a> <strong><%=notificationVO.getContent() %></strong>
				<button class="btn" onclick="updateNotification(<%=notificationVO.getNotice_id()%>);"><span class="glyphicon glyphicon-remove"></span></button>
			</li>
<%
		}
	}
%>