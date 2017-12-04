<%@page import="com.spring.madi.RecipeIrdntVO"%>
<%@page import="com.spring.madi.RecipeProcessVO"%>
<%@page import="java.util.List"%>
<%@page import="com.spring.madi.RecipeVO"%>
<%@page import="com.spring.madi.MemberBoxVO"%>
<%@page import="com.spring.madi.MemberVO"%>
<%@page import="com.spring.madi.NotificationVO"%>
<%@page import="com.spring.madi.MessageVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 메시지 리시트 받아오기 
	ArrayList<MessageVO> messageList = (ArrayList<MessageVO>) request.getAttribute("messageList");
	// 알림 리스트 받아오기
	ArrayList<NotificationVO> notificationList = (ArrayList<NotificationVO>) request.getAttribute("notificationList");
	// 내 기본 정보 받아오기
	MemberVO memberVO = (MemberVO) request.getAttribute("MemberVO");
	// 내 냉장고 목록 불러오기
	ArrayList<MemberBoxVO> myIrdntList = (ArrayList<MemberBoxVO>) request.getAttribute("myIrdntList");
	
	// 검색결과 recipe
	ArrayList<RecipeVO> recipe = (ArrayList<RecipeVO>) request.getAttribute("recipe");
	
	//INCLUDE JSP 문서와 객체 공유
	request.setAttribute("memberVO", memberVO);
	request.setAttribute("notificationList", notificationList);
	request.setAttribute("messageList", messageList);
	request.setAttribute("myIrdntList", myIrdntList);
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마디 - 재료로 요리하다</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
/* 검색결과를 보여줄 메인 페이지 */
.page-content {
	margin-left: 1%;
	margin-right: 27%;
	margin-bottom: 1%;
	padding-top: 15px;
	padding-left: 15px;
	padding-right: 10%;
	padding-bottom: 15px;
}
/* tab 메뉴 */
.bar-tabs {
	margin-left: 1%;
	margin-right: 26%;
}
/* 이미지 */	
.mobile-img img {
	padding:16px;
	width:20%;
}
/* Hide the carousel text when the screen is less than 600 pixels wide */
@media ( max-width : 600px) {
	.right-side {
		display: none;
	}
	.page-content {
		margin: 0 auto;
	}
	.mobile-img img {
		padding:5px;
		width:50%;
	}
}
</style>
<script>
	/* 전체 탭 */
	function openDefault(e, tab) {
		document.getElementById(tab).style.display = "block";
		document.getElementById("sideBar").style.display = "block";
		document.getElementById("image").style.display = "none";
		document.getElementById("irdnt").style.display = "none";
		
		tablinks = document.getElementsByClassName("tablink");
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].className = tablinks[i].className.replace(" w3-red", "");
		}
		e.className += " w3-red"
	}
	/* 이미지 텝 */
	function openImage(e, tab) {
		document.getElementById(tab).style.display = "block";
		document.getElementById("sideBar").style.display = "none";
		document.getElementById("default").style.display = "none";
		document.getElementById("irdnt").style.display = "none";
		
		tablinks = document.getElementsByClassName("tablink");
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].className = tablinks[i].className.replace(" w3-red", "");
		}
		e.className += " w3-red"
	}
	/* 재료 텝 */
	function openIrdnt(e, tab) {
		document.getElementById(tab).style.display = "block";
		document.getElementById("sideBar").style.display = "none";
		document.getElementById("image").style.display = "none";
		document.getElementById("default").style.display = "none";
		
		tablinks = document.getElementsByClassName("tablink");
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].className = tablinks[i].className.replace(" w3-red", "");
		}
		e.className += " w3-red"
	}
	/* 폼 mouserover 시 우측 sidebar 디스플레이 */
	function rightSideDp(recipe_id) {
		$.ajax({
			url: "./search.madi?side=active&recipe_id="+recipe_id,
			type: "GET",
			data: { 
				recipe_id: recipe_id
			},
			data: "text",
			success: function(data) {
				$("#sideBar").empty();
				$("#sideBar").append(data);
			}
		});
	}
</script>
</head>
<body>
	<div class="header">
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<!-- 우측 사이드 바 -->
	<!-- 검색 결과를 나타내는 폼에 hover시 해당 내용을 display 할 영역 -->
<%	
	RecipeVO activeSide = recipe.get(0);
%>
	<div class="right-side" id="sideBar">
		<div class="w3-sidebar w3-bar-block w3-card-4" style="width:25%; height: 700px; top:7%; right:0; margin-right: 1%; overflow:hidden;">
			<div class="w3-white w3-text-grey">
	        	<div class="w3-display-container">
	          		<img src="<%=activeSide.getImg_url() %>" style="width:100%; height:250px;" alt="Avatar" class="w3-grayscale-min">
	          		<div class="w3-display-bottomleft w3-container w3-text-white">
	            		<h2><%=activeSide.getRecipe_title() %></h2>
	          		</div>
	        	</div>
	        	<div class="w3-container" style="margin-top: 15px; overflow-y:scroll; height:450px;">
	          		<p><i class="fa fa-briefcase fa-fw w3-margin-right w3-large w3-text-teal"></i><%=activeSide.getNation_name() %>, <small><%=activeSide.getNation_code() %></small></p>
	          		<p><i class="fa fa-home fa-fw w3-margin-right w3-large w3-text-teal"></i><%=activeSide.getTy_name() %>, <small><%=activeSide.getTy_code() %></small></p>
	          		<p><i class="fa fa-envelope fa-fw w3-margin-right w3-large w3-text-teal"></i><%=activeSide.getCooking_time() %></p>
	          		<p><i class="fa fa-phone fa-fw w3-margin-right w3-large w3-text-teal"></i>재료 : <b><%=activeSide.getRecipeIrdnt().size() %></b> 가지</p>
	          		<hr>
		            <p class="w3-large"><b><i class="fa fa-asterisk fa-fw w3-margin-right w3-text-teal"></i>재료 목록</b></p>
		            <p>주재료</p>
		            <table class="w3-table w3-striped w3-white">
