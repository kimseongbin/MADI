<%@page import="com.spring.madi.MessageVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	ArrayList<MessageVO> messageList = (ArrayList<MessageVO>) request.getAttribute("messageList");
%>
<%
	if (messageList.size() == 0) {
%>
		<li class="list-group-item">
			메시지가 없습니다.
		</li>
<%
	} else {
		for(int i = 0; i < messageList.size(); i++) {
			MessageVO messageVO = messageList.get(i);
%>
		<li class="list-group-item" id="m<%=messageVO.getMessage_id()%>">
			<strong>From </strong> 
			<img src="./resources/profile/bird.jpg" class="img-circle" height="20" width="20" alt="Avatar"> 
			<a><%=messageVO.getSender_id() %></a> <strong><%=messageVO.getContent() %></strong>
			<button class="btn" onclick="updateMessage(<%=messageVO.getMessage_id()%>)"><span class="glyphicon glyphicon-remove"></span></button>
		</li>
<%
		}
	}
%>