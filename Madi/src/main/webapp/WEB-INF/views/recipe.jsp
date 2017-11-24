<%@page import="com.spring.madi.NotificationVO"%>
<%@page import="com.spring.madi.MemberVO"%>
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
	//INCLUDE JSP 문서와 객체 공유
	request.setAttribute("memberVO", memberVO);
	request.setAttribute("notificationList", notificationList);
	request.setAttribute("messageList", messageList);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
.carousel-inner img {
	width: 100%; /* Set width to 100% */
	min-height: 470px;
}

/* Hide the carousel text when the screen is less than 600 pixels wide */
@media ( max-width : 600px) {
	.carousel-caption {
		display: none;
	}
}
</style>
<script>
	function addCategory(element) {
		var category_selected_form = document
				.getElementById("category_selected_form");
		if (element.style.background == "blue") {
			element.style.background = "";
			document.getElementById(element.textContent).remove();
			getRecipeByTy_Code();

		} else {
			element.style.background = "blue";
			category_selected_form.innerHTML += "<button id='"
					+ element.textContent
					+ "' class='btn btn-default' style='border:none; outline:none;' onclick='removeCategory(this);'>"
					+ element.textContent
					+ "<span class='glyphicon glyphicon-remove'>"
					+ "<input type='hidden' name='ty_code' value='"+element.value+"'/>"
					+ "</buton>";
			getRecipeByTy_Code();
		}
	}
	function removeCategory(element) {
		var category_selected_form = document
				.getElementById("category_selected_form");
		element.remove();
		document.getElementsByName(element.textContent)[0].style.background = "";
		getRecipeByTy_Code();
	}
	function getRecipeByTy_Code() {
		var param = $('#category_selected_form').serialize();
		alert(param);
		$.ajax({
			url : "./recipe.do?sb=ty_code",
			type : "POST",
			data : param,
			dataType : "text",
			success : function(data) {
				alert(data);
				$("#category_List_Area").empty();
				$("#category_List_Area").append(data);
			},
		});
	}
	function searchRecipesByIngredients() {
		var param = $('#search_form').serialize();
		alert(param);
		$.ajax({
			url : "./recipe.do?sb=irdnt",
			type : "POST",
			data : param,
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			dataType : "text",
			success : function(data) {
				alert(data);
				$("#search_Result_Area").empty();
				$("#search_Result_Area").append(data);
			}
		});
	}
	function searchRecipesByMybox() {
		$.ajax({
			url : "./recipe.do?sb=mybox",
			type : "POST",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			dataType : "text",
			success : function(data) {
				$("#search_Result_Area").empty();
				$("#search_Result_Area").append(data);
			}
		});
	}
