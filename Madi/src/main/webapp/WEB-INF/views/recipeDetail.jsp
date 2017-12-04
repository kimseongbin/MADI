<%@page import="com.spring.madi.MemberBoxVO"%>
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
	ArrayList<NotificationVO> notificationList = (ArrayList<NotificationVO>) request.getAttribute("notificationList");
	ArrayList<MessageVO> messageList = (ArrayList<MessageVO>) request.getAttribute("messageList");
	ArrayList<MemberBoxVO> myIrdntList = (ArrayList<MemberBoxVO>) request.getAttribute("myIrdntList");

	// Header에 해당 객체 전달
	request.setAttribute("memberVO", memberVO);
	request.setAttribute("notificationList", notificationList);
	request.setAttribute("messageList", messageList);
	request.setAttribute("myIrdntList", myIrdntList);
	
	// recipe 정보 및 recipe 분해
	RecipeVO recipe = (RecipeVO) request.getAttribute("recipe");
	MemberVO recipeOwner = (MemberVO) request.getAttribute("recipeOwner");
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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

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
	$(document).ready(function() {
		$("#replySubmitBtn").click(function() {
			var rep_content = $("textarea[name='rep_content']").val();
			if(rep_content == "") {
				alert("내용을 입력해주세요.");
				return;
			}
			var param = $("#reply").serialize();
			$.ajax({
				url: "./writeBoard.do",
				type: "POST",
				data: param,
				contentType : 'application/x-www-form-urlencoded; charset=utf-8',
				dataType: "text",
				success: function(data) {
					$("#replyList").empty();
					$("textarea[name='rep_content']").val("");
					$("#replyList").append(data);
					document.getElementById("comments").innerHTML = Number(document.getElementById("comments").innerHTML) + 1;
				}
			});
		});
	});
	function deletereply(element, rep_date, user_id) {
		var parent = element.parentNode;
		var pParent = parent.parentNode;
		var me = "<%=memberVO.getUser_id()%>";
		var board_num = "<%=boardVO.getBoard_num()%>";
		if(me != user_id) {
			alert("회원님이 직접 작성하신 댓글만 삭제 가능합니다.");
			return;
		}
		$.ajax({
			url: "./deleteReply.do",
			type: "POST",
			data: {
				rep_date: rep_date,
				user_id: user_id,
				board_num: board_num
			},
			success: function(data) {
				pParent.remove();
				document.getElementById("comments").innerHTML = data;							
				
			}
		});
	}
	function followRequest(user_id, following_user_id, user_img, following_user_img) {
		// 내가 날 팔로우할 순 없음
		if(user_id == following_user_id) {
			return;
		}
		$.ajax({
			url: "./followRequest.do",
			type: "POST",
			data: {
				user_id: user_id,
				following_user_id: following_user_id,
				user_img: user_img,
				following_user_img: following_user_img,
			},
			success: function(data) {
				if(data == 0) {
					alert("이미 팔로우 한 회원입니다.");
				} else if(data == 1){
					alert("현재 "+following_user_id+"님의 요청 수락을 기다리고 있습니다.");
				} else if(data == 2){
					alert(following_user_id+"님께 팔로우를 신청하셨습니다.");				
				}
			}
		});
	}
</script>

<!-- 하이차트 끝 -->

