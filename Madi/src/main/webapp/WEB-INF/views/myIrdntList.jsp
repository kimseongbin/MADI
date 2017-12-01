<%@page import="com.spring.madi.MemberBoxVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<MemberBoxVO> myIrdntList = (ArrayList<MemberBoxVO>) request.getAttribute("myIrdntList");
%>
<%
	for(int i = 0; i < myIrdntList.size(); i++) {
		MemberBoxVO memberBoxVO = myIrdntList.get(i);
%>
		<li class="li hori">
			<a href="#" class="text-muted">
			<img src="<%= %>" style="width: 35px; height: 35px;"><br>
			<input type="hidden" value="<%=memberBoxVO.getMy_irdnt()%>">
			<strong><%=memberBoxVO.getMy_irdnt() %></strong>
			</a>
		</li>
<%
	}
%>
