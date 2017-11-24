<%@page import="com.spring.madi.MemberVO"%>
<%@page import="com.spring.madi.NotificationVO"%>
<%@page import="com.spring.madi.MessageVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.spring.madi.RecipeProcessVO"%>
<%@page import="java.util.List"%>
<%@page import="com.spring.madi.RecipeIrdntVO"%>
<%@page import="com.spring.madi.RecipeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	//내 정보 받아오기
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
	//메시지 리시트 받아오기 
	ArrayList<MessageVO> messageList = (ArrayList<MessageVO>) request.getAttribute("messageList");
	// 알림 리스트 받아오기
	ArrayList<NotificationVO> notificationList = (ArrayList<NotificationVO>) request.getAttribute("notificationList");
%>
<style>
footer {
	background-color: #DE4F4F;
	color: white;
	padding: 15px;
}
/* ICON Design */
.glyphicon {
	font-size: 18px;
}

.glyphicon.top {
	color: #000000;
}

.glyphicon.icon-size {
	font-size: 23px;
}
/* 헤더버튼 주변색 */
.btn.form {
	background-color: #DE4F4F;
}
/*헤더 색*/
.navbar.head {
	background-color: #DE4F4F;
}
/* 움직이는 헤더 */
.affix {
	top: 0;
	width: 100%;
	z-index: 9999 !important;
}

.affix+.container-fluid {
	padding-top: 70px;
}

/* Modal 크기 조절 */
.modal-dialog.modal-size {
	width: 300px;
	height: 600px;
	margin: 0;
	padding: 0;
}

.modal-content.modal-size {
	height: auto;
	min-height: 60%;
}

.modal.modal-center {
	text-align: center;
}
/* 모달 창이 모바일일 경우 바꿔주는 설정 */
@media screen and (min-width: 320px) {
	.modal.modal-center:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 100%;
	}
}

.modal-dialog.modal-center {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
}
/* 헤더 디자인 끝 */
.glyphicon.glyphicon-comment {
	color: #4C4C4C;
}

.glyphicon.glyphicon-heart {
	color: #DB005B;
}

.glyphicon.glyphicon-pencil {
	color: #3D3D3D;
}

.glyphicon.glyphicon-share-alt {
	color: #487BE1;
}
/*table 디자인*/
table {
	border-radius: 10px;
}
/* 테이블 간격 */
td {
	padding: 10px;
}
/*본문 배경색*/
.well.content_color {
	background-color: #FFFFFF;
}
/* 냉장고 재료들 리스트 정렬 */
.ul.hori {
	list-style: none;
	margin: 0;
	padding: 0;
}

.li.hori {
	margin: 0 0 0 0;
	padding: 15px;
	border: 0;
	float: left;
	font-size: 15px;
}
/* 팔로워, 팔로잉 리스트 정렬 */
.ul.fol {
	list-style: none;
	margin: 0;
	padding: 0;
}

.li.fol {
	margin: 0 0 0 0;
	padding: 15px;
	border: 0;
	float: left;
	font-size: 17px;
}
/* 모달 창이 모바일일 경우 바꿔주는 설정 */
@media screen and (min-width: 320px) {
	.modal.modal-center:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 100%;
	}
}