<style>
.parallax {
    /* The image used */
    background-image: url('https://static.pexels.com/photos/416537/pexels-photo-416537.jpeg');

    /* Full height */
    height: 100%; 

    /* Create the parallax scrolling effect */
    background-attachment: fixed;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover; 
}
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
.xrs {
	 background-image: url('./resources/image/10.gif');
}
/* 본문 스타일 설정 */
</style>
</head>
<body style="background-color: #F6F6F6" class="parallax">
	<!-- Header 시작-->
	<div class="header">
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<!-- Header 끝-->
	<!-- 성빈 수정 -->
	<div class="container-fluid">
		<!-- body wrapper 끝 -->
		<div class="row content">
			<!-- 좌측 Sidenav -->
			<div class="col-sm-3 sidenav">
				<div class="panel panel-default text-center"
					style="padding-left: 5px; padding-right: 5px; padding-bottom: 10px;">
					<h3>
						<%=recipeOwner.getUser_id()%>님의 레시피
					</h3>
					<img src="<%=recipeOwner.getUser_img()%>" class="img-rounded"
						width="80%;"> <br /> <br />
					<p>
					<h4><%=recipeOwner.getUser_name()%></h4>
					</p>
					<p>
					<h4><%=recipeOwner.getUser_email()%></h4>
					</p>
					<!-- 팔로우 버튼 -->
					<button type="button" class="btn btn-danger btn" onclick="followRequest('<%=memberVO.getUser_id()%>','<%=recipeOwner.getUser_id()%>', '<%=memberVO.getUser_img()%>','<%=recipeOwner.getUser_img()%>')" style="border-radius: 10px;">
						<strong style="font-size:15px;">팔로우</strong>
					</button>&nbsp;
					<!-- 팔로우 버튼 -->
					<!-- 하이차트 시작 -->
					<div class="container-fluid"
						style="padding-left: 5%; padding-right: 5%;">
						<div id="칼로리" style="float: left; width: 50%; height: 170px;"></div>
						<div id="탄수화물" style="float: left; width: 50%; height: 170px;"></div>
						<div id="단백질" style="float: left; width: 50%; height: 170px;"></div>
						<div id="지방" style="float: left; width: 50%; height: 170px;"></div>
					</div>
					<!-- 하이차트 끝 -->
					<!-- 재료 목록 시작-->
					<table class="table table-borderd">
						<thead>
							<tr>
								<td>재료명</td>
								<td>재료용량</td>
							</tr>
						</thead>
						<%
							for (int j = 0; j < recipeIrdnt.size(); j++) {
								RecipeIrdntVO recipeIrdntVO = recipeIrdnt.get(j);
						%>
						<tbody>
							<tr>
								<td><%=recipeIrdntVO.getIrdnt_name()%></td>
								<td><%=recipeIrdntVO.getIrdnt_cpcty()%></td>
							</tr>
						</tbody>
						<%
							}
						%>
					</table>
					<!-- 재료 목록 끝-->
					<br>
				</div>
			</div>
			<!-- 좌측 Sidenav 끝-->
			<!-- 우측 메인 시작 -->
			<div class="col-sm-9 panel panel-default">
				<div class="text-muted" style="position: absolute; left: 10px;">
					<h4>
						<small>RECIPE ID : <%=recipe.getRecipe_id()%></small>
					</h4>
				</div>
				<hr>
				<div class="text-center">
				<h2><%=recipe.getRecipe_title()%></h2>
				<!-- recipe 작성자, 작성시각 -->
				<h5>
					<span class="glyphicon glyphicon-time"></span> Post by
					<%=recipeOwner.getUser_name()%>,
					<%=recipe.getTime()%>
				</h5>
				<!-- recipe 타입 -->
				<h5>
					<span class="label label-danger"><%=recipe.getNation_name()%></span>
					<span class="label label-primary"><%=recipe.getTy_name() %></span>
					<button type="button" class="btn btn-default btn-sm" onclick="likeBoard('<%=memberVO.getUser_id()%>','<%=boardVO.getBoard_num()%>','<%=recipe.getUser_id()%>');">
                	<span class="glyphicon glyphicon-thumbs-up"></span> Like
              		</button>
              		<span id="likeCnt"><%=boardVO.getBoard_like() %></span>
				</h5>
				<script>
					function likeBoard(user_id, board_num, writer) {
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
									document.getElementById("likeCnt").innerHTML = Number(document.getElementById("likeCnt").innerHTML) + 1;
								} else {
									document.getElementById("likeCnt").innerHTML = Number(document.getElementById("likeCnt").innerHTML) - 1;
								}
							}
						});
					}
				</script>     
				<br>
				<!-- recipe 간단 설명 -->
				<p>
					<%=recipe.getRecipe_desc()%>
				</p>
				<br>
				<!-- recipe 타이틀 이미지 -->
				<img src="<%=recipe.getImg_url()%>" class="img-rounded w3-animate-opacity" width="40%" />
				<h5>
					<small><%=recipe.getRecipe_title()%></small>
				</h5>
				<hr>
				<!-- recipe 과정 시작 -->
				<h2><%=recipe.getRecipe_title()%>
					만드는 법
				</h2>
				<br/>
				<div>
					<div id="openPro" style="cursor: pointer;" onclick="openPro(this);">
						<h5><b><span class="glyphicon glyphicon-menu-down"></span>&nbsp;과정 펼치기</b></h5>
					</div>
					<div id="closePro" style="cursor: pointer; display:none;" onclick="closePro(this);">
						<h5><b><span class="glyphicon glyphicon-menu-down"></span>&nbsp;과정 접기</b></h5>
					</div>
				</div>
				<script>
					function openPro(element) {
						element.style.display = "none";
						document.getElementById("closePro").style.display = "block";
						document.getElementById("Pro").style.display = "block";

					}
					function closePro(element) {
						element.style.display = "none";
						document.getElementById("openPro").style.display = "block";
						document.getElementById("Pro").style.display = "none";

					}
				</script>
				<br/>
				<!-- recipe 과정 시작 -->
				<div id="Pro" class="row container-fluid w3-animate-opacity" style="display:none;">
