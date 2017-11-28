<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.spring.madi.MemberBoxVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	List<MemberBoxVO> memberBoxList =(ArrayList<MemberBoxVO>)request.getAttribute("memberBoxVO");
%>
<%
	for (int i= 0; i< memberBoxList.size(); i++) {
		MemberBoxVO memberBoxVO= memberBoxList.get(i);
%>
		<%
		if(memberBoxVO == null) { 
		%>
			<!-- 빈칸 -->
		<%} else {%>
			<li class="li hori">
				<a href="#" class="text-muted">
				<img src="<%=request.getParameter("src")%>">
				<input type="hidden" value="<%=memberBoxVO.getMy_irdnt()%>">
					<strong><%=memberBoxVO.getMy_irdnt()%></strong>
				</a>
			</li>
<%
		}
	}
%>