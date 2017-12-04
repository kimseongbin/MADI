<%@page import="com.spring.madi.MemberBoxVO"%>
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
	// 내 냉장고 목록 불러오기
	ArrayList<MemberBoxVO> myIrdntList = (ArrayList<MemberBoxVO>) request.getAttribute("myIrdntList");
	//INCLUDE JSP 문서와 객체 공유
	request.setAttribute("memberVO", memberVO);
	request.setAttribute("notificationList", notificationList);
	request.setAttribute("messageList", messageList);

	request.setAttribute("myIrdntList", myIrdntList);

%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>마디 - 재료로 요리하다</title>

<link href="https://fonts.googleapis.com/css?family=Pacifico" rel="stylesheet">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>

@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);


.carousel-inner {
	width: 100%; /* Set width to 100% */
	min-height: 500px;
	max-height: 500px;
	
}
.carousel-inner img {
	width: 100%; /* Set width to 100% */
	overflow: hidden;
}

/* Hide the carousel text when the screen is less than 600 pixels wide */
@media ( max-width : 600px) {
	.carousel-caption {
		display: none;
	}
}
.parallax {
    /* The image used */
    background-image: url('./resources/image/wallpaper.jpg');

    /* Full height */
    height: 100%; 

    /* Create the parallax scrolling effect */
    background-attachment: fixed;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    
}
.xrs {
	 background-image: url('./resources/image/background.gif');
	 background-repeat: no-repeat;
	 background-size: contain;
}
</style>
<script>

	function likeBoard(element, user_id, board_num, writer) {
		$.ajax({
			url: "./likeBoard.do",
			type: "POST",
			data: {
				user_id: user_id,
				board_num: board_num,
				writer: writer
			},
			success: function(data) {
				if(data == 1) {
					document.getElementById("no").innerHTML = Number(document.getElementById("no").innerHTML) + 1;
					$(element).find("img").attr("src","./resources/image/Heart_Outline_96px.png");
				} else {
					$(element).find("img").attr("src","./resources/image/Heart_96px.png");
				}
			}
		});
	}
	function addCategory(element) {
		var category_selected_form = document
				.getElementById("category_selected_form");
		if (element.style.background == "white") {
			element.style.background = "";
			document.getElementById(element.textContent).remove();
			getRecipeByTy_Code();

		} else {
			element.style.background = "white";
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
		$.ajax({
			url : "./recipe.do?sb=ty_code",
			type : "POST",
			data : param,
			dataType : "text",
			success : function(data) {
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
	function refresh() {
		var myBoxList = document.getElementsByClassName("myBoxList");
		var IrdntResult = document.getElementsByClassName("IrdntResult");
		
		if(myBoxList.length != 0) {
			for (var i = 0; i < myBoxList.length; i++) {
				if(myBoxList[i].style.display=="block") {
					if(i == myBoxList.length - 1) {
						myBoxList[i].style.display="none";
						myBoxList[0].style.display="block";
						break;
					} else {
						myBoxList[i].style.display="none";
						myBoxList[i+1].style.display="block";
						break;	
					}
				}
			}
		} else if(IrdntResult.length != 0){
			for (var i = 0; i < IrdntResult.length; i++) {
				if(IrdntResult[i].style.display=="block") {
					if(i == IrdntResult.length - 1) {
						IrdntResult[i].style.display="none";
						IrdntResult[0].style.display="block";
						break;
					} else {
						IrdntResult[i].style.display="none";
						IrdntResult[i+1].style.display="block";	
						break;
					}
				}
			}	
		}
	}
</script>
</head>
<body style="background-color: #FCFAF5" class="xrs">
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
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img src="./resources/image/amy-treasure-69666.jpg" alt="Image">
<!-- 							<div class="carousel-caption">
								<h3>Sell $</h3>
								<p>Money Money.</p>
							</div> -->
						</div>

						<div class="item">
							<img src="./resources/image/berry.jpg"
								alt="Image">
<!-- 							<div class="carousel-caption">
								<h3>More Sell $</h3>
								<p>Lorem ipsum...</p>
							</div> -->
						</div>						
						<div class="item">
							<img src="./resources/image/carissa-gan-76304.jpg"
								alt="Image">
<!-- 							<div class="carousel-caption">
								<h3>More Sell $</h3>
								<p>Lorem ipsum...</p>
							</div> -->
						</div>
					</div>

					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"> 
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> 
					<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"> 
						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<div class="col-sm-4 panel panel-default w3-animate-right" style="padding-bottom: 15px; ">
				<div style="padding-left: 10px;">
					<h3 class="madi_subtitle" style="font-family: 'Hanna', serif;">레시피 검색</h3>
					<p class="text-muted madi_content" style="font-family: 'Hanna', serif;">재료 별 레시피 검색하기, <br/>주로 쓰일 재료에 따라 레시피를 검색해주세요.
					<p>
				</div>
				<hr />
				<form id="search_form" name="search_form">
					<div class="form-group madi_content">
						<label for="main" style="font-family: 'Hanna', serif;">주재료</label> <input type="text"
							class="form-control" id="main" placeholder="예) /베이컨/계란/밀가루/브로콜리"
							name="main" />
					</div>
					<div class="form-group madi_content">
						<label for="sub" style="font-family: 'Hanna', serif;">부재료</label> <input type="text"
							class="form-control" id="sub" placeholder="예) /베이컨/계란/밀가루/양파"
							name="sub" />
					</div>
					<div class="form-group madi_content">
						<label for="source" style="font-family: 'Hanna', serif;">양념</label> <input type="text"
							class="form-control" id="source" placeholder="예) /소금/올리브유/후추가루"
							name="source" />
					</div>
				</form>
				<hr />
				<button class="btn btn-default btn-block madi_content"
					onclick="searchRecipesByIngredients();" style="font-family: 'Hanna', serif;">레시피 검색</button>
				<button class="btn btn-default btn-block madi_content"
					onclick="searchRecipesByMybox();" style="font-family: 'Hanna', serif;">내 냉장고로 검색</button>
			</div>
		</div>
	</div>

	<div class="container-fluid text-center parallax w3-grayscale-min">
		<div class="container">
		<font color="#DE4F4F"><h3 class="madi_content" style="margin-top: 120px;font-size: 34px; font-weight: bold;"><font class="madi_cc">Madi</font>가<br/>추천하는 당신의 <font class="madi_cc">Recipe</font></h3></font>
		<br /> 
		<span id="refresh" onclick="refresh();" class="glyphicon glyphicon-refresh moreOfIrdnt" style="font-size: 35px; cursor: pointer; color:#DE4F4F;"></span>
		<script>
			$("#refresh").mouseenter(function() {
				$(this).attr("class","glyphicon glyphicon-refresh moreOfIrdnt w3-spin");
			});
			$("#refresh").mouseleave(function() {
				$(this).attr("class", "glyphicon glyphicon-refresh moreOfIrdnt");
			});
		</script> 
		<br />
		<hr />
		<div class="row" id="search_Result_Area">
			<br/><br/>
			<font color="#DE4F4F" style="font-family: 'Hanna', serif;"><h1 class="madi_content">재료를 입력해 레시피를 조회해주세요.</h1></font>
			<br/><br/><br/>
		</div>
	</div>
	</div>
	<div class="container">
		<div class="container-fluid text-center">
			<div class="container-fluid">
				<h3 class="madi_content" style="font-family: 'Hanna', serif; font-size: 40px;">레시피 목록</h3>
			</div>
			<br>
			<div class="row madi_content" style="padding: 0;">
				<div class="col-xs-12 col-sm-6" style="padding: 0;">
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="밥" class="btn btn-default btn-block" value="3010001"
							onclick="addCategory(this);" style="font-family: 'Hanna', serif;">밥</button>
					</div>
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="국" class="btn btn-default btn-block" value="3010002"
							onclick="addCategory(this);" style="font-family: 'Hanna', serif;">국</button>
					</div>
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="조림" class="btn btn-default btn-block"
							value="3010003" onclick="addCategory(this);" style="font-family: 'Hanna', serif;">조림</button>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6" style="padding: 0;">
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="구이" class="btn btn-default btn-block"
							value="3010004" onclick="addCategory(this);" style="font-family: 'Hanna', serif;">구이</button>
					</div>
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="튀김/커틀릿" class="btn btn-default btn-block"
							value="3010005" onclick="addCategory(this);" style="font-family: 'Hanna', serif;">튀김/커틀릿</button>
					</div>
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="찜" class="btn btn-default btn-block" value="3010006"
							onclick="addCategory(this);" style="font-family: 'Hanna', serif;">찜</button>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6" style="padding: 0;">
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="나물/생채/샐러드" class="btn btn-default btn-block"
							value="3010007" onclick="addCategory(this);" style="font-family: 'Hanna', serif;">나물/샐러드</button>
					</div>
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="밑반찬/김치" class="btn btn-default btn-block"
							value="3010008" onclick="addCategory(this);" style="font-family: 'Hanna', serif;">밑반찬/김치</button>
					</div>
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="양식" class="btn btn-default btn-block"
							value="3010009" onclick="addCategory(this);" style="font-family: 'Hanna', serif;">양식</button>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6" style="padding: 0;">
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="도시락/간식" class="btn btn-default btn-block"
							value="3010010" onclick="addCategory(this);" style="font-family: 'Hanna', serif;">도시락/간식</button>
					</div>
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="양념장" class="btn btn-default btn-block"
							value="3010012" onclick="addCategory(this);" style="font-family: 'Hanna', serif;">양념장</button>
					</div>
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="떡/한과" class="btn btn-default btn-block"
							value="3010013" onclick="addCategory(this);" style="font-family: 'Hanna', serif;">떡/한과</button>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6" style="padding: 0;">
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="빵/과자" class="btn btn-default btn-block"
							value="3010014" onclick="addCategory(this);" style="font-family: 'Hanna', serif;">빵/과자</button>
					</div>
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="음료" class="btn btn-default btn-block"
							value="3010015" onclick="addCategory(this);" style="font-family: 'Hanna', serif;">음료</button>
					</div>
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="만두/면류" class="btn btn-default btn-block"
							value="3010016" onclick="addCategory(this);" style="font-family: 'Hanna', serif;">만두/면류</button>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6" style="padding: 0;">
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="찌개/전골/스튜" class="btn btn-default btn-block"
							value="3010017" onclick="addCategory(this);" style="font-family: 'Hanna', serif;">찌개/전골/스튜</button>
					</div>
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="부침" class="btn btn-default btn-block"
							value="3010018" onclick="addCategory(this);" style="font-family: 'Hanna', serif;">부침</button>
					</div>
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="그랑조/리조또" class="btn btn-default btn-block"
							value="3010019" onclick="addCategory(this);" style="font-family: 'Hanna', serif;">그랑조/리조또</button>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6" style="padding: 0;">
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="샌드위치/햄버거" class="btn btn-default btn-block"
							value="3010020" onclick="addCategory(this);" style="font-family: 'Hanna', serif;">샌드위치/햄버거</button>
					</div>
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="피자" class="btn btn-default btn-block"
							value="3010021" onclick="addCategory(this);" style="font-family: 'Hanna', serif;">피자</button>
					</div>
					<div class="col-xs-4 col-sm-4" style="padding: 0;">
						<button name="볶음" class="btn btn-default btn-block"
							value="3010022" onclick="addCategory(this);" style="font-family: 'Hanna', serif;">볶음</button>
					</div>
				</div>
			</div>
		</div>
		<br>
		<div class="container text-center">
			<div class="row">
				<table class="madi_content">
					<tr height="56px">
						<th width="98px">
							<!-- <div class="col-xs-3 col-sm-3 panel panel-default madi_content" style="padding: 0; margin-top: 5px;"> -->
								결과
							<!-- </div> -->
						</th>
						<td>
						<!-- 	<div id="category_selected" class="col-xs-9 col-sm-9 panel panel-default text-left madi_content" style="padding-left: 20px;"> -->
								<form id="category_selected_form" name="category_selected_form" class="madi_content"></form>
							<!-- </div> -->
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="container text-center">
		<div class="row madi_content" id="category_List_Area">
			<br/><br/>
			<h1 class="madi_content" style="font-family: 'Hanna', serif;">카테고리를 선택해 레시피를 조회해주세요.</h1>
			<br/><br/>
		</div>
	</div>
	<footer class="container-fluid text-center">
		<p>Footer Text</p>
	</footer>
</body>
</html>