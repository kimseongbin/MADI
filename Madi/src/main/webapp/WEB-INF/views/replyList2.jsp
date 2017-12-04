<%@page import="com.spring.madi.BoardReplyVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<BoardReplyVO> replyList = (ArrayList<BoardReplyVO>) request.getAttribute("replyList");
%>

<%
	for (int j = 0; j < replyList.size(); j++) {
		BoardReplyVO rep = replyList.get(j);
%>
		<div class="w3-col m12">
			<div class="w3-col m12 w3-white w3-margin">
				<img src="<%=rep.getUser_img()%>" alt="Avatar"
					class="w3-left w3-circle w3-margin-right"
					style="width: 60px; height: 60px;"> <span><b><%=rep.getUser_id()%></b></span>
				<p>
					<%=rep.getRep_content()%>
				</p>
			</div>
		</div>
<%
	}
%>