.modal-dialog.modal-center {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
}
/* 헤더 디자인 끝 */
</style>
<!-- 헤더 시작 -->
	<nav class="navbar navbar-default head" data-spy="affix" data-offset-top="197">
	<div class="container-fluid">
		<div class="navbar-header" style="padding-right: 30%;">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span><span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">MADI</a>
		</div>
		<!--검색 창 -->
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav navbar">
				<form class="navbar-form navbar-right" role="search">
					<div class="form-group input-group">
						<input type="text" class="form-control" placeholder="Search.."
							size="80%"> <span class="input-group-btn">
							<button class="btn btn-default" type="button">
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</span>
					</div>
				</form>
			</ul>
			<!--오른쪽 아이콘 -->
			<ul class="nav navbar-nav navbar-right">
				<!--home 아이콘 -->
				<li><button type="button" class="btn form"
						style="padding-top: 15px;">
						<span class="glyphicon glyphicon-home color"></span>
					</button>
				</li>
				<!-- 냉장고 아이콘 -->
				<li>
					<div style="padding-top: 9px;">
						<button type="button" class="btn form" data-toggle="modal"
							data-target="#fridge">
							<img src="./resources/food_icon/fridge.png" style="width:20px; height:20px;">
						</button>
				</li>
				<!-- profile 아이콘(누르면 mypage로 넘어간다) -->
				<li>
					<div class="dropdown" style="padding-top: 9px; padding-left: 2px;">
						<button class="btn dropdown-toggle form" type="button"
							data-toggle="dropdown">
							<span class="glyphicon glyphicon-user color"></span>
						</button>
						<ul class="dropdown-menu" style="text-align: center; background-color:#F6F6F6;">
							<li><img src="<%=memberVO.getUser_img()%>" class="img-circle" height="70"
								width="70" alt="Avatar"></li>
							<li>
								<h4>
									<p class="text-primary"><%=memberVO.getUser_id()%></p>
								</h4>
							</li>
							<li><a href="#">회원수정</a></li>
							<li><a href="#">로그아웃</a></li>
						</ul>
					</div>
				</li>
				<!--알림 아이콘 -->
				<li onclick="getNotification(this.value);" value="<%=memberVO.getUser_id()%>">
				<div style="padding-top: 9px; padding-left: 3px;">
						<button type="button" class="btn form" data-toggle="modal"
							data-target="#myModal">
							<span class="glyphicon glyphicon-envelope" style="padding-right:7px;"></span>
						</button>
				</li>
				<!--소셜(post로 넘어간다) 아이콘 -->
				<li>
					<button type="button" class="btn form" style="padding-top: 15px; padding-right:13px;">
						<span class="glyphicon glyphicon-globe color"></span>
					</button>
				</li>
			</ul>
		</div>
	</div>
	</nav>
<!-- 헤더 끝 -->
<!-- 알림 및 메시지 모달 -->
<!-- 냉장고 모달바 -->
<div class="modal fade" id="fridge" tableindex="-1" role="dialog"
	aria-labelledy="modallabel">
	<div class="modal-dialog modal-lg" role="document">
		<!-- content 시작 -->
		<div class="modal-content">
			<!-- 탭 -->
			<div class="modal-header" style="background-color: #DE4F4F;">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h3 style="color: #FFFFFF; text-align: center;">
					<img src="./resources/food_icon/fridge_white.png"
						style="width: 35px; height: 35px;"> <strong>냉장고 재료들</strong>
				</h3>
			</div>
			<div class="modal-body" style="text-align: center;">
				<div class="row">
					<!-- 왼쪽 카테고리 -->
					<div class="col-sm-2">
						<ul class="nav nav-stacked">
							<li class="active"><a data-toggle="tab" href="#menu1"> <strong>주재료</strong>
							</a></li>
							<li><a data-toggle="tab" href="#menu2"> <strong>부재료</strong>
							</a></li>
							<li><a data-toggle="tab" href="#menu3"> <strong>양념/소스</strong>
							</a></li>
						</ul>
					</div>
					<!--  가운데 리스트 나열 -->
					<div class="col-sm-8"
						style="background-color: #FFD8D8; text-align: center;">
						<div class="tab-content">
							<!-- 메뉴1 주재료 -->
							<div id="menu1" class="tab-pane fade in active">
								<ul class="ul hori">
									<li class="li hori"><a href="#" class="text-muted"> <img
											src="./resources/food_icon/bean.png"
											style="width: 35px; height: 35px;"><br> <strong>녹두</strong>
									</a></li>
									<li class="li hori"><a href="#" class="text-muted"> <img
											src="./resources/food_icon/bean.png"
											style="width: 35px; height: 35px;"><br> <strong>녹두</strong>
									</a></li>
								</ul>
							</div>
							<!-- 메뉴2 부재료-->
							<div id="menu2" class="tab-pane fade">
								<ul class="ul hori">
									<li class="li hori"><a href="#" class="text-muted"> <img
											src="./resources/food_icon/bean.png"
											style="width: 35px; height: 35px;"><br> <strong>녹두</strong>
									</a></li>
									<li class="li hori"><a href="#" class="text-muted"> <img
											src="./resources/food_icon/bean.png"
											style="width: 35px; height: 35px;"><br> <strong>녹두</strong>
									</a></li>
								</ul>
							</div>
							<!-- 메뉴3 양념/조미료 -->
							<div id="menu3" class="tab-pane fade">
								<ul class="ul hori">
									<li class="li hori"><a href="#" class="text-muted"> <img
											src="./resources/food_icon/bean.png"
											style="width: 35px; height: 35px;"><br> <strong>녹두</strong>
									</a></li>
									<li class="li hori"><a href="#" class="text-muted"> <img
											src="./resources/food_icon/bean.png"
											style="width: 35px; height: 35px;"><br> <strong>녹두</strong>
									</a></li>
								</ul>
							</div>
							<!-- 재료 입력 끝 -->
						</div>
					</div>
					<!-- 오른쪽 내가 가진 재료들? -->
					<div class="col-sm-2"></div>
				</div>
			</div>
			<!-- 내용 끝 -->
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
		<!-- 모달 content 끝 -->
	</div>
