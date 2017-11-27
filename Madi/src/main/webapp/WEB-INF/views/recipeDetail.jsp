<%@page import="com.spring.madi.BoardVO"%>
<%@page import="com.spring.madi.MessageVO"%>
<%@page import="com.spring.madi.NotificationVO"%>
<%@page import="com.spring.madi.MemberVO"%>
<%@page import="com.spring.madi.RecipeProcessVO"%>
<%@page import="com.spring.madi.RecipeIrdntVO"%>
<%@page import="com.spring.madi.RecipeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.spring.madi.BoardReplyVO"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	// 모델로부터 Header에 전달할 객체 받기
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
	ArrayList<NotificationVO> notificationList = (ArrayList<NotificationVO>) request
			.getAttribute("notificationList");
	ArrayList<MessageVO> messageList = (ArrayList<MessageVO>) request.getAttribute("messageList");

	// Header에 해당 객체 전달
	request.setAttribute("memberVO", memberVO);
	request.setAttribute("notificationList", notificationList);
	request.setAttribute("messageList", messageList);

	// recipe 정보 및 recipe 분해
	RecipeVO recipe = (RecipeVO) request.getAttribute("recipe");
	ArrayList<RecipeIrdntVO> recipeIrdnt = (ArrayList<RecipeIrdntVO>) recipe.getRecipeIrdnt();
	ArrayList<RecipeProcessVO> recipeProcess = (ArrayList<RecipeProcessVO>) recipe.getRecipeProcess();

	// 게시판 정보 및 게시글 목록 받기
	BoardVO boardVO = (BoardVO) request.getAttribute("boardVO");
	ArrayList<BoardReplyVO> replyList = (ArrayList<BoardReplyVO>) request.getAttribute("replyList");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=divice-width, initial-scale=1">
<title>마디 - 재료로 요리하다</title>
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

	//ajax 댓글 비동기화 
	function reply_save() {

		// 아이디:reply form의 값을 serialize() ==전부다 긁어와서  x에 정렬하여 저장
		var x = $("#reply").serialize();
		$.ajax({

			data : x,
			dataType : "text",
			type : "GET",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8", //인코딩 타입 설정
			async : false, //비동기 동기 여부(false: 동기), 
			url : "./writeBoard.do", //맵핑 주소      맵핑주소에서는 -->recipeDetail1.jsp 로  보냄
			success : function(data) {

				//아이디 :reply의 데이터 다 지우고
				$("#replyreply").empty();
				//아이디:reply의 데이터 다시 추가
				$("#replyreply").append(data);
			},
			error : function() {
				alert('실패');
			}
		});
	};
</script>

<!-- 하이차트 끝 -->

<style>
/* 본문 스타일 설정 */
/* Set height of the grid so .sidenav can be 100% (adjust if needed) */
.row.content {
	height: 1500px
}

/* Set gray background color and 100% height */
.sidenav {
	background-color: #f1f1f1;
	height: 100%;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}
/* 본문 스타일 설정 */
</style>
</head>
<body style="background-color: #F6F6F6">
	<!-- Header 시작-->
	<div class="header">
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<!-- Header 끝-->
	<!-- 성빈 수정 -->
	<div class="container-fluid">
		<div class="row content">
			<!-- 좌측 Sidenav -->
			<div class="col-sm-3 sidenav">
				<div class="panel panel-default" style="padding-left: 5px; padding-right:5px; padding-bottom:10px;">
					<h4><small><%=memberVO.getUser_id() %>님의 레시피</small></h4>
					<img src="<%=memberVO.getUser_img()%>" class="img-rounded" width="100%;">
					<br/><br/>
					<!-- 재료 목록 시작-->
					<ul class="nav nav-pills nav-stacked">
						<li>
							<span>재료명</span>
							<span>재료용량</span>
						</li>
