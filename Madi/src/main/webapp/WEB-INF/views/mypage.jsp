<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=divice-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
footer {
	background-color: #DE4F4F;
	color: white;
	padding: 15px;
}
/* ICON Design */
.glyphicon {
	font-size: 17px;
}

.glyphicon.top {
	color: #000000;
}

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

.glyphicon.icon-size {
	font-size: 25px;
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

/* Modal 크기 조절 
.modal-dialog.modal-size {
	width: 20%;
	height: 60%;
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

@media screen and (min-width: 768px) {
	.modal.modal-center:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 100%;
	}
}
@media screen and (min-width: 320px) {
	.modal-dialog.modal-size {
	width: 80%;
	height: 60%;
	margin: 0;
	padding: 0;
	}
.modal-dialog .follow-size .modal-center {
	width: 320px;
	height: 50%;
	margin: 0;
	padding: 0;
	}

}

.modal-dialog.modal-center {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
}
/* follow 모달 크기 조절 
.modal-dialog.follow-size {
	width: 23%;
	height: 50%;
	margin: 0;
	padding: 0;
}

.modal-content.follow-size {
	height: auto;
	min-height: 50%;
}
*/

/*table 디자인*/
table {
	border-radius: 10px;
}
/* 테이블 간격 */
td {
	padding: 5px;
}
</style>
</head>
<body style="background-color: #F6F6F6">
	<!-- 왼쪽 헤더 -->
	<nav class="navbar navbar-default head" data-spy="affix"
		data-offset-top="197">
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
				<!-- 냉장고 아이콘 -->
				<li>
					<div style="padding-top: 9px; padding-left: 5px;">
						<button type="button" class="btn form" data-toggle="modal"
							data-target="#fridge">
							<img src="./resources/food_icon/fridge.png" style="width:20px; height:20px;">
						</button>
						<div class="modal fade" id="fridge" tableindex="-1"
							role="dialog" aria-labelledby="modallabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<!-- 알림, 메시지 탭 -->
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>
									<!-- Modal bar 내용들 -->
									<div class="modal-body">
										<div class="tab-content">
											<div id="home" class="tab-pane fade in active">
												<ul class="list-group">
													<!-- ?? 내용들 -->
													<li>
                                                    </li>
												</ul>
											</div>
											<div id="message" class="tab-pane fade">
												<ul class="list-group">
													<!-- ?? 내용들 -->
													<li class="list-group-item">
                                                    </li>
												</ul>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</li>
				<!--home 아이콘 -->
				<li><button type="button" class="btn form"
						style="padding-top: 15px;">
						<span class="glyphicon glyphicon-home color"></span>
					</button>
				</li>
				<li>
					<div class="dropdown" style="padding-top: 9px; padding-left: 2px;">
						<button class="btn dropdown-toggle form" type="button"
							data-toggle="dropdown">
							<span class="glyphicon glyphicon-user color"></span>
						</button>
						<ul class="dropdown-menu" style="text-align: center">
							<li><img src="./resources/profile/bird.jpg" class="img-circle" height="70"
								width="70" alt="Avatar"></li>
							<li>
								<h4>
									<p class="text-primary">이글이글</p>
								</h4>
							</li>
							<li><a href="#">회원수정</a></li>
							<li><a href="#">로그아웃</a></li>
						</ul>
					</div>
				</li>
				<!--알림 아이콘 -->
				<li>
					<div style="padding-top: 9px; padding-left: 5px;">
						<button type="button" class="btn form" data-toggle="modal"
							data-target="#myModal">
							<span class="glyphicon glyphicon-align-justify color"></span>
						</button>
						<!-- Modal bar -->
						<div class="modal modal-center fade" id="myModal" tableindex="-1"
							role="dialog" aria-labelledby="modallabel">
							<div class="modal-dialog modal-size modal-center" role="document">
								<div class="modal-content modal-size">
									<!-- 알림, 메시지 탭 -->
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<ul class="nav nav-tabs">
											<li class="active"><a data-toggle="tab" href="#home">알림
													<span class="badge">New</span>
											</a></li>
											<li><a data-toggle="tab" href="#message">메시지 <span
													class="badge">New</span></a></li>
										</ul>
									</div>
									<!-- Modal bar 내용들 -->
									<div class="modal-body">
										<div class="tab-content">
											<div id="home" class="tab-pane fade in active">
												<ul class="list-group">
													<div class="row">
														<div class="col-sm-2" style="padding-bottom: 5px;">
															<img src="./resources/profile/bird.jpg" class="img-circle" height="40"
																width="40" alt="Avatar">
														</div>
														<div class="col-sm-4">
															<h4 class="text-primary" style="">이글이글</h4>
														</div>
													</div>
													<!-- 알림 내용들 -->
													<li class="list-group-item"><img src="./resources/profile/bird.jpg"
														class="img-circle" height="20" width="20" alt="Avatar">
														<a>AAA</a><em> 님이 ~~~ 게시물을 공유했습니다.</em></li>
													<li class="list-group-item"><img src="./resources/profile/bird.jpg"
														class="img-circle" height="20" width="20" alt="Avatar">
														<a>BBB</a><em> 님이 ~~~ 게시물을 공유했습니다.</em>
														<div class="row"></div></li>
													<li class="list-group-item"><img src="./resources/profile/bird.jpg"
														class="img-circle" height="20" width="20" alt="Avatar">
														<a>CCC</a> <em> 님이 ~~~ 게시물을 공유했습니다.</em>
														<div class="row"></div></li>
												</ul>
											</div>
											<div id="message" class="tab-pane fade">
												<ul class="list-group">
													<div class="row">
														<div class="col-sm-2" style="padding-bottom: 5px;">
															<img src="./resources/profile/bird.jpg" class="img-circle" height="40"
																width="40" alt="Avatar">
														</div>
														<div class="col-sm-4">
															<h4 class="text-primary" style="">이글이글</h4>
														</div>
													</div>
													<!-- 메시지 내용들 -->
													<li class="list-group-item"><strong>From </strong> <img
														src="./resources/profile/bird.jpg" class="img-circle" height="20" width="20"
														alt="Avatar"> <a>AAA</a> <strong>: "지금
															뭐하는지"</strong></li>
													<li class="list-group-item"><strong>From </strong> <img
														src="./resources/profile/bird.jpg" class="img-circle" height="20" width="20"
														alt="Avatar"> <a>BBB</a> <strong>: "먹을게 없다"</strong></li>
													<li class="list-group-item"><strong>From </strong> <img
														src="./resources/profile/bird.jpg" class="img-circle" height="20" width="20"
														alt="Avatar"> <a>CCC</a> <strong>: "사진"</strong></li>
												</ul>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</li>
				<!--소셜 아이콘 -->
				<li>
					<button type="button" class="btn form" style="padding-top: 15px;">
						<span class="glyphicon glyphicon-globe color"></span>
					</button>
				</li>
			</ul>
		</div>
	</div>
	</nav>
	<!-- 헤더 끝 -->
	<!-- 내용 시작 -->
	<div class="container">
		<!--left side -->
		<div class="row">
			<div class="col-sm-3 text-center" style="border-radius: 10px;">
				<div>
					<img src="./resources/profile/bird.jpg" class="img-circle" height="65" width="65"
						alt="Avatar"> <br>
					<h4>
						<p class="text-primary" style="font-size: 20px;">
							<strong>이글이글</strong>
						</p>
					</h4>
					<H4>굽는건 다 좋아</H4>
					<br>
					<!-- 게시글, 팔로워, 팔로잉 -->
					<div class="row text-center" style="font-size: 14px;">
						<div class="col-sm-2"></div>
						<div class="col-sm-3 bg-danger">
							<strong>게시글</strong>
						</div>
						<div class="col-sm-3 bg-danger">
							<span style="cursor: pointer" data-toggle="modal"
								data-target="#follower"><strong>팔로워</strong></span>
						</div>
						<div class="col-sm-3 bg-danger">
							<span style="cursor: pointer" data-toggle="modal"
								data-target="#following"><strong>팔로잉</strong></span>
						</div>
						<div class="col-sm-1"></div>
					</div>
					<div class="row text-center" style="font-size: 17px;">
						<div class="col-sm-2"></div>
						<div class="col-sm-3 bg-default">
							<span>10</span>
						</div>
						<div class="col-sm-3 bg-default">
							<span style="cursor: pointer" data-toggle="modal"
								data-target="#follower">20</span>
						</div>
						<div class="col-sm-3 bg-default">
							<span style="cursor: pointer" data-toggle="modal"
								data-target="#following">30</span>
						</div>
						<div class="col-sm-1"></div>
					</div>
					<br>
					<!-- 팔로워 모달 -->
					<div class="modal modal-center fade" id="follower" role="dialog">
						<div class="modal-dialog follow-size modal-center">
							<div class="modal-content follow-size">
								<div class="modal-header" style="background-color: #DE4F4F;">
									<h4 class="modal-title">
										<strong><em>Follower 목록</em></strong>
									</h4>
								</div>
								<!-- 팔로워 Content -->
								<div class="modal-body">
									<div class="btn-group-vertical">
										<table style="font-size: 15px;">
											<tr>
												<td><img src="./resources/profile/bird.jpg" class="img-circle" height="40"
													width="40">&emsp; <a href="#"><strong>Apple</strong></a>
													&emsp;&emsp;
													<button type="button" class="btn btn-danger btn-sm"
														style="border-radius: 20px;">
														<strong>삭제</strong>
													</button>&nbsp;</td>
												<td><img src="./resources/profile/bird.jpg" class="img-circle" height="40"
													width="40">&emsp; <a href="#"><strong>Apple</strong></a>
													&emsp;&emsp;
													<button type="button" class="btn btn-danger btn-sm"
														style="border-radius: 20px;">
														<strong>삭제</strong>
													</button>&nbsp;</td>
											</tr>
											<tr>
												<td><img src="./resources/profile/bird.jpg" class="img-circle" height="40"
													width="40">&emsp; <a href="#"><strong>Apple</strong></a>
													&emsp;&emsp;
													<button type="button" class="btn btn-danger btn-sm"
														style="border-radius: 20px;">
														<strong>삭제</strong>
													</button>&nbsp;</td>
												<td><img src="./resources/profile/bird.jpg" class="img-circle" height="40"
													width="40">&emsp; <a href="#"><strong>Apple</strong></a>
													&emsp;&emsp;
													<button type="button" class="btn btn-danger btn-sm"
														style="border-radius: 20px;">
														<strong>삭제</strong>
													</button>&nbsp;</td>
											</tr>
											<tr>
												<td><img src="./resources/profile/bird.jpg" class="img-circle" height="40"
													width="40">&emsp; <a href="#"><strong>Apple</strong></a>
													&emsp;&emsp;
													<button type="button" class="btn btn-danger btn-sm"
														style="border-radius: 20px;">
														<strong>삭제</strong>
													</button>&nbsp;</td>
												<td><img src="./resources/profile/bird.jpg" class="img-circle" height="40"
													width="40">&emsp; <a href="#"><strong>Apple</strong></a>
													&emsp;&emsp;
													<button type="button" class="btn btn-danger btn-sm"
														style="border-radius: 20px;">
														<strong>삭제</strong>
													</button>&nbsp;</td>
											</tr>
											<tr>
												<td><img src="./resources/profile/bird.jpg" class="img-circle" height="40"
													width="40">&emsp; <a href="#"><strong>Apple</strong></a>
													&emsp;&emsp;
													<button type="button" class="btn btn-danger btn-sm"
														style="border-radius: 20px;">
														<strong>삭제</strong>
													</button>&nbsp;</td>
												<td><img src="./resources/profile/bird.jpg" class="img-circle" height="40"
													width="40">&emsp; <a href="#"><strong>Apple</strong></a>
													&emsp;&emsp;
													<button type="button" class="btn btn-danger btn-sm"
														style="border-radius: 20px;">
														<strong>삭제</strong>
													</button>&nbsp;</td>
											</tr>
										</table>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 팔로잉 Modal -->
					<div class="modal modal-center fade" id="following" role="dialog">
						<div class="modal-dialog follow-size modal-center">
							<div class="modal-content follow-size">
								<div class="modal-header" style="background-color: #DE4F4F;">
									<h4 class="modal-title">
										<strong><em>Following 목록</em></strong>
									</h4>
								</div>
								<!-- 팔로잉 Content -->
								<div class="modal-body">
									<div class="btn-group-vertical">
										<table style="font-size: 15px;">
											<tr>
												<td><img src="./resources/profile/bird.jpg" class="img-circle" height="40"
													width="40">&emsp; <a href="#"><strong>Apple</strong></a>
													&emsp;&emsp;
													<button type="button" class="btn btn-danger btn-sm"
														style="border-radius: 20px;">
														<strong>삭제</strong>
													</button>&nbsp;</td>
												<td><img src="./resources/profile/bird.jpg" class="img-circle" height="40"
													width="40">&emsp; <a href="#"><strong>Apple</strong></a>
													&emsp;&emsp;
													<button type="button" class="btn btn-danger btn-sm"
														style="border-radius: 20px;">
														<strong>삭제</strong>
													</button>&nbsp;</td>
											</tr>
											<tr>
												<td><img src="./resources/profile/bird.jpg" class="img-circle" height="40"
													width="40">&emsp; <a href="#"><strong>Apple</strong></a>
													&emsp;&emsp;
													<button type="button" class="btn btn-danger btn-sm"
														style="border-radius: 20px;">
														<strong>삭제</strong>
													</button>&nbsp;</td>
												<td><img src="./resources/profile/bird.jpg" class="img-circle" height="40"
													width="40">&emsp; <a href="#"><strong>Apple</strong></a>
													&emsp;&emsp;
													<button type="button" class="btn btn-danger btn-sm"
														style="border-radius: 20px;">
														<strong>삭제</strong>
													</button>&nbsp;</td>
											</tr>
											<tr>
												<td><img src="./resources/profile/bird.jpg" class="img-circle" height="40"
													width="40">&emsp; <a href="#"><strong>Apple</strong></a>
													&emsp;&emsp;
													<button type="button" class="btn btn-danger btn-sm"
														style="border-radius: 20px;">
														<strong>삭제</strong>
													</button>&nbsp;</td>
												<td><img src="./resources/profile/bird.jpg" class="img-circle" height="40"
													width="40">&emsp; <a href="#"><strong>Apple</strong></a>
													&emsp;&emsp;
													<button type="button" class="btn btn-danger btn-sm"
														style="border-radius: 20px;">
														<strong>삭제</strong>
													</button>&nbsp;</td>
											</tr>
											<tr>
												<td><img src="./resources/profile/bird.jpg" class="img-circle" height="40"
													width="40">&emsp; <a href="#"><strong>Apple</strong></a>
													&emsp;&emsp;
													<button type="button" class="btn btn-danger btn-sm"
														style="border-radius: 20px;">
														<strong>삭제</strong>
													</button>&nbsp;</td>
												<td><img src="./resources/profile/bird.jpg" class="img-circle" height="40"
													width="40">&emsp; <a href="#"><strong>Apple</strong></a>
													&emsp;&emsp;
													<button type="button" class="btn btn-danger btn-sm"
														style="border-radius: 20px;">
														<strong>삭제</strong>
													</button>&nbsp;</td>
											</tr>
											<tr>
												<td><img src="./resources/profile/bird.jpg" class="img-circle" height="40"
													width="40">&emsp; <a href="#"><strong>Apple</strong></a>
													&emsp;&emsp;
													<button type="button" class="btn btn-danger btn-sm"
														style="border-radius: 20px;">
														<strong>삭제</strong>
													</button>&nbsp;</td>
												<td><img src="./resources/profile/bird.jpg" class="img-circle" height="40"
													width="40">&emsp; <a href="#"><strong>Apple</strong></a>
													&emsp;&emsp;
													<button type="button" class="btn btn-danger btn-sm"
														style="border-radius: 20px;">
														<strong>삭제</strong>
													</button>&nbsp;</td>
											</tr>
										</table>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 팔로워 추천 -->
				<div style="margin-top: 150px; margin-right:20px;">
					<h4>
						<strong>팔로워 추천 : </strong><a href="#">새로고침</a>
					</h4>
					<div class="btn-group-vertical">
						<table style="font-size: 17px; background-color: #F6F6F6">
							<tr>
								<td><img src="./resources/profile/bird.jpg" class="img-circle" height="30"
									width="30">&nbsp; <a href="#"><strong>Apple</strong></a>
									&emsp;
									<button type="button" class="btn btn-danger btn"
										style="border-radius: 10px;">
										<strong>팔로우</strong>
									</button>&nbsp;</td>
							</tr>
							<tr>
								<td><img src="./resources/profile/bird.jpg" class="img-circle" height="30"
									width="30">&nbsp; <a href="#"><strong>Apple</strong></a>
									&emsp;
									<button type="button" class="btn btn-danger btn"
										style="border-radius: 10px;">
										<strong>팔로우</strong>
									</button>&nbsp;</td>
							</tr>
							<tr>
								<td><img src="./resources/profile/bird.jpg" class="img-circle" height="30"
									width="30">&nbsp; <a href="#"><strong>Apple</strong></a>
									&emsp;
									<button type="button" class="btn btn-danger btn"
										style="border-radius: 10px;">
										<strong>팔로우</strong>
									</button>&nbsp;</td>
							</tr>
							<tr>
								<td><img src="./resources/profile/bird.jpg" class="img-circle" height="30"
									width="30">&nbsp; <a href="#"><strong>Apple</strong></a>
									&emsp;
									<button type="button" class="btn btn-danger btn"
										style="border-radius: 10px;">
										<strong>팔로우</strong>
									</button>&nbsp;</td>
							</tr>
							<tr>
								<td><img src="./resources/profile/bird.jpg" class="img-circle" height="30"
									width="30">&nbsp; <a href="#"><strong>Apple</strong></a>
									&emsp;
									<button type="button" class="btn btn-danger btn"
										style="border-radius: 10px;">
										<strong>팔로우</strong>
									</button>&nbsp;</td>
							</tr>
						</table>
					</div>
				</div>
			</div>

			<!-- middle side -->
			<div class="col-sm-7">
				<div class="row text-center" style="border-radius: 10px;">
					<!-- 1번 글 시작 -->
					<div class="well">
						<div class="row">
							<div class="col-sm-3" style="font-size: 16px; text-align: left;">
								<!-- profile -->
								<img src="./resources/profile/bird.jpg" class="img-circle" height="35" width="35">&nbsp;<a
									href="#"><strong>이글이글</strong></a>
							</div>
							<!-- title -->
							<div class="col-sm-9" style="text-align: left;">
								<h4>
									<strong>abcdefghigklmnopqrstu</strong>
								</h4>
							</div>
						</div>
						<!-- image and date, like-->
						<img src="./resources/image/4.jpg" style="width:30%; height:30%;" class="img-squere"><br>
						<div class="row">
							<table style="border-spacing: 20px; font-size: 17px;">
								<tr>
									<td>
										<p>
											<strong>2017.11.14</strong>
										</p>
									</td>
									<td><span class="glyphicon glyphicon-heart"
										style="padding-bottom: 14px;"></span></td>
									<td>
										<p style="padding-bottom: 3px;">
											<em>300</em>
										</p>
									</td>
								</tr>
							</table>
						</div>
						<!-- 글 내용 -->
						<div class="row">
							<p style="font-size: 17px;">글 내용~~~~~~~~~~</p>
						</div>
						<br>
						<br>
						<!-- Icon -->
						<div class="row">
							<div class="pull-right">
								<span style="cursor: pointer"
									class="glyphicon glyphicon-comment icon-size"
									data-toggle="collapse" data-target="#comment"></span>&emsp; <span
									class="glyphicon glyphicon-heart icon-size"></span> &emsp; <span
									class="glyphicon glyphicon-share-alt icon-size"></span>&emsp; <span
									class="glyphicon glyphicon-pencil icon-size"></span> &emsp;
							</div>
						</div>
						<!-- comment -->
						<div id="comment" class="collapse">
							<ul class="list-group" style="text-align: left">
								<li class="list-group-item"><img src="./resources/profile/bird.jpg"
									class="img-circle" height="30" width="30">&nbsp; <a
									href="#"><strong>Apple</strong></a> &emsp; <strong>댓글1</strong>
								</li>
								<li class="list-group-item"><img src="./resources/profile/bird.jpg"
									class="img-circle" height="30" width="30">&nbsp; <a
									href="#"><strong>Apple</strong></a> &emsp; <strong>댓글2</strong>
								</li>
								<li class="list-group-item"><img src="./resources/profile/bird.jpg"
									class="img-circle" height="30" width="30">&nbsp; <a
									href="#"><strong>Apple</strong></a> &emsp; <strong>댓글3</strong>
								</li>
							</ul>
						</div>
					</div>
					<!--1번글 끝 -->
					<!-- 2번 글 시작 -->
					<div class="well">
						<div class="row">
							<div class="col-sm-3" style="font-size: 16px; text-align: left;">
								<!-- profile -->
								<img src="./resources/profile/bird.jpg" class="img-circle" height="35" width="35">&nbsp;<a
									href="#"><strong>이글이글</strong></a>
							</div>
							<!-- title -->
							<div class="col-sm-9" style="text-align: left;">
								<h4>
									<strong>abcdefghigklmnopqrstu</strong>
								</h4>
							</div>
						</div>
						<!-- image and date, like-->
						<img src="./resources/image/4.jpg" style="width:30%; height:30%;" class="img-squere"><br>
						<div class="row">
							<table style="border-spacing: 20px; font-size: 17px;">
								<tr>
									<td>
										<p>
											<strong>2017.11.14</strong>
										</p>
									</td>
									<td><span class="glyphicon glyphicon-heart"
										style="padding-bottom: 14px;"></span></td>
									<td>
										<p style="padding-bottom: 3px;">
											<em>300</em>
										</p>
									</td>
								</tr>
							</table>
						</div>
						<!-- 글 내용 -->
						<div class="row">
							<p style="font-size: 17px;">글 내용~~~~~~~~~~</p>
						</div>
						<br>
						<br>
						<!-- Icon -->
						<div class="row">
							<div class="pull-right">
								<span style="cursor: pointer"
									class="glyphicon glyphicon-comment icon-size"
									data-toggle="collapse" data-target="#comment"></span>&emsp; <span
									class="glyphicon glyphicon-heart icon-size"></span> &emsp; <span
									class="glyphicon glyphicon-share-alt icon-size"></span>&emsp; <span
									class="glyphicon glyphicon-pencil icon-size"></span> &emsp;
							</div>
						</div>
						<!-- comment -->
						<div id="comment" class="collapse">
							<ul class="list-group" style="text-align: left">
								<li class="list-group-item"><img src="./resources/profile/bird.jpg"
									class="img-circle" height="30" width="30">&nbsp; <a
									href="#"><strong>Apple</strong></a> &emsp; <strong>댓글1</strong>
								</li>
								<li class="list-group-item"><img src="./resources/profile/bird.jpg"
									class="img-circle" height="30" width="30">&nbsp; <a
									href="#"><strong>Apple</strong></a> &emsp; <strong>댓글2</strong>
								</li>
								<li class="list-group-item"><img src="./resources/profile/bird.jpg"
									class="img-circle" height="30" width="30">&nbsp; <a
									href="#"><strong>Apple</strong></a> &emsp; <strong>댓글3</strong>
								</li>
							</ul>
						</div>
					</div>
					<!--2번글 끝 -->
					<!-- 3번 글 시작 -->
					<div class="well">
						<div class="row">
							<div class="col-sm-3" style="font-size: 16px; text-align: left;">
								<!-- profile -->
								<img src="./resources/profile/bird.jpg" class="img-circle" height="35" width="35">&nbsp;<a
									href="#"><strong>이글이글</strong></a>
							</div>
							<!-- title -->
							<div class="col-sm-9" style="text-align: left;">
								<h4>
									<strong>abcdefghigklmnopqrstu</strong>
								</h4>
							</div>
						</div>
						<!-- image and date, like-->
						<img src="./resources/image/4.jpg" style="width:30%; height:30%;" class="img-squere"><br>
						<div class="row">
							<table style="border-spacing: 20px; font-size: 17px;">
								<tr>
									<td>
										<p>
											<strong>2017.11.14</strong>
										</p>
									</td>
									<td><span class="glyphicon glyphicon-heart"
										style="padding-bottom: 14px;"></span></td>
									<td>
										<p style="padding-bottom: 3px;">
											<em>300</em>
										</p>
									</td>
								</tr>
							</table>
						</div>
						<!-- 글 내용 -->
						<div class="row">
							<p style="font-size: 17px;">글 내용~~~~~~~~~~</p>
						</div>
						<br>
						<br>
						<!-- Icon -->
						<div class="row">
							<div class="pull-right">
								<span style="cursor: pointer"
									class="glyphicon glyphicon-comment icon-size"
									data-toggle="collapse" data-target="#comment"></span>&emsp; <span
									class="glyphicon glyphicon-heart icon-size"></span> &emsp; <span
									class="glyphicon glyphicon-share-alt icon-size"></span>&emsp; <span
									class="glyphicon glyphicon-pencil icon-size"></span> &emsp;
							</div>
						</div>
						<!-- comment -->
						<div id="comment" class="collapse">
							<ul class="list-group" style="text-align: left">
								<li class="list-group-item"><img src="./resources/profile/bird.jpg"
									class="img-circle" height="30" width="30">&nbsp; <a
									href="#"><strong>Apple</strong></a> &emsp; <strong>댓글1</strong>
								</li>
								<li class="list-group-item"><img src="./resources/profile/bird.jpg"
									class="img-circle" height="30" width="30">&nbsp; <a
									href="#"><strong>Apple</strong></a> &emsp; <strong>댓글2</strong>
								</li>
								<li class="list-group-item"><img src="./resources/profile/bird.jpg"
									class="img-circle" height="30" width="30">&nbsp; <a
									href="#"><strong>Apple</strong></a> &emsp; <strong>댓글3</strong>
								</li>
							</ul>
						</div>
					</div>
					<!--3번글 끝 -->
				</div>
			</div>

		</div>
	</div>
	<footer class="container-fluid text-center">
	<p>MADI</p>
	</footer>
</body>
</html>