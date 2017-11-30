<%@page import="java.util.ArrayList"%>
<%@page import="com.spring.madi.BoardReplyVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<BoardReplyVO> replyList = (ArrayList<BoardReplyVO>) request.getAttribute("replyList");
%>
<%
	for (int k = 0; k < replyList.size(); k++) {
		BoardReplyVO boardReplyVO = replyList.get(k);
%>
		<div class="reply">
			<div class="col-sm-2 text-center">
				<img src="<%=boardReplyVO.getUser_img() %>" class="img-circle" height="65" width="65" alt="<%=boardReplyVO.getUser_id()%>">
			</div>
			<div class="col-sm-9">
				<h4>
					<%=boardReplyVO.getUser_id() %> 
					<small>
						<%=boardReplyVO.getRep_date() %>
					</small>
				</h4>
				<p><%=boardReplyVO.getRep_content() %></p>
				<br>
			</div>
			<div class="col-sm-1">
				<button onclick="deletereply(this, '<%=boardReplyVO.getRep_date()%>', '<%=boardReplyVO.getUser_id()%>')" class="btn btn-default" style='border:none; outline:none;'>
					<span class='glyphicon glyphicon-remove'></span>
					<input type="hidden" name="rep_date" value="<%=boardReplyVO.getRep_date()%>"/>
					<input type="hidden" name="user_id" value="<%=boardReplyVO.getUser_id()%>"/>
				</button>
			</div>
		</div>
<%
	}
%>