</script>
</head>
<body>
	<!-- HEADER -->
	<div class="header">
		<jsp:include page="header.jsp"></jsp:include>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-sm-8">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img src="https://placehold.it/800x400?text=IMAGE" alt="Image">
							<div class="carousel-caption">
								<h3>Sell $</h3>
								<p>Money Money.</p>
							</div>
						</div>

						<div class="item">
							<img src="https://placehold.it/800x400?text=Another Image Maybe"
								alt="Image">
							<div class="carousel-caption">
								<h3>More Sell $</h3>
								<p>Lorem ipsum...</p>
							</div>
						</div>
					</div>

					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel" role="button"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel" role="button"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="panel" style="padding-left: 10px;">
					<h3>레시피 검색</h3>
					<p class="text-muted">재료 별 레시피 검색하기, 주로 쓰일 재료에 따라 레시피를 검색해주세요.
					<p>
				</div>
				<hr />
				<form id="search_form" name="search_form">
					<div class="form-group">
						<label for="main">주재료</label> <input type="text"
							class="form-control" id="main" placeholder="/베이컨/계란/밀가루/브로콜리"
							name="main" />
					</div>
					<div class="form-group">
						<label for="sub">부재료</label> <input type="text"
							class="form-control" id="sub" placeholder="/베이컨/계란/밀가루/양파"
							name="sub" />
					</div>
					<div class="form-group">
						<label for="source">양념</label> <input type="text"
							class="form-control" id="source" placeholder="/소금/올리브유/후추가루"
							name="source" />
					</div>
				</form>
				<hr />
				<button class="btn btn-default btn-block"
					onclick="searchRecipesByIngredients();">레시피 검색</button>
				<button class="btn btn-default btn-block"
					onclick="searchRecipesByMybox();">내 냉장고로 검색</button>
			</div>
		</div>
		<hr>
	</div>

	<div class="container text-center">
		<h3>마디가 추천하는 당신의 레시피</h3>
		<br /> <span class="glyphicon glyphicon-refresh moreOfIrdnt"
			style="font-size: 35px; cursor: pointer;"></span> <br />
		<hr />
		<div class="row" id="search_Result_Area">
			<h1>재룐를 입력해 레시피를 조회해주세요.</h1>
			<hr>
		</div>
	</div>
	<div class="container">
		<div class="container-fluid text-center">
			<div class="container-fluid">
				<h3>레시피 목록</h3>
			</div>
			<br>
			<div class="row" style="padding: 0;">
				<div class="col-xs-12 col-sm-6" style="padding: 0;">
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="밥" class="btn btn-default btn-block" value="3010001"
							onclick="addCategory(this);">밥</button>
					</div>
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="국" class="btn btn-default btn-block" value="3010002"
							onclick="addCategory(this);">국</button>
					</div>
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="조림" class="btn btn-default btn-block"
							value="3010003" onclick="addCategory(this);">조림</button>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6" style="padding: 0;">
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="구이" class="btn btn-default btn-block"
							value="3010004" onclick="addCategory(this);">구이</button>
					</div>
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="튀김/커틀릿" class="btn btn-default btn-block"
							value="3010005" onclick="addCategory(this);">튀김/커틀릿</button>
					</div>
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="찜" class="btn btn-default btn-block" value="3010006"
							onclick="addCategory(this);">찜</button>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6" style="padding: 0;">
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="나물/생채/샐러드" class="btn btn-default btn-block"
							value="3010007" onclick="addCategory(this);">나물/생채/샐러드</button>
					</div>
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="밑반찬/김치" class="btn btn-default btn-block"
							value="3010008" onclick="addCategory(this);">밑반찬/김치</button>
					</div>
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="양식" class="btn btn-default btn-block"
							value="3010009" onclick="addCategory(this);">양식</button>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6" style="padding: 0;">
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="도시락/간식" class="btn btn-default btn-block"
							value="3010010" onclick="addCategory(this);">도시락/간식</button>
					</div>
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="양념장" class="btn btn-default btn-block"
							value="3010012" onclick="addCategory(this);">양념장</button>
					</div>
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="떡/한과" class="btn btn-default btn-block"
							value="3010013" onclick="addCategory(this);">떡/한과</button>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6" style="padding: 0;">
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="빵/과자" class="btn btn-default btn-block"
							value="3010014" onclick="addCategory(this);">빵/과자</button>
					</div>
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="음료" class="btn btn-default btn-block"
							value="3010015" onclick="addCategory(this);">음료</button>
					</div>
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="만두/면류" class="btn btn-default btn-block"
							value="3010016" onclick="addCategory(this);">만두/면류</button>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6" style="padding: 0;">
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="찌개/전골/스튜" class="btn btn-default btn-block"
							value="3010017" onclick="addCategory(this);">찌개/전골/스튜</button>
					</div>
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="부침" class="btn btn-default btn-block"
							value="3010018" onclick="addCategory(this);">부침</button>
					</div>
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="그랑조/리조또" class="btn btn-default btn-block"
							value="3010019" onclick="addCategory(this);">그랑조/리조또</button>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6" style="padding: 0;">
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="샌드위치/햄버거" class="btn btn-default btn-block"
							value="3010020" onclick="addCategory(this);">샌드위치/햄버거</button>
					</div>
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="피자" class="btn btn-default btn-block"
							value="3010021" onclick="addCategory(this);">피자</button>
					</div>
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="볶음" class="btn btn-default btn-block"
							value="3010022" onclick="addCategory(this);">볶음</button>
					</div>
				</div>
			</div>
		</div>
		<br>
		<div class="container text-center">
			<div class="row">
				<div class="col-xs-3 col-sm-3 panel panel-default"
					style="padding: 0;">결과</div>
				<div id="category_selected"
					class="col-xs-9 col-sm-9 panel panel-default text-left"
					style="padding-left: 20px;">
					<form id="category_selected_form" name="category_selected_form">

					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="container text-center">
		<div class="row" id="category_List_Area">
			<h1>카테고리를 선택해 레시피를 조회해주세요.</h1>
			<!-- <div class="col-sm-3"></div>
		<div class="col-sm-3"></div>
		<div class="col-sm-3"></div>
		<div class="col-sm-3"></div>
		
		<div class="col-sm-3"></div>
		<div class="col-sm-3"></div>
		<div class="col-sm-3"></div>
		<div class="col-sm-3"></div> -->
		</div>
	</div>
	<footer class="container-fluid text-center">
		<p>Footer Text</p>
	</footer>
</body>
</html>