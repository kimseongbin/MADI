<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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

<!-- 하이차트 -->
<!-- <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script> -->

<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>

<!-- 하이차트 끝 -->
<script language="JavaScript">
	$(document).ready(function() {

		Highcharts.setOptions({
			colors : [ '#3300cc', '#999999' ],
			credits : {
				enabled : false
			}
		});
		var chart = {
			plotBackgroundColor : null,
			backgroundColor : '#fcf8e3',
			plotBorderWidth : null,
			plotShadow : false
		};
		var title = {
			text : '칼로리' + '<br>' + ' x kcal ',
			style : {
				Color : '# 3E576F',
				fontSize : '14px'
			},
			align : 'center',
			verticalAlign : 'middle',
			y : 0
		};
		var tooltip = {
			pointFormat : '{series.name}: <b>{point.percentage:.1f}%</b>'
		};
		var plotOptions = {
			pie : {
				allowPointSelect : true,
				cursor : 'pointer',
				dataLabels : {
					enabled : false
				},
				innerSize : 80
			}
		};
		var series = [ {
			type : 'pie',
			name : '1일 권장량',
			data : [ {
				name : '칼로리',
				y : 100
			} ]
		} ];

		var json = {};
		json.chart = chart;
		json.title = title;
		json.tooltip = tooltip;
		json.series = series;
		json.plotOptions = plotOptions;
		$('#칼로리').highcharts(json);
	});
	$(document).ready(function() {
		Highcharts.setOptions({
			colors : [ '#058DC7', '#999999' ], //차트 컬러 변경
			credits : {
				enabled : false
			}
		//하이차트 로고 지우기
		});
		var chart = {
			backgroundColor : '#fcf8e3',
			plotBackgroundColor : true,
			plotBorderWidth : null,
			plotShadow : false
		};
		var title = {
			text : '탄수화물' + '<br>' + ' x % ',
			style : {
				Color : '# 3E576F',
				fontSize : '14px'
			},
			align : 'center',
			verticalAlign : 'middle',
			y : 0
		};
		var tooltip = {
			pointFormat : '{series.name}: <b>{point.percentage:.1f}%</b>',

		};
		var plotOptions = {
			pie : {
				allowPointSelect : true,
				cursor : 'pointer',
				dataLabels : {
					enabled : false
				},
				innerSize : 80
			//showInLegend: true, 범례 생성
			}
		};
		var series = [ {
			type : 'pie',
			name : '1일 권장량',
			data : [ {
				name : '탄수화물',
				y : 80
			}, {
				name : '',
				y : 20
			} ]

		} ];

		var json = {};
		json.chart = chart;
		json.title = title;
		json.tooltip = tooltip;
		json.series = series;
		json.plotOptions = plotOptions;
		$('#탄수화물').highcharts(json);
	});

	$(document).ready(function() {

		Highcharts.setOptions({
			colors : [ '#50B432', '#999999' ],
			credits : {
				enabled : false
			}
		});
		var chart = {
			plotBackgroundColor : null,
			backgroundColor : '#fcf8e3',
			plotBorderWidth : null,
			plotShadow : false
		};
		var title = {
			text : '단백질' + '<br>' + ' x % ',
			style : {
				Color : '# 3E576F',
				fontSize : '14px'
			},
			align : 'center',
			verticalAlign : 'middle',
			y : 0
		};
		var tooltip = {
			pointFormat : '{series.name}: <b>{point.percentage:.1f}%</b>'
		};
		var plotOptions = {
			pie : {
				allowPointSelect : true,
				cursor : 'pointer',
				dataLabels : {
					enabled : false
				},
				innerSize : 80
			}
		};
		var series = [ {
			type : 'pie',
			name : '1일 권장량',
			data : [ {
				name : '단백질',
				y : 40
			}, {
				name : '',
				y : 60
			} ]
		} ];

		var json = {};
		json.chart = chart;
		json.title = title;
		json.tooltip = tooltip;
		json.series = series;
		json.plotOptions = plotOptions;
		$('#단백질').highcharts(json);
	});
	$(document).ready(function() {

		Highcharts.setOptions({
			colors : [ '#ff0000', '#999999' ],
			credits : {
				enabled : false
			}
		});
		var chart = {
			plotBackgroundColor : null,
			backgroundColor : '#fcf8e3',
			plotBorderWidth : null,
			plotShadow : false
		};
		var title = {
			text : '지방' + '<br>' + ' x % ',
			style : {
				Color : '# 3E576F',
				fontSize : '14px'
			},
			align : 'center',
			verticalAlign : 'middle',
			y : 0
		};
		var tooltip = {
			pointFormat : '{series.name}: <b>{point.percentage:.1f}%</b>'
		};
		var plotOptions = {
			pie : {
				allowPointSelect : true,
				cursor : 'pointer',
				dataLabels : {
					enabled : false
				},
				innerSize : 80
			}
		};
		var series = [ {
			type : 'pie',
			name : '1일 권장량',
			data : [ {
				name : '지방',
				y : 20
			}, {
				name : '',
				y : 80
			} ]
		} ];

		var json = {};
		json.chart = chart;
		json.title = title;
		json.tooltip = tooltip;
		json.series = series;
		json.plotOptions = plotOptions;
		$('#지방').highcharts(json);
	});
