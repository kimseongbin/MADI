<%@page import="java.util.ArrayList"%>
<%@page import="com.spring.madi.BoardReplyVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<BoardReplyVO> replyList = (ArrayList<BoardReplyVO>) request.getAttribute("replyList");
%>
<%
	for (int i = 0; i < replyList.size(); i++) {
		BoardReplyVO boardReplyVO = replyList.get(i);
%>
		<div class="reply">
			<div class="col-sm-2 text-center">
				<img src="<%=boardReplyVO.getUser_img()%>" class="img-circle" height="65" width="65" alt="<%=boardReplyVO.getUser_id()%>">
			</div>
			<div class="col-sm-10">
				<h4>
					<%=boardReplyVO.getUser_id()%>
					<small><%=boardReplyVO.getRep_date()%></small>
				</h4>
				<p><%=boardReplyVO.getRep_content()%></p>
				<br>
			</div>
		</div>
<%
	}
%>