<%
					for(int i = 0; i < recipeIrdnt.size(); i++) {
						RecipeIrdntVO recipeIrdntVO = recipeIrdnt.get(i);
%>
						<li>
							<span><%=recipeIrdntVO.getIrdnt_name() %></span>
							<span><%=recipeIrdntVO.getIrdnt_cpcty() %></span>
						</li>
<%
					}
%>
					</ul>
					<!-- 재료 목록 시작 끝-->
					<!--  -->
					<div class=""></div>
					<br>
				</div>
				<div></div>
			</div>
			<!-- 좌측 Sidenav 끝-->
			<div class="col-sm-9">
				<h4>
					<small>RECENT POSTS</small>
				</h4>
				<hr>
				<h2>I Love Food</h2>
				<h5>
					<span class="glyphicon glyphicon-time"></span> Post by Jane Dane,
					Sep 27, 2015.
				</h5>
				<h5>
					<span class="label label-danger">Food</span> <span
						class="label label-primary">Ipsum</span>
				</h5>
				<br>
				<p>Food is my passion. Lorem ipsum dolor sit amet, consectetur
					adipiscing elit, sed do eiusmod tempor incididunt ut labore et
					dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
					exercitation ullamco laboris nisi ut aliquip ex ea commodo
					consequat. Excepteur sint occaecat cupidatat non proident, sunt in
					culpa qui officia deserunt mollit anim id est laborum consectetur
					adipiscing elit, sed do eiusmod tempor incididunt ut labore et
					dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
					exercitation ullamco laboris nisi ut aliquip ex ea commodo
					consequat.</p>
				<br>
				<br>

				<h4>
					<small>RECENT POSTS</small>
				</h4>
				<hr>
				<h2>Officially Blogging</h2>
				<h5>
					<span class="glyphicon glyphicon-time"></span> Post by John Doe,
					Sep 24, 2015.
				</h5>
				<h5>
					<span class="label label-success">Lorem</span>
				</h5>
				<br>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
					do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
					enim ad minim veniam, quis nostrud exercitation ullamco laboris
					nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat
					cupidatat non proident, sunt in culpa qui officia deserunt mollit
					anim id est laborum consectetur adipiscing elit, sed do eiusmod
					tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
					minim veniam, quis nostrud exercitation ullamco laboris nisi ut
					aliquip ex ea commodo consequat.</p>
				<hr>

				<h4>Leave a Comment:</h4>
				<form role="form">
					<div class="form-group">
						<textarea class="form-control" rows="3" required></textarea>
					</div>
					<button type="submit" class="btn btn-success">Submit</button>
				</form>
				<br>
				<br>

				<p>
					<span class="badge">2</span> Comments:
				</p>
				<br>

				<div class="row">
					<div class="col-sm-2 text-center">
						<img src="bandmember.jpg" class="img-circle" height="65"
							width="65" alt="Avatar">
					</div>
					<div class="col-sm-10">
						<h4>
							Anja <small>Sep 29, 2015, 9:12 PM</small>
						</h4>
						<p>Keep up the GREAT work! I am cheering for you!! Lorem ipsum
							dolor sit amet, consectetur adipiscing elit, sed do eiusmod
							tempor incididunt ut labore et dolore magna aliqua.</p>
						<br>
					</div>
					<div class="col-sm-2 text-center">
						<img src="bird.jpg" class="img-circle" height="65" width="65"
							alt="Avatar">
					</div>
					<div class="col-sm-10">
						<h4>
							John Row <small>Sep 25, 2015, 8:25 PM</small>
						</h4>
						<p>I am so happy for you man! Finally. I am looking forward to
							read about your trendy life. Lorem ipsum dolor sit amet,
							consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
							labore et dolore magna aliqua.</p>
						<br>
						<p>
							<span class="badge">1</span> Comment:
						</p>
						<br>
						<div class="row">
							<div class="col-sm-2 text-center">
								<img src="bird.jpg" class="img-circle" height="65" width="65"
									alt="Avatar">
							</div>
							<div class="col-xs-10">
								<h4>
									Nested Bro <small>Sep 25, 2015, 8:28 PM</small>
								</h4>
								<p>Me too! WOW!</p>
								<br>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 인욱이형 부분 -->
	<%-- <div class="container" style="background-color: #fcf8e3">
		<div class=" container col-xs-0 col-md-3"></div>
		<div class=" container col-xs-12 col-md-6">
			<h1 align="center"><%=recipeVO.getRecipe_title()%></h1>


			<img src="<%=recipeVO.getImg_url()%>" class="img-rounded thumbnail"
				alt="Cinque Terre" width="100%" height="100%"
				style="max-height: 500px"> &nbsp;
			<p><%=recipeVO.getRecipe_desc()%></p>

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
				<img src="./resources/image/orange.jpg"
					class="img-rounded thumbnail" align="middle" alt="cinque terre"
					width="400px" height="200px">
			</div>
			<div class="col-xs-12 col-md-4">
				<h2>재료리스트</h2>
				<table class="table table-bordered ">
					
						<tr>
							<th>재료명</th>
							<th>재료용량</th>
						</tr>
					
					<%
						for (int i = 0; i < recipeIrdnt.size(); i++) {
							RecipeIrdntVO x = recipeIrdnt.get(i);
					%>

					<tbody>
						<tr>
							<td><%=x.getIrdnt_name()%></td>
							<td><%=x.getIrdnt_cpcty()%></td>
						</tr>
					</tbody>	
						<%
							}
						%>
					
				</table>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-xs-0 col-md-2"></div>
			<div class="col-xs-12 col-md-8">
				<h1 align="center">만드는법</h1>
				<%
						for (int i = 0; i < recipeProcess.size(); i++) {
							RecipeProcessVO x = recipeProcess.get(i);
						if(x.getStep_img_url().equals("null")){
									
						}else{
				%>
				
				<img src="<%=x.getStep_img_url() %>"
					class="img-rounded"
					style="width: 70%; height: 70%; margin: 0 auto;">
				<%}
				
						if(x.getStep_tip().equals("null")) { 
				
						}else{
				%>
				<h5>TIP : <%=x.getStep_tip() %></h5>
				<%
						}
				%>	

				<p><%=x.getCooking_no() %> : <%=x.getCooking_desc() %></p>
				<hr>
				<%
						}
						
				%>
				
			<div class="col-xs-0 col-md-2"></div>	

				<h1>한줄 댓글</h1>
				<form method="get" id="reply">
					<div class="container-fluid input-group"
						style="padding-right: 0; padding-left: 0">
						<textarea id="rep_content" name="rep_content" class="form-control"
							placeholder="한줄 댓글을 남겨주세요." style="width: 100%" rows="4"></textarea>
						<span class="input-group-addon"> <input
							class="btn btn-default" type="button" value="댓글쓰기"
							onclick="reply_save()" style="width: 100px">
						</span> <input type="text" name="user_id" id="user_id"> <input
							type="text" name="board_num" id="board_num">
					</div>
				</form>
				<hr>
				<%for(int i=0; i<boardReplyVO.size(); i++) {
					BoardReplyVO reply1 = boardReplyVO.get(i);
					
				%>	
				<form id="replyreply">
				<div class="container-fluid input-group"
					style="padding-right: 0; padding-left: 0; margin: 0">
					
					<div class="col-xs-2 col-md-2 thumbnail"
						style="padding-right: 0; padding-left: 0;">
						<img class="img-circle" src="<%=reply1.getUser_id() %>"
							
							style="width: 100%;">
					</div>
					<div class="col-xs-10 col-md-10">
						
						<input type="hidden" value="<%=reply1.getBoard_num() %>"> 
						<p>
						
						<%=reply1.getRep_content() %>
						
						
						
						</p>
						
					</div>
				</div>
				<%
				}
				%>
				</form>






			</div>


		</div>

	</div>
 --%>
	<!-- 마지막 footer -->
	<footer class="container-fluid text-center">
	<p>MADI</p>
	</footer>
</body>
</html>