<%
		            ArrayList<RecipeIrdntVO> activeMainList = (ArrayList<RecipeIrdntVO>) activeSide.getRecipeIrdnt();
					for(int i = 0; i < activeMainList.size(); i++) {
						RecipeIrdntVO activeIrdnt = activeMainList.get(i);
						if(activeIrdnt.getIrdnt_ty_code() == 3060001) {
%>					
	          		<tr>
	          			<td><%=activeIrdnt.getIrdnt_name() %></td>
	          			<td><%=activeIrdnt.getIrdnt_cpcty() %></td>
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
					for(int i = 0; i < activeSubList.size(); i++) {
						RecipeIrdntVO activeIrdnt = activeSubList.get(i);
						if(activeIrdnt.getIrdnt_ty_code() == 3060002) {
%>					
	          		<tr>
	          			<td><%=activeIrdnt.getIrdnt_name() %></td>
	          			<td><%=activeIrdnt.getIrdnt_cpcty() %></td>
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
					for(int i = 0; i < activeSourceList.size(); i++) {
						RecipeIrdntVO activeIrdnt = activeSourceList.get(i);
						if(activeIrdnt.getIrdnt_ty_code() == 3060003) {
%>					
	          		<tr>
	          			<td><%=activeIrdnt.getIrdnt_name() %></td>
	          			<td><%=activeIrdnt.getIrdnt_cpcty() %></td>
	          		</tr>
<%
						}
					}
%>
					</table>
					
	        	</div>
      		</div>
      	<br>
		</div>
	</div>
		
	<!-- 검색 결과를 전체, 이미지, 재료순에 따라 보여주기 위한 텝 -->
	<div class="w3-bar bar-tabs">
    	<button class="w3-bar-item w3-button tablink w3-red" onclick="openDefault(this, 'default')">전체</button>
    	<button class="w3-bar-item w3-button tablink" onclick="openImage(this, 'image')">이미지</button>
    	<button class="w3-bar-item w3-button tablink" onclick="openIrdnt(this, 'irdnt')">재료</button>
  	</div>
  	<br/>
  	
	<!-- 메인 페이지 영역 -->
	<div id="default">
<%
	if(recipe.size() == 0) {	
%>

<%
	} else {
		
		for(int i = 0; i < recipe.size(); i++) {
			RecipeVO recipeVO = recipe.get(i);
%>
		<!-- <하나의 검색 결과를 나타낼 폼> -->
		<div class="w3-card-4 page-content">
			<!-- 입력 칸onmouseenter="rightSideDp('recipe_id');"-->
			<div class="w3-container-fluid" onmouseenter="rightSideDp('<%=recipeVO.getRecipe_id()%>');">
				<div class="w3-container">
					<h4 class="w3-opacity">
						<a href="./recipeDetail.do?recipe_id=<%=recipeVO.getRecipe_id() %>" ><b><%=recipeVO.getRecipe_title() %> By <%=recipeVO.getUser_id() %></b></a>
					</h4>
					<h6 class="w3-text-teal">
						<i class="fa fa-clock-o fa-fw w3-margin-right"></i><%=recipeVO.getTime() %>
					</h6>
					<p>
					<%=recipeVO.getRecipe_desc()%> &nbsp;&nbsp;
<%
					List<RecipeProcessVO> recipePro = (ArrayList<RecipeProcessVO>)recipeVO.getRecipeProcess();
					for(int j = 0; j < recipePro.size(); j++) {
%>
						<%=recipePro.get(j).getCooking_desc() %>
<%
					}
%>
					</p>
				</div>
			</div>
			<!-- 입력 칸 -->
		</div>
		<!-- <하나의 검색 결과를 나타낼 폼> -->
<%
		}
	}		
%>
	</div>	
	<!-- 메인 페이지 영역 -->
	
	<!-- 이미지 -->
	<div class="w3-container" id="image" style="display:none;">
		<!-- 이미지를 보여줄 하나의 폼 -->
		<div class="w3-container-fluid mobile-img">
			<img src="./resources/image/wallpaper.jpg" class="w3-border">
		</div>
		<!-- 이미지를 보여줄 하나의 폼 -->
	</div>
	<!-- 이미지 -->
	
	<!-- 재료 -->
	<div class="w3-container" id="irdnt">
	
	</div>
	<!-- 재료 -->
	
	<!-- 바텀 -->
	<footer class="container-fluid text-center" style="position:relative; bottom:0; width:100%;">
		<p>MADI</p>
	</footer>
	<!-- 바텀 -->
</body>
</html>