</div>
<!-- 메시지 및 알림 모달 -->
<!-- Modal bar -->
<div class="modal modal-center fade" id="myModal" tableindex="-1"
	role="dialog" aria-labelledby="modallabel">
	<div class="modal-dialog modal-size modal-center" role="document">
		<div class="modal-content modal-size">
			<!-- 알림, 메시지 탭 -->
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<ul class="nav nav-tabs">
					<li class="active"><a data-toggle="tab" href="#home">알림 <span
							class="badge" id="no"><%=notificationList.size() %></span>
					</a></li>
					<li onclick="getMessage(this.value);" value="<%=memberVO.getUser_id()%>"><a data-toggle="tab" href="#message">메시지 <span
							class="badge" id="me"><%=messageList.size() %></span></a></li>
				</ul>
			</div>
			<!-- Modal bar 내용들 -->
			<div class="modal-body">
				<div class="tab-content">
					<div id="home" class="tab-pane fade in active">
						<ul class="list-group">
							<div class="row">
								<div class="col-sm-2" style="padding-bottom: 5px;">
									<img src="./resources/profile/bird.jpg" class="img-circle"
										height="40" width="40" alt="Avatar">
								</div>
								<div class="col-sm-6">
									<h4 class="text-primary" style="">이글이글</h4>
								</div>
							</div>
							<!-- 알림 내용들 -->
							<div id="notificationList">
								<!-- 알림 내용들 -->
							</div>
						</ul>
					</div>
					<div id="message" class="tab-pane fade">
						<ul class="list-group">
							<div class="row">
								<div class="col-sm-2" style="padding-bottom: 5px;">
									<img src="./resources/profile/bird.jpg" class="img-circle"
										height="40" width="40" alt="Avatar">
								</div>
								<div class="col-sm-6">
									<h4 class="text-primary" style="">이글이글</h4>
								</div>
							</div>
							<!-- 메시지 내용들 -->
							<div id="messageList">
								<!-- ajax, 메시지 리스트 로드 영역 -->
							</div>
						</ul>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<script>
	function getMessage(value) {
		var user_id = value;
		$.ajax({
			url: "./message.do",
			type: "POST",
			data: {
				user_id : user_id
			},
			dataType: "text",
			success: function(data) {
				$("#messageList").empty();
				$("#messageList").append(data);
			}
		});
	}
	function getNotification(value) {
		var user_id = value;
		$.ajax({
			url: "./notification.do",
			type: "POST",
			data: {
				user_id : user_id
			},
			dataType: "text",
			success: function(data) {
				$("#notificationList").empty();
				$("#notificationList").append(data);
			}
		});
	}
</script>