</script>


<style>
footer {
	background-color: #DE4F4F;
	color: white;
	padding: 15px;
}
/* 헤더 아이콘 Design */
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

img {
	display: block;
	margin: 0 auto;
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
				<!--home 아이콘 -->
				<li><button type="button" class="btn form"
						style="padding-top: 15px;">
						<span class="glyphicon glyphicon-home color"></span>
					</button></li>
				<!-- 냉장고 아이콘 -->
				<li>
					<div style="padding-top: 9px;">
						<button type="button" class="btn form" data-toggle="modal"
							data-target="#fridge">
							<img src="./resources/food_icon/fridge.png"
								style="width: 20px; height: 20px;">
						</button>
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
												style="width: 35px; height: 35px;"> <strong>냉장고
												재료들</strong>
										</h3>
									</div>
									<div class="modal-body" style="text-align: center;">
										<div class="row">
											<!-- 왼쪽 카테고리 -->
											<div class="col-sm-2">
												<ul class="nav nav-stacked">
													<li class="active"><a data-toggle="tab" href="#menu1">
															<strong>곡류/면류</strong>
													</a></li>
													<li><a data-toggle="tab" href="#menu2"> <strong>채소</strong>
													</a></li>
													<li><a data-toggle="tab" href="#menu3"> <strong>고기</strong>
													</a></li>
													<li><a data-toggle="tab" href="#menu4"> <strong>해산물</strong>
													</a></li>
												</ul>
											</div>
											<!--  가운데 리스트 나열 -->
											<div class="col-sm-6" style="background-color: #BDBDBD;">
												<div class="tab-content">
													<!-- 메뉴1 곡류 -->
													<div id="menu1" class="tab-pane fade in active">
														<table>
															<tr>
																<td><a href="#" class="text-muted"> <img
																		src="./resources/food_icon/rice.png"
																		style="width: 50px; height: 50px;"><br> <strong>흰쌀</strong>
																</a></td>
																<td><a href="#" class="text-muted"> <img
																		src="./resources/food_icon/noodle.png"
																		style="width: 50px; height: 50px;"><br> <strong>파스타</strong>
																</a></td>
																<td><a href="#" class="text-muted"> <img
																		src="./resources/food_icon/noodle.png"
																		style="width: 50px; height: 50px;"><br> <strong>라면</strong>
																</a></td>
															</tr>
														</table>
													</div>
													<!-- 메뉴2 채소 -->
													<div id="menu2" class="tab-pane fade">
														<table>
															<tr>
																<td><a href="#" class="text-muted"> <img
																		src="./resources/food_icon/vege.png"
																		style="width: 50px; height: 50px;"><br> <strong>상추</strong>
																</a></td>
																<td><a href="#" class="text-muted"> <img
																		src="./resources/food_icon/vege.png"
																		style="width: 50px; height: 50px;"><br> <strong>시금치</strong>
																</a></td>
																<td><a href="#" class="text-muted"> <img
																		src="./resources/food_icon/vege.png"
																		style="width: 50px; height: 50px;"><br> <strong>대파</strong>
																</a></td>
															</tr>
														</table>
													</div>
													<!-- 메뉴3 고기 -->
													<div id="menu3" class="tab-pane fade">
														<table>
															<tr>
																<td><a href="#" class="text-muted"> <img
																		src="./resources/food_icon/beef.png"
																		style="width: 50px; height: 50px;"><br>
																	<strong>삼겹살</strong>
																</a></td>
																<td><a href="#" class="text-muted"> <img
																		src="./resources/food_icon/beef.png"
																		style="width: 50px; height: 50px;"><br>
																	<strong>소고기</strong>
																</a></td>
																<td><a href="#" class="text-muted"> <img
																		src="./resources/food_icon/beef.png"
																		style="width: 50px; height: 50px;"><br> <strong>소시지</strong>
																</a></td>
															</tr>
														</table>
													</div>
													<!-- 메뉴4 해산물 -->
													<div id="menu4" class="tab-pane fade">
														<table>
															<tr>
																<td><a href="#" class="text-muted"> <img
																		src="./resources/food_icon/fish.png"
																		style="width: 50px; height: 50px;"><br>
																	<strong>고등어</strong>
																</a></td>
																<td><a href="#" class="text-muted"> <img
																		src="./resources/food_icon/fish.png"
																		style="width: 50px; height: 50px;"><br>
																	<strong>참치캔</strong>
																</a></td>
															</tr>
														</table>
													</div>
													<!-- 메뉴5 소스 -->
													<div id="menu5" class="tab-pane fade">
														<table>
															<tr>
																<td><a href="#" class="text-muted"> <img
																		src="./resources/food_icon/sauce.png"
																		style="width: 50px; height: 50px;"><br>
																	<strong>간장</strong>
																</a></td>
																<td><a href="#" class="text-muted"> <img
																		src="./resources/food_icon/sauce.png"
																		style="width: 50px; height: 50px;"><br>
																	<strong>미림</strong>
																</a></td>
																<td><a href="#" class="text-muted"> <img
																		src="./resources/food_icon/sauce.png"
																		style="width: 50px; height: 50px;"><br> <strong>진간장</strong>
																</a></td>
															</tr>
														</table>
													</div>
													<!-- 메뉴6 -->
												</div>
											</div>
											<!-- 오른쪽 내가 가진 재료들? -->
											<div class="col-sm-4"></div>
										</div>
									</div>
									<!-- 내용 끝 -->
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
									</div>
								</div>
								<!-- 모달 content 끝 -->
							</div>
						</div>
					</div>
				</li>
				<li>
					<div class="dropdown" style="padding-top: 9px; padding-left: 2px;">
						<button class="btn dropdown-toggle form" type="button"
							data-toggle="dropdown">
							<span class="glyphicon glyphicon-user color"></span>
						</button>
						<ul class="dropdown-menu"
							style="text-align: center; background-color: #F6F6F6;">
							<li><img src="./resources/profile/bird.jpg"
								class="img-circle" height="70" width="70" alt="Avatar"></li>
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
					<div style="padding-top: 9px; padding-left: 3px;">
						<button type="button" class="btn form" data-toggle="modal"
							data-target="#myModal">
							<span class="glyphicon glyphicon-align-justify color"
								style="padding-right: 7px;"></span>
						</button>
						<!-- Modal bar -->
						<div class="modal fade" id="myModal" tableindex="-1" role="dialog"
							aria-labelledby="modallabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
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
															<img src="./resources/profile/bird.jpg"
																class="img-circle" height="40" width="40" alt="Avatar">
														</div>
														<div class="col-sm-4">
															<h4 class="text-primary" style="">이글이글</h4>
														</div>
													</div>
													<!-- 알림 내용들 -->
													<li class="list-group-item"><img
														src="./resources/profile/bird.jpg" class="img-circle"
														height="20" width="20" alt="Avatar"> <a>AAA</a><em>
															님이 ~~~ 게시물을 공유했습니다.</em></li>
													<li class="list-group-item"><img
														src="./resources/profile/bird.jpg" class="img-circle"
														height="20" width="20" alt="Avatar"> <a>BBB</a><em>
															님이 ~~~ 게시물을 공유했습니다.</em>
														<div class="row"></div></li>
													<li class="list-group-item"><img
														src="./resources/profile/bird.jpg" class="img-circle"
														height="20" width="20" alt="Avatar"> <a>CCC</a> <em>
															님이 ~~~ 게시물을 공유했습니다.</em>
														<div class="row"></div></li>
												</ul>
											</div>
											<div id="message" class="tab-pane fade">
												<ul class="list-group">
													<div class="row">
														<div class="col-sm-2" style="padding-bottom: 5px;">
															<img src="./resources/profile/bird.jpg"
																class="img-circle" height="40" width="40" alt="Avatar">
														</div>
														<div class="col-sm-4">
															<h4 class="text-primary" style="">이글이글</h4>
														</div>
													</div>
													<!-- 메시지 내용들 -->
													<li class="list-group-item"><strong>From </strong> <img
														src="./resources/profile/bird.jpg" class="img-circle"
														height="20" width="20" alt="Avatar"> <a>AAA</a> <strong>:
															"지금 뭐하는지"</strong></li>
													<li class="list-group-item"><strong>From </strong> <img
														src="./resources/profile/bird.jpg" class="img-circle"
														height="20" width="20" alt="Avatar"> <a>BBB</a> <strong>:
															"먹을게 없다"</strong></li>
													<li class="list-group-item"><strong>From </strong> <img
														src="./resources/profile/bird.jpg" class="img-circle"
														height="20" width="20" alt="Avatar"> <a>CCC</a> <strong>:
															"사진"</strong></li>
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
					<button type="button" class="btn form"
						style="padding-top: 15px; padding-right: 13px;">
						<span class="glyphicon glyphicon-globe color"></span>
					</button>
				</li>
			</ul>
		</div>
	</div>
	</nav>
	<!-- 헤더 끝 -->

	<div class="container" style="background-color: #fcf8e3">
		<div class=" container col-xs-0 col-md-3"></div>
		<div class=" container col-xs-12 col-md-6">
			<h1 align="center">음식 이름</h1>


			<img src="./resources/image/orangejuice.png"
				class="img-rounded thumbnail" alt="Cinque Terre" width="100%"
				height="100%" style="max-height: 500px"> &nbsp;
			<p>음식에 대한 간단한 설명음식에 대한 간단한 설명음식에 대한 간단한 설명음식에 대한 간단한 설명음식에 대한 간단한
				설명음식에 대한 간단한 설명음식에 대한 간단한 설명음식에 대한 간단한 설명음식에 대한 간단한 설명음식에 대한 간단한
				설명음식에 대한 간단한 설명음식에 대한 간단한 설명음식에 대한 간단한 설명음식에 대한 간단한 설명음식에 대한 간단한
				설명음식에 대한 간단한 설명</p>

			<h2 align="center">영양정보</h2>
			<div id="칼로리" style="float: left; width: 135px; height: 135px;"></div>
			<div id="탄수화물" style="float: left; width: 135px; height: 135px;"></div>
			<div id="단백질" style="float: left; width: 135px; height: 135px;"></div>
			<div id="지방" style="float: left; width: 135px; height: 135px;"></div>

		</div>



		<div class=" container col-xs-0 col-md-3"></div>





		<div class="row">

			<div class="col-xs-12 col-md-6 text-center" style="height: 400px">
				<h2>재료</h2>
				<img src="./resources/image/orange.jpg" class="img-rounded thumbnail"
					align="middle" alt="cinque terre" width="400px" height="200px">
			</div>
			<div class="col-xs-12 col-md-6">

				<h2>재료리스트</h2>
				
				<div class="panel panel-default text-center col-xs-6 col-md-5" style="padding:0;">
					<div class="panel-heading">재료명</div>
  					<div class="panel-body" style="padding:0;">말린미이이이이이이이역</div>
				</div>
				<div class="panel panel-default text-center col-xs-6 col-md-5" style="padding:0;">
					<div class="panel-heading">재료용량</div>
  					<div class="panel-body" style="padding:0">100g</div>
				</div>
				
			</div>





		</div>

		<hr>

		<div class="row">
			<div class="col-xs-0 col-md-1"></div>
			<div class="col-xs-12 col-md-10">
				<h1 align="center">만드는법</h1>
				<img src="https://placehold.it/900x500?text=IMAGE"
					class="img-rounded"
					style="width: 70%; height: 70%; margin: 0 auto;">

				<p>설명설명</p>

				<hr>

				<h1>한줄 댓글</h1>

				<div class="container-fluid input-group"
					style="padding-right: 0; padding-left: 0">
					<textarea id="textarea" class="form-control"
						placeholder="한줄 댓글을 남겨주세요." style="width: 100%" rows="4"></textarea>
					<span class="input-group-addon"> <input
						class="btn btn-default" type="button" value="댓글쓰기"
						style="width: 100px">
					</span>
				</div>

				<hr>

				<div class="container-fluid input-group"
					style="padding-right: 0; padding-left: 0; margin: 0">
					<div class="col-xs-2 col-md-2 thumbnail"
						style="padding-right: 0; padding-left: 0;">
						<img class="img-circle" src="./resources/image/1.jpg"
							style="width: 100%;">
					</div>
					<div class="col-xs-10 col-md-10">
						<p>asd</p>
					</div>
				</div>
				<hr>


				<div class="col-xs-0 col-md-1"></div>
			</div>







		</div>


	</div>


	<!-- 마지막 footer -->
	<footer class="container-fluid text-center">
	<p>MADI</p>
	</footer>
</body>
</html>