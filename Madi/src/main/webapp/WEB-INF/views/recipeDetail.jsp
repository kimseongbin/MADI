<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 합쳐지고 최소화된 최신 css -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!--  -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
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
			colors : [ '#058DC7', '#999999' ], //차트 컬러 변경
			credits : {
				enabled : false
			}
		//하이차트 로고 지우기
		});
		var chart = {
			plotBackgroundColor : true,
			plotBorderWidth : null,
			plotShadow : false
		};
		var title = {
			text : '탄수화물'+'<br>'+' x % ',
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
				innerSize : 90
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
			plotBorderWidth : null,
			plotShadow : false
		};
		var title = {
			text : '단백질'+'<br>'+' x % ',
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
				innerSize : 90
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
			plotBorderWidth : null,
			plotShadow : false
		};
		var title = {
			text : '지방'+'<br>'+' x % ',
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
				innerSize : 90
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
.glyphicon {
	font-size: 17px;
}

.glyphicon.top {
	color: #000000;
}

.navbar.head {
	background-color: #E1E1E1;
}
</style>
</head>
<body>
	<!-- 헤더 -->
	<nav class="navbar navbar-default head" style="margin-bottom: 0px;">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span><span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">MADI</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar"
				style="padding-right: 10px">
				<ul class="nav navbar-nav navbar" style="padding-right: 10px">
					<form class="navbar-form navbar-right" role="search">
						<div class="form-group input-group">
							<input type="text" class="form-control" placeholder="Search..">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button">
									<span class="glyphicon glyphicon-search"></span>
								</button>
							</span>
						</div>
					</form>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class="glyphicon glyphicon-user top"></span></a></li>
					<li><a href="#"><span class="glyphicon glyphicon-home top"></span></a></li>
					<li><span>
							<div class="panel-group panel-basic">
								<div class="panel-heading">
									<div class="panel-title" style="padding-top: 3px;">
										<a data-toggle="collapse" href="#collapse1"> <span
											class="glyphicon glyphicon-align-justify"></span>
										</a>
									</div>
									<div id="collapse1" class="panel-collapse collapse">
										<ul class="nav nav-tabs">
											<li>
												<button type="button" class="btn btn-default">Apple</button>
											</li>
											<li>
												<button type="button" class="btn btn-default">banana</button>
											</li>
										</ul>
									</div>
								</div>
							</div>
					</span></li>
					<li><a href="#"><span
							class="glyphicon glyphicon-globe top"></span></a></li>
					<li><a href="#"><span class="glyphicon glyphicon-cog top"></span></a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- 헤더 끝 -->
	<div class="container-fluid" style="background-color: #fcf8e3">
		<h1 align="center">음식 이름</h1>

		<div class="row">
			<div class="col-xs-4 col-md-4"></div>

			<div class="col-xs-4 col-md-4"
				style="background-color: white; margin: 0px; padding: 40px;">
				<img src="./resources/image/orangejuice.png" class="img-rounded"
					alt="Cinque Terre" width="100%" height="400px"> &nbsp;
				<p>음식에 대한 간단한 설명음식에 대한 간단한 설명음식에 대한 간단한 설명음식에 대한 간단한 설명음식에 대한
					간단한 설명음식에 대한 간단한 설명음식에 대한 간단한 설명음식에 대한 간단한 설명음식에 대한 간단한 설명음식에 대한
					간단한 설명음식에 대한 간단한 설명음식에 대한 간단한 설명음식에 대한 간단한 설명음식에 대한 간단한 설명음식에 대한
					간단한 설명음식에 대한 간단한 설명</p>
			</div>
			<div class="col-xs-4 col-md-4">
				<div id="탄수화물" style="float: left; width: 150px; height: 150px;"></div>
				<div id="단백질" style="float: left; width: 150px; height: 150px;"></div>
				<div id="지방" style="float: left; width: 150px; height: 150px;"></div>
				<div id="container" style="width: 150px; height: 150px;"></div>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-xs-3 col-md-3">공백</div>
			<div class="col-xs-3 col-md-3"
				style="background-color: white; height: 400px">
				<h1>재료(####)</h1>
				<img src="./resources/image/orange.jpg" class="img-rounded"
					alt="cinque terre" width="100%" height="200px">
			</div>
			<div class="col-xs-3 col-md-3"
				style="background-color: white; height: 400px;">
				<h3>재료리스트</h3>
				<p class="form-control-static">재료1</p>

				<p>(힛빠리우동)</p>
				<p>삶은 우동 4개(800g) 수타우동 4인분 만드는 법 고등어통조림 1 캔(200g) 쪽파 4 개 생강 1 쪽
					고춧가루 약간 간장 적당량</p>
				<p>(가야키)</p>
				<p>고등어통조림 1 캔(200g) 물 4 컵(800ml) 간장 2 큰술 시금치 150g 배추 250g(또는
					좋아하는 야채 400g) 생강 1 쪽</p>
			</div>
			<div class="col-xs-3 col-md-3">공백</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-xs-3 col-md-3">공백</div>
			<div class="col-xs-6 col-md-6">
				<h1>만드는법</h1>
				<img src="https://placehold.it/900x500?text=IMAGE"
					class="img-rounded" style="max-width: 900px; max-height: 500px;">
				<p>설명설명</p>
				<hr>
				<div> 
					<input id = '#' type="text" >
				</div>
			</div>
			<div class="col-xs-3 col-md-3">공백</div>
		</div>
	</div>
</body>
</html>



