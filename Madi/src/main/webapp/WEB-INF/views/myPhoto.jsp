<%@page import="java.util.ArrayList"%>
<%@page import="com.spring.madi.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="com.spring.madi.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	MemberVO memberVO= (MemberVO)request.getAttribute("memberVO");
	List<BoardVO> myBoardList= (ArrayList<BoardVO>)request.getAttribute("myBoardList");
%>
<div>
	<ul class="ul hori2">
		<%
			for (int i = 0; i < myBoardList.size(); i++) {
				BoardVO photos = myBoardList.get(i);
		%>
		<li class="li hori2"><img src=<%=photos.getBoard_img()%>
			style="width: 100px; height: 100px; cursor: pointer;"
			onclick="location.href='./recipeDetail.do?recipe_id=' + <%=photos.getBoard_recipe_id()%>" />
		</li>
		<%
			}
		%>
	</ul>
</div>