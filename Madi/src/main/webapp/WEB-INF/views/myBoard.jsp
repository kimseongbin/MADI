<%@page import="com.spring.madi.BoardReplyVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.spring.madi.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="com.spring.madi.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	//Header에 들어갈 기본 정보 불러오기
	MemberVO memberVO= (MemberVO)request.getAttribute("memberVO");
	// 나의 게시판 목록
	List<BoardVO> myBoardList= (ArrayList<BoardVO>)request.getAttribute("myBoardList");

%>
					<%
					for (int i = 0; i < myBoardList.size(); i++) {
						BoardVO myboard = myBoardList.get(i);
    				%>
					<div class="w3-container w3-card w3-white w3-round w3-margin">
						<br> <img src="<%=myboard.getUser_img()%>" alt="Avatar"
							class="w3-left w3-circle w3-margin-right" style="width: 60px">
						<span class="w3-right w3-opacity"><%=myboard.getBoard_time()%></span>
						<h4><%=myboard.getUser_id()%></h4>
						<br>
						<hr class="w3-clear">
						<img src="<%=myboard.getBoard_img()%>" style="width: 50%"
							class="w3-margin-bottom">
						<p>
							좋아요 :
							<%=myboard.getBoard_like()%></p>
						<p><%=myboard.getBoard_summry()%></p>
						<button type="button"
							class="w3-button w3-theme-d1 w3-margin-bottom" 
							onclick="updateBoardLike('<%=myboard.getBoard_num()%>', '<%=memberVO.getUser_id()%>', '<%=i%>')">
							<i class="fa fa-thumbs-up"></i>  Like
						</button>
						<button type="button"
							class="w3-button w3-theme-d2 w3-margin-bottom"
							onclick="myFunction('comment<%=myboard.getBoard_num()%>')">
							<i class="fa fa-comment"></i>  Comment
						</button>

						<!-- 댓글창 -->
						<div id="comment<%=myboard.getBoard_num()%>"
							class="w3-hide w3-container">
							<%
							List<BoardReplyVO> replyList = myboard.getBoardReplyList();
								for (int j = 0; j < replyList.size(); j++) {
								BoardReplyVO reply = replyList.get(j);
       						%>
							<p style="font-size: 27px; margin-bottom: 0px; margin-top: 0px;">
								<img src="<%=reply.getUser_img()%>" class="w3-circle"
									style="width: 40px;" alt="Avatar">
								<%=reply.getUser_id()%>
								:
								<%=reply.getRep_content()%></p>
							<%
								}//reply 끝
							%>
						</div>

					</div>
				<%
		    		}
				//게시글 for문 끝
		    %>