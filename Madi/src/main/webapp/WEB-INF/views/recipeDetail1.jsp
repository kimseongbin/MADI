<%@page import="java.util.ArrayList"%>
<%@page import="com.spring.madi.BoardReplyVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%List<BoardReplyVO> replyList= (ArrayList<BoardReplyVO>)request.getAttribute("replyList");  %>    
				<%
					for(int i = 0; i <replyList.size(); i++){
						BoardReplyVO reply = replyList.get(i);	
					
					
				%>
				<div class="container-fluid input-group"
					style="padding-right: 0; padding-left: 0; margin: 0">
					
					<div class="col-xs-2 col-md-2 thumbnail"
						style="padding-right: 0; padding-left: 0;">
						<img class="img-circle" src="<%=reply.getUser_id() %>"
							
							style="width: 100%;">
					</div>
					<div class="col-xs-10 col-md-10">
						
						<input type="hidden" value="<%= reply.getBoard_num()%>"> 
						<p>
						
						<%=reply.getRep_content() %>
						
						
						
						</p>
						
					</div>
				</div>
				<%
					}
							    
				%>
				
				<hr>
				

				<div class="col-xs-0 col-md-1"></div>
				
				