<%
				for(int i = 0; i < recipeProcess.size(); i++) {		
					try {
						RecipeProcessVO recipeProcessVO = recipeProcess.get(i); 
						
					if(!(recipeProcessVO.getStep_img_url().equals("null"))) {
%>					
					<div class="well col-sm-12">
						<div class="col-sm-6">		
								<img src="<%=recipeProcessVO.getStep_img_url() %>" class="img-rounded w3-animate-left" height="auto" width="100%"/>
						</div>
						<div class="col-sm-6">
								<p>과정 <%=recipeProcessVO.getCooking_no() %></p>
								<p>
									<%=recipeProcessVO.getCooking_desc() %>
								</p>
<%
						if(!(recipeProcessVO.getStep_tip().equals("null"))) {					
%>
								<br/><br/><small><small>과정 팁 : <%=recipeProcessVO.getStep_tip() %></small></small>
<%
						}
%>
						</div>
					</div>
<%
					} else {
%>
					<div class="col-sm-12 well">
						<div class="col-sm-12">
							<p>과정 <%=recipeProcessVO.getCooking_no() %></p>
							<p>
								<%=recipeProcessVO.getCooking_desc() %>
							</p>
<%
					if(!(recipeProcessVO.getStep_tip().equals("null"))) {
%>
						<small>과정 팁 : <%=recipeProcessVO.getStep_tip() %></small>
<%
					}
%>
						</div>
					</div>
<%		
					}
					} catch(Exception e) {
						e.printStackTrace();
					}
				}
%>
				</div>
				</div>
				<!-- recipe 과정 끝 -->
				<!-- 댓글 리스트 시작 -->
				<h4>댓글 남기기:</h4>
				<form role="form" id="reply">
					<div class="form-group">
						<textarea name="rep_content" class="form-control" rows="3" required style="resize:none;"></textarea>
						<input type="hidden" name="board_num" value="<%=boardVO.getBoard_num() %>" />
						<input type="hidden" name="user_id" value="<%=memberVO.getUser_id() %>" />
						<input type="hidden" name="user_img" value="<%=memberVO.getUser_img() %>" />
						<input type="hidden" name="writer" value="<%=recipeOwner.getUser_id()%>">
					</div>
				</form>
				<button class="btn btn-success" id="replySubmitBtn">댓글 달기</button>
				<br> <br>

				<p>
					<span class="badge" id="comments"><%=replyList.size() %></span> Comments:
				</p>
				<br>
				<!-- 댓글 리스트 시작 -->
				<div class="row w3-animate-bottom" id="replyList">
<%
				for(int k = 0; k < replyList.size(); k++) {
					BoardReplyVO boardReplyVO = replyList.get(k);
%>					
					<div class="reply w3-animate-bottom">
						<div class="col-sm-2 text-center">
							<img src="<%=boardReplyVO.getUser_img() %>" class="img-circle" height="65"
								width="65" alt="<%=boardReplyVO.getUser_id()%>">
						</div>
						<div class="col-sm-9">
							<h4>
								<%=boardReplyVO.getUser_id() %> <small><%=boardReplyVO.getRep_date() %></small>
							</h4>
							<p><%=boardReplyVO.getRep_content() %></p>
							<br>
						</div>
						<div class="col-sm-1">
							<button onclick="deletereply(this, '<%=boardReplyVO.getRep_date()%>', '<%=boardReplyVO.getUser_id()%>')" class="btn btn-default" style='border:none; outline:none;'>
								<span class='glyphicon glyphicon-remove'></span>
								<%-- <input type="hidden" name="rep_date" value="<%=boardReplyVO.getRep_date()%>"/>
								<input type="hidden" name="user_id" value="<%=boardReplyVO.getUser_id()%>"/> --%>
							</button>
						</div>
					</div>
<%
				}
%>
				</div>
			</div>
			<!-- 우측 메인 끝 -->
		</div>
		<!-- body wrapper 끝 -->
	</div>	
	<!-- 마지막 footer -->
	<footer class="container-fluid text-center">
	<p>MADI</p>
	</footer>
</body>
</html>