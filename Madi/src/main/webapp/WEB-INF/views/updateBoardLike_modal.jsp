<%@page import="java.util.ArrayList"%>
<%@page import="com.spring.madi.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
List<BoardVO> myBoardList= (ArrayList<BoardVO>)request.getAttribute("myBoardList");	

	for(int i=0; i<myBoardList.size(); i++) {
		BoardVO board= myBoardList.get(i);
%>
<div class="well content_color">
	<div class="row">
		<table style="border-spacing: 20px; font-size: 17px;">
			<tr>
				<td>
					<p>
						<%=board.getBoard_time()%>
					</p>
				</td>
				<td><span class="glyphicon glyphicon-heart"
					style="padding-bottom: 14px;"></span></td>
				<td>
					<p style="padding-bottom: 3px;" id="updateBoardLike_modal">
						<em><%=board.getBoard_like()%></em>
					</p>
				</td>
			</tr>
		</table>
	</div>
</div>
<!-- 댓글 comment -->
<%
System.out.println("m-u=" + board.getUser_id());
System.out.println("m-u=" + board.getBoard_num());
	} %>
<!-- 본문 글 끝 -->