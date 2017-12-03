<%@page import="com.spring.madi.RecipeProcessVO"%>
<%@page import="com.spring.madi.RecipeIrdntVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.spring.madi.RecipeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	RecipeVO activeSide = (RecipeVO) request.getAttribute("recipeVO");
%>

<div class="w3-sidebar w3-bar-block w3-card-4"
	style="width: 25%; height: auto; top: 7%; right: 0; margin-right: 1%;">
	<div class="w3-white w3-text-grey">
		<div class="w3-display-container">
			<img src="<%=activeSide.getImg_url()%>" style="width: 100%"
				alt="Avatar" class="w3-grayscale-min">
			<div class="w3-display-bottomleft w3-container w3-text-white">
				<h2><%=activeSide.getRecipe_title()%></h2>
			</div>
		</div>
		<br />
		<div class="w3-container">
			<p>
				<i
					class="fa fa-briefcase fa-fw w3-margin-right w3-large w3-text-teal"></i><%=activeSide.getNation_name()%>,
				<small><%=activeSide.getNation_code()%></small>
			</p>
			<p>
				<i class="fa fa-home fa-fw w3-margin-right w3-large w3-text-teal"></i><%=activeSide.getTy_name()%>,
				<small><%=activeSide.getTy_name()%></small>
			</p>
			<p>
				<i
					class="fa fa-envelope fa-fw w3-margin-right w3-large w3-text-teal"></i><%=activeSide.getCooking_time()%></p>
			<p>
				<i class="fa fa-phone fa-fw w3-margin-right w3-large w3-text-teal"></i>재료
				: <b><%=activeSide.getRecipeIrdnt().size()%></b> 가지
			</p>
			<hr>
			<p class="w3-large">
				<b><i class="fa fa-asterisk fa-fw w3-margin-right w3-text-teal"></i>재료
					목록</b>
			</p>
			<p>주재료</p>
			<table class="w3-table w3-striped w3-white">
				<%
					ArrayList<RecipeIrdntVO> activeMainList = (ArrayList<RecipeIrdntVO>) activeSide.getRecipeIrdnt();
					for (int i = 0; i < activeMainList.size(); i++) {
						RecipeIrdntVO activeIrdnt = activeMainList.get(i);
						if (activeIrdnt.getIrdnt_ty_code() == 3060001) {
				%>
				<tr>
					<td><%=activeIrdnt.getIrdnt_name()%></td>
					<td><%=activeIrdnt.getIrdnt_cpcty()%></td>
				</tr>
				<%
					}
					}
				%>
			</table>

			<p>부재료</p>
			<table class="w3-table w3-striped w3-white">
				<%
					ArrayList<RecipeIrdntVO> activeSubList = (ArrayList<RecipeIrdntVO>) activeSide.getRecipeIrdnt();
					for (int i = 0; i < activeSubList.size(); i++) {
						RecipeIrdntVO activeIrdnt = activeSubList.get(i);
						if (activeIrdnt.getIrdnt_ty_code() == 3060002) {
				%>
				<tr>
					<td><%=activeIrdnt.getIrdnt_name()%></td>
					<td><%=activeIrdnt.getIrdnt_cpcty()%></td>
				</tr>
				<%
					}
					}
				%>
			</table>

			<p>양념</p>
			<table class="w3-table w3-striped w3-white">
				<%
					ArrayList<RecipeIrdntVO> activeSourceList = (ArrayList<RecipeIrdntVO>) activeSide.getRecipeIrdnt();
					for (int i = 0; i < activeSourceList.size(); i++) {
						RecipeIrdntVO activeIrdnt = activeSourceList.get(i);
						if (activeIrdnt.getIrdnt_ty_code() == 3060003) {
				%>
				<tr>
					<td><%=activeIrdnt.getIrdnt_name()%></td>
					<td><%=activeIrdnt.getIrdnt_cpcty()%></td>
				</tr>
				<%
					}
					}
				%>
			</table>

			<br>

			<p class="w3-large w3-text-theme">
				<b><i class="fa fa-globe fa-fw w3-margin-right w3-text-teal"></i>요리
					과정</b>
			</p>
			<%
				ArrayList<RecipeProcessVO> activeProList = (ArrayList<RecipeProcessVO>) activeSide.getRecipeProcess();
				for (int i = 0; i < activeProList.size(); i++) {
					RecipeProcessVO activePro = activeProList.get(i);
			%>
			<p>
				과정&nbsp;<%=activePro.getCooking_no()%></p>
			<div class="w3-light-grey w3-card-4">
				<%=activePro.getCooking_desc()%>
			</div>
			<%
				}
			%>
			<br>
		</div>
	</div>
	<br>
</div>