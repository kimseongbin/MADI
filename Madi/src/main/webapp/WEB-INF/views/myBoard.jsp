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
					for(int i=0; i<myBoardList.size(); i++) {
						BoardVO myBoard= myBoardList.get(i);
				%>
				<div class="well content_color">
					<div class="row">
						<div class="col-sm-4" style="font-size: 16px; text-align: left;">
						<!-- profile -->
							<img src="<%=myBoard.getUser_img()%>" class="img-circle" height="40" width="40">&nbsp;<a
								href="#"><strong><%=myBoard.getUser_id()%></strong></a>
						</div>
						<!-- title -->
						<div class="col-sm-8" style="text-align: left;">
							<p>
								<strong style="font-size:25px;"><%=myBoard.getBoard_title()%></strong>
							</p>
						</div>
					</div>
					<!-- image and date, like-->
					<img src="<%=myBoard.getBoard_img()%>" style="width:40%; height:40%;" class="img-squere"><br>
					<div class="row">
						<table style="border-spacing: 20px; font-size: 17px;">
							<tr>
								<td>
									<p>
										<%=myBoard.getBoard_time()%>
									</p>
								</td>
								<td><span class="glyphicon glyphicon-heart"
									style="padding-bottom: 14px;"></span></td>
								<td>
									<p style="padding-bottom: 3px;">
										<em class="boardLike"><%=myBoard.getBoard_like()%></em>
									</p>
								</td>
							</tr>
						</table>
					</div>
					<!-- 글 내용 -->
					<div class="row">
						<p style="font-size: 17px;"><%=myBoard.getBoard_summry()%></p>
					</div>
					<br>
					<br>
					<!-- Icon -->
					<div class="row">
						<div class="pull-left">
							<form>
							<ul class="ul fol2" id="updateBoardLike_modal">
								<li class="li fol3" >
									<span style="cursor: pointer;" 
									class="glyphicon glyphicon-comment icon-size"
									data-toggle="collapse" data-target="#comment<%=myBoard.getBoard_num()%>">
									 댓글보기</span>&emsp;
								</li>
								<li class="li fol3">
									<span style="cursor: pointer"  
										class="glyphicon glyphicon-heart icon-size"
										onclick="updateBoardLike('<%=myBoard.getBoard_num()%>', '<%=memberVO.getUser_id()%>', '<%=i%>')">
									 좋아요</span> &emsp;
								</li>
								<li class="li fol3">
									<span style="cursor: pointer" 
									 class="glyphicon glyphicon-share-alt icon-size">
									 공유하기</span>&emsp; 
								</li>
							</ul>
							</form>
						</div>
					</div> 
				<!-- 댓글 comment -->
					<div id="comment<%=myBoard.getBoard_num()%>" class="collapse">
						<ul class="list-group" style="text-align: left;">
						<%
							List<BoardReplyVO> replyList = myBoard.getBoardReplyList(); 
							for(int j = 0; j < replyList.size(); j++) {
								BoardReplyVO reply= replyList.get(j);
						%>
							<li class="list-group-item">
								<img src="<%=reply.getUser_img()%>"
								class="img-circle" height="30" width="30">&nbsp; <a
								href="#"><strong><%=reply.getUser_id()%></strong></a> &emsp;
								<strong><%=reply.getRep_content()%></strong>
							</li>
						<%
						} // for replyList
						%>
						</ul>
					</div>
				<!-- 본문 글 끝 -->
				</div>
				<%
				} // for allBoardList
				%>