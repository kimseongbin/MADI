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
	for (int t= 0; t< memberBoxList.size(); t++) {
		MemberBoxVO myIrdnt= memberBoxList.get(t);
%>
			<li class="li hori">
				<button type="button" class="btn btn-danger-sm updateIrdnt">
					<%=myIrdnt.getMy_irdnt()%>
				</button>
			</li>
<%

	}
%>