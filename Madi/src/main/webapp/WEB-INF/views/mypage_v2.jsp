<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.spring.madi.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// Header에 들어갈 기본 정보 불러오기
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
	// 메시지 리시트 받아오기 
	ArrayList<MessageVO> messageList = (ArrayList<MessageVO>) request.getAttribute("messageList");
	// 알림 리스트 받아오기
	ArrayList<NotificationVO> notificationList = (ArrayList<NotificationVO>) request.getAttribute("notificationList");
	// 내 재료 목록 받아오기
	ArrayList<MemberBoxVO> myIrdntList = (ArrayList<MemberBoxVO>) request.getAttribute("myIrdntList");

	// myPage에서 사용할 기본 정보 
	// 내 팔로워 리스트 
	List<MemberVO> followerList = (ArrayList<MemberVO>) request.getAttribute("followerList");
	// 내가 팔로잉 리스트
	List<MemberVO> followingList = (ArrayList<MemberVO>) request.getAttribute("followingList");
	// 팔로잉 추천 리스트
	Map<String, List<MemberVO>> recommendMap = (Map<String, List<MemberVO>>) request.getAttribute("recommendMap");
	// 팔로우 추천 리스트 <followers>
	List<MemberVO> followers = (ArrayList<MemberVO>) recommendMap.get("followers");
	// 팔로우 추천 리스트 <followerCnt>
	List<MemberVO> followerCnt = (ArrayList<MemberVO>) recommendMap.get("followerCnt");
	// 팔로우 추천 리스트 <likeCnt>
	List<MemberVO> likeCnt = (ArrayList<MemberVO>) recommendMap.get("likeCnt");
	// 팔로우 추천 리스트 <recipeCnt>
	List<MemberVO> recipeCnt = (ArrayList<MemberVO>) recommendMap.get("recipeCnt");
	// 나의 게시판 목록
	List<BoardVO> myBoardList = (ArrayList<BoardVO>) request.getAttribute("myBoardList");
	// 타임라인
	List<BoardVO> timeLine = (ArrayList<BoardVO>) request.getAttribute("timeLine");
	// 나한테 온 팔로우 신청
	ArrayList<NotificationVO> followRequest = (ArrayList<NotificationVO>) request.getAttribute("followRequest"); 
	//INCLUDE JSP 문서와 객체 공유
	request.setAttribute("memberVO", memberVO);
	request.setAttribute("notificationList", notificationList);
	request.setAttribute("messageList", messageList);
	request.setAttribute("myIrdntList", myIrdntList);
%>
<html>
<head>
<title>마디 - 재료로 요리하다</title>
<meta charset="UTF-8">
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
html, body, h1, h2, h3, h4, h5 {
	font-family: "Open Sans", sans-serif
}

.parallax {
    /* The image used */
    background-image: url('https://static.pexels.com/photos/616330/pexels-photo-616330.jpeg');

    /* Full height */
    height: 100%; 

    /* Create the parallax scrolling effect */
    background-attachment: fixed;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover; 
}
/* 사용자 배경 타이틀 이미지 */
.bg {
	background-image: url("./resources/image/wallpaper.jpg");
	background-size: cover;
	margin-top: 10px;
}
/* 사용자 배경 타이틀 이미지 */
/* 회원 사진 포토 Hover 효과 */
.container {
	position: relative;
	width: 50%;
}

.image {
	opacity: 1;
	display: block;
	width: 100%;
	height: auto;
	transition: .5s ease;
	backface-visibility: hidden;
}

.middle {
	transition: .5s ease;
	opacity: 0;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%)
}

.container:hover .image {
	opacity: 0.3;
}

.container:hover .middle {
	opacity: 1;
}
/* 회원 사진 포토 Hover 효과 */
</style>

<script>
	/* 팔로잉 리스트 삭제 */
	function deleteFollowing(element, user_id, following_user_id) {
		$.ajax({
			url : "./deleteFollowing.do",
			type : "GET",
			data : {
				user_id : user_id,
				following_user_id : following_user_id
			},
			success : function(data) {
				element.parentNode.remove();
			}
		});
	}
	/* 팔로워 리스트 삭제 */
	function deleteFollower(element, user_id, following_user_id) {
		$.ajax({
			url : "./deleteFollower.do",
			type : "GET",
			data : {
				user_id : user_id,
				following_user_id : following_user_id,
			},
			success : function(data) {
				element.parentNode.remove();
			}
		});
	}
	/* 팔로우 요청 */
	function followRequest(user_id, following_user_id, user_img, following_user_img) {
		// 내가 날 팔로우할 순 없음
		if (user_id == following_user_id) {
			return;
		}
		$.ajax({
			url : "./followRequest.do",
			type : "POST",
			data : {
				user_id : user_id,
				following_user_id : following_user_id,
				user_img : user_img,
				following_user_img : following_user_img,
			},
			success : function(data) {
				alert(data);
				if (data == 0) {
					alert("이미 팔로우 한 회원입니다.");
				} else if (data == 1) {
					alert("현재 " + following_user_id + "님의 요청 수락을 기다리고 있습니다.");
				} else if (data == 2) {
					alert(following_user_id + "님께 팔로우를 신청하셨습니다.");
				}
			}
		});
	}
	/* 게시판 좋아요 */
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
					$(element).find("img").attr("src","./resources/image/Heart_Outline_96px.png");
				} else {
					$(element).find("img").attr("src","./resources/image/Heart_96px.png");
				}
			}
		});
	}
	/* 전체 탭 */
	function openDefault(e, tab) {
		document.getElementById(tab).style.display = "block";
		document.getElementById("myBoard").style.display = "none";
		document.getElementById("updateMember").style.display = "none";
		
		tablinks = document.getElementsByClassName("tablink");
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].className = tablinks[i].className.replace(" w3-red", "");
		}
		e.className += " w3-red"
	}
	/* 이미지 텝 */
	function openImage(e, tab) {
		document.getElementById(tab).style.display = "block";
		document.getElementById("timeLine").style.display = "none";
		document.getElementById("updateMember").style.display = "none";
		
		tablinks = document.getElementsByClassName("tablink");
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].className = tablinks[i].className.replace(" w3-red", "");
		}
		e.className += " w3-red"
	}
	/* 재료 텝 */
	function openIrdnt(e, tab) {
		document.getElementById(tab).style.display = "block";
		document.getElementById("timeLine").style.display = "none";
		document.getElementById("myBoard").style.display = "none";
		
		tablinks = document.getElementsByClassName("tablink");
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].className = tablinks[i].className.replace(" w3-red", "");
		}
		e.className += " w3-red"
	}
	/* 댓글 접었다 펼쳤다 */
	function replyHandle(e) {
		var dp = $(e).siblings("div[class='reply']").css("display");
		if(dp == "block") {
			$(e).siblings("div[class='reply']").css("display", "none");
		} else {
			$(e).siblings("div[class='reply']").css("display", "block");
		}
	}
	/* 댓글 등록 */
	function submitReply(e, i, sid) {
		var param = $(e).siblings("form").serialize();
		var id = "#"+sid+i;
		$.ajax({
			url: "./writeBoard.do?page=mypage",
			type: "POST",
			data: param,
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			dataType: "text",
			success: function(data) {
				$(id).empty();
				$(id).append(data);
			}
		});
	}
	/* 팔로우 신청 업데이트 */
	function updateNotificationF(notice_id, followAdmit) {
		var id = "#n"+notice_id;
		var idf = "#folreq"+notice_id;
		$.ajax({
			url: "./updateNotification.do",
			type: "POST",
			data: {
				notice_id : notice_id,
				followAdmit : followAdmit
			},
			success: function() {
				document.getElementById("no").innerHTML = Number(document.getElementById("no").innerHTML) - 1;
				if(document.getElementById("no").innerHTML == 0) {
					$("#notificationList").append("<li class='list-group-item'>메시지가 없습니다.</li>");
				}
				$(idf).remove();
				$(id).remove();
			}
		});
	}
</script>
</head>
<body class="w3-theme-l5 parallax">
	
	<!-- Header -->
	<div class="header">
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<!-- Header -->
	
	<!-- Page Container -->
	<div class="w3-container w3-content w3-animate-opacity" style="max-width:1600px; margin-top:1%; position: relative;">    
  		<!-- The Grid -->
  		<div class="w3-row">
    		<!-- Left Column -->
    		<div class="w3-col m3" style="top:7%; position:relative;">
      			<!-- Profile -->
      			<div class="w3-card-4 w3-round w3-white">
        			<div class="w3-container">
        				<div class="w3-container bg" style="height: 180px;"></div>
         				<div style="margin-top: -53px;">
							<p class="w3-center">
								<img src="<%=memberVO.getUser_img()%>" class="w3-circle" style="height: 106px; width: 106px" alt="Avatar">
							</p>
							<h3 class="w3-center text-primary"><%=memberVO.getUser_name()%> 님</h3>
						</div>
						<hr>
						<!-- 상태 메시지 (회원정보 수정 폼에)-->
						<p>
							<i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i>
							외로움, 배고파
						</p>
						<!-- 간단 거주지 (회원정보 수정 폼에)-->
						<p>
							<i class="fa fa-home fa-fw w3-margin-right w3-text-theme"></i>
							서울, 대한민국
						</p>
						<!-- email 이미지 아이콘 추가 할 것 -->
						<p>
							<i class="fa fa-birthday-cake fa-fw w3-margin-right w3-text-theme"></i>
							<%=memberVO.getUser_email()%>
						</p>
        			</div>
      			</div>
      			<br>
      			<!-- Accordion -->
      			<div class="w3-card-4 w3-round">
        			<div class="w3-white">
          				<button onclick="myFunction('Demo1')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i> My Followings</button>
          				<div id="Demo1" class="w3-hide w3-container" style="padding-left:0; padding-right:0;">
            				<ul class="w3-ul w3-hoverable" id="followingList" style="text-align: center;">
<%
								if(followingList.size() == 0) {
%>
									<li class="w3-animate-opacity">현재 회원님께선 아직 팔로잉한 친구가 없습니다.</li>
<%
								} else {
									for(int i = 0; i < followingList.size(); i++) {
										MemberVO following = followingList.get(i);
%>
            						<li class="w3-animate-left">
            							<img src="<%=following.getUser_img()%>" class="img-circle" height="30" width="30">
            							&nbsp;
            							<strong><%=following.getUser_name()%></strong>
										&nbsp;
										<button type="button" class="btn btn-danger btn-sm"	onclick="deleteFollowing(this,'<%=memberVO.getUser_id()%>', '<%=following.getUser_id()%>')" style="border-radius: 20px;">
											<strong>삭제</strong>
										</button>
            						</li>
<%
									}
								}
%>
            				</ul>
          				</div>
          				<button onclick="myFunction('Demo2')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i> My Followers</button>
          				<div id="Demo2" class="w3-hide w3-container" style="padding-left:0; padding-right:0;">
            				<ul class="w3-ul w3-hoverable" id="following_modal" style="text-align: center;">
<%
								if(followerList.size() == 0) {
%>
            					<li class="w3-animate-opacity">현재 회원님의 팔로워 목록이 비어있습니다.</li>
<%
								} else {
									for(int i = 0; i < followerList.size(); i++) {
										MemberVO follower = followerList.get(i);
%>
            					<li class="w3-animate-left">
            						<img src="<%=follower.getUser_img()%>" class="img-circle" height="30" width="30">
            						&nbsp;
            						<strong><%=follower.getUser_name()%></strong>
									&nbsp;
									<button type="button" class="btn btn-danger btn-sm"	onclick="deleteFollower(this,'<%=memberVO.getUser_id()%>', '<%=follower.getUser_id()%>')" style="border-radius: 20px;">
										<strong>삭제</strong>
									</button>
            					</li>
<%									}
								}
%>
            				</ul>
          				</div>
          				<button onclick="myFunction('Demo3')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-users fa-fw w3-margin-right"></i> My Photos</button>
          				<div id="Demo3" class="w3-hide w3-container w3-animate-opacity" style="height: 600px; overflow-y: scroll;">
         					<div class="w3-row-padding">
         						<br>
           						<div class="w3-row-padding">
<%
								if(myBoardList.size() == 0) {
%>
									<div class="w3-animate-opacity text-center text-muted" style="margin-top:25%;">
										레시피를 등록해주세요
										<br/>
										<span class="glyphicon glyphicon-picture" style="font-size:100px;"></span>
									</div>
<%
								} else {
									for(int i = 0; i < myBoardList.size(); i++) {
										BoardVO myBoard = myBoardList.get(i);
%>									<div class="w3-half container">
										<a href="./recipeDetail.do?recipe_id=<%=myBoard.getBoard_num()%>">
											<img src="<%=myBoard.getBoard_img()%>" alt="Avatar" class="image" style="width: 100%">
										</a>
										<div class="middle">
											<div class="text">
												<small><b><%=myBoard.getBoard_title()%></b></small>
											</div>
										</div>
									</div>
<%
									}
								}
%>
								</div>
         					</div>
          				</div>
        			</div>      
      			</div>
      			<br>
      			<!-- Interests --> 
      			<div class="w3-card-4 w3-round w3-white w3-hide-small">
        			<div class="w3-container w3-padding">
          				<p>내 냉장고</p>
          				<p>
<%
							for(int i = 0; i < myIrdntList.size(); i++) {
								MemberBoxVO irdnt = myIrdntList.get(i);
								if(i % 6 == 1) {
%>
				            		<span class="w3-tag w3-small w3-theme-d1"><%=irdnt.getMy_irdnt() %></span>
<%								
								} else if(i % 6 == 2) {
%>
									<span class="w3-tag w3-small w3-theme-d2"><%=irdnt.getMy_irdnt() %></span>
<%
								} else if(i % 6 == 3) {
%>
									<span class="w3-tag w3-small w3-theme-d3"><%=irdnt.getMy_irdnt() %></span>
<%
								} else if(i % 6 == 4) {
%>
									<span class="w3-tag w3-small w3-theme-d4"><%=irdnt.getMy_irdnt() %></span>
<%
								} else if(i % 6 == 5) {
%>
									<span class="w3-tag w3-small w3-theme-d5"><%=irdnt.getMy_irdnt() %></span>
<%									
								} else {
%>
									<span class="w3-tag w3-small w3-theme-l3"><%=irdnt.getMy_irdnt() %></span>
<%									
								}
							}
%>
          				</p>
        			</div>
      			</div>
      			<br>
      
      			<!-- Alert Box -->
      			<div class="w3-container w3-display-container w3-round w3-theme-l4 w3-border w3-theme-border w3-margin-bottom w3-hide-small w3-padding">
        			<span onclick="this.parentElement.style.display='none'" class="w3-button w3-theme-l3 w3-display-topright">
          			<i class="fa fa-remove"></i>
        			</span>
        			<p><strong>환영합니다!</strong></p>
        			<p>마디에 레시피를 등록하고 친구들과 공유해주세요.</p>
      			</div>
    
    			<!-- End Left Column -->
    		</div>
    
    		<!-- Middle Column -->
    		<div class="w3-col m7">
    			<!-- Middle Colum Tab Menu -->
      			<div class="w3-row-padding">
        			<div class="w3-col m12">
          				<!-- 검색 결과를 전체, 이미지, 재료순에 따라 보여주기 위한 텝 -->
						<div class="w3-bar bar-tabs">
    						<button class="w3-bar-item w3-button tablink w3-red" onclick="openDefault(this, 'timeLine')">타임라인</button>
    						<button class="w3-bar-item w3-button tablink" onclick="openImage(this, 'myBoard')">게시글</button>
    						<button class="w3-bar-item w3-button tablink" onclick="openIrdnt(this, 'updateMember')">회원정보</button>
  						</div>
        			</div>
      			</div>
				<!-- 타임라인 Component -->
				<div id="timeLine">
<%
					if(timeLine.size() == 0) {
%>
						<div class="w3-animate-opacity text-center text-muted" style="margin-top:25%;">
							팔로우 목록이 비어있어 타임라인을 불러오지 못 했어요.
							<br/>
							<a href="./postList.do">소셜에서 사람들의 레시피를 보고 친구를 맺어주세요.</a>
							<br/>
							<span class="glyphicon glyphicon-picture" style="font-size:100px;"></span>
						</div>
<% 					
					} else {
						for(int i = 0; i < timeLine.size(); i++) {
							BoardVO board = timeLine.get(i);
%>
					
					<div class="w3-container w3-card-4 w3-white w3-round w3-margin w3-animate-opacity"><br>
	        			<img src="<%=board.getUser_img()%>" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px; height:60px;">
	        			<span class="w3-right w3-opacity"><%=board.getBoard_time() %></span>
	        			<h4><%=board.getUser_name()%></h4>
	        			<h5><%=board.getUser_email() %></h5>
	        			<hr class="w3-clear">
	          			<div class="w3-row-padding" style="margin:0 -16px">
	            			<div class="w3-middle">
	              				<a href="./recipeDetail.do?recipe_id=<%=board.getBoard_num()%>"><img src="<%=board.getBoard_img() %>" style="width:100%" alt="Northern Lights" class="w3-margin-bottom"></a>
	            			</div>
	        			</div>
	        			<p>
	        				<%=board.getBoard_summry()%>
	        			</p>
	       				<button type="button" class="w3-button w3-theme-d1 w3-margin-bottom" onclick="likeBoard(this, '<%=memberVO.getUser_id()%>','<%=board.getBoard_num()%>','<%=board.getUser_id()%>');">
	       					<img src="./resources/image/Heart_96px.png" width="20px">&nbsp;좋아요
	       				</button> 
	        			<button type="button" class="w3-button w3-theme-d2 w3-margin-bottom" onclick="replyHandle(this);"><i class="fa fa-comment"></i>&nbsp;댓글</button>
	        			<div class="reply" style="display:none;">
	        				<div class="w3-row w3-padding w3-animate-opacity">
        						<div class="w3-col m12">
          							<div class="w3-white">
           								<div class="w3-container-fluid">
              								<h6 class="w3-opacity">댓글 남기기</h6>
              								<form>
              									<input type="text" name="rep_content" class="w3-border w3-padding" style="width:100%; margin-bottom:1%;"/>
              									<input type="hidden" name="board_num" value="<%=board.getBoard_num() %>"/>
              									<input type="hidden" name="user_id" value="<%=memberVO.getUser_id()%>"/>
              									<input type="hidden" name="user_img" value="<%=memberVO.getUser_img() %>"/>
              									<input type="hidden" name="writer" value="<%=board.getUser_id() %>"/> 
              								</form>
              								<button type="button" class="w3-button w3-theme" onclick="submitReply(this, <%=i%>, 't');"><i class="fa fa-pencil"></i>&nbsp;댓글달기</button> 
            							</div>
          							</div>	
        						</div>
        						<hr class="w3-clear">
        						<div id="t<%=i%>">
<%
								ArrayList<BoardReplyVO> replyList = (ArrayList<BoardReplyVO>) board.getBoardReplyList();
								for(int j = 0; j < replyList.size(); j++) {
									BoardReplyVO rep = replyList.get(j);
%>									
	        						<div class="w3-col m12 w3-animate-opacity">
	        							<div class="w3-col m12 w3-white w3-margin">
	        								<img src="<%=rep.getUser_img() %>" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px; height: 60px;">
	        								<span><b><%=rep.getUser_id() %></b></span>
	        								<p>
		        								<%=rep.getRep_content() %>
	        								</p>
	        							</div>
	        						</div>
<%
								}
%>
								</div>
      						</div>
	        			</div>  
	      			</div>
<%						}
					}
%>	      			
      			</div>
      			
      			<!-- 내 게시글 Component -->
				<div id="myBoard" style="display:none;">
					
<%
					if(myBoardList.size() == 0) {
%>
						<div class="w3-animate-opacity text-center text-muted" style="margin-top:25%;">
							현재 회원님의 등록된 게시글이 존재하지 않네요.
							<br/>
							<a href="./postList.do">소셜에서 레시피를 작성해 주세요.</a>
							<br/>
							<span class="glyphicon glyphicon-picture" style="font-size:100px;"></span>
						</div>
<%
					} else {
						for(int i = 0; i < myBoardList.size(); i++) {
							BoardVO board = myBoardList.get(i);
%>
					
					<div class="w3-container w3-card-4 w3-white w3-round w3-margin w3-animate-opacity"><br>
	        			<img src="<%=board.getUser_img()%>" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px; height:60px;">
	        			<span class="w3-right w3-opacity"><%=board.getBoard_time() %></span>
	        			<h4><%=board.getUser_name()%></h4>
	        			<h5><%=board.getUser_email() %></h5>
	        			<hr class="w3-clear">
	          			<div class="w3-row-padding" style="margin:0 -16px">
	            			<div class="w3-middle">
	              				<a href="./recipeDetail.do?recipe_id=<%=board.getBoard_num()%>"><img src="<%=board.getBoard_img() %>" style="width:100%" alt="Northern Lights" class="w3-margin-bottom"></a>
	            			</div>
	        			</div>
	        			<p>
	        				<%=board.getBoard_summry()%>
	        			</p>
	       				<button type="button" class="w3-button w3-theme-d1 w3-margin-bottom" onclick="likeBoard(this, '<%=memberVO.getUser_id()%>','<%=board.getBoard_num()%>','<%=board.getUser_id()%>');">
	       					<img src="./resources/image/Heart_96px.png" width="20px">&nbsp;좋아요
	       				</button> 
	        			<button type="button" class="w3-button w3-theme-d2 w3-margin-bottom" onclick="replyHandle(this);"><i class="fa fa-comment"></i>&nbsp;댓글</button>
	        			<div class="reply" style="display:none;">
	        				<div class="w3-row w3-padding w3-animate-opacity">
        						<div class="w3-col m12">
          							<div class="w3-white">
           								<div class="w3-container-fluid">
              								<h6 class="w3-opacity">댓글 남기기</h6>
              								<form>
              									<input type="text" name="rep_content" class="w3-border w3-padding" style="width:100%; margin-bottom:1%;"/>
              									<input type="hidden" name="board_num" value="<%=board.getBoard_num() %>"/>
              									<input type="hidden" name="user_id" value="<%=memberVO.getUser_id()%>"/>
              									<input type="hidden" name="user_img" value="<%=memberVO.getUser_img() %>"/>
              									<input type="hidden" name="writer" value="<%=board.getUser_id() %>"/> 
              								</form>
              								<button type="button" class="w3-button w3-theme" onclick="submitReply(this, <%=i%>, 'm');"><i class="fa fa-pencil"></i>&nbsp;댓글달기</button> 
            							</div>
          							</div>	
        						</div>
        						<hr class="w3-clear">
        						<div id="m<%=i%>">
<%
								ArrayList<BoardReplyVO> replyList = (ArrayList<BoardReplyVO>) board.getBoardReplyList();
								for(int j = 0; j < replyList.size(); j++) {
									BoardReplyVO rep = replyList.get(j);
%>									
	        						<div class="w3-col m12 w3-animate-opacity">
	        							<div class="w3-col m12 w3-white w3-margin">
	        								<img src="<%=rep.getUser_img() %>" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px; height: 60px;">
	        								<span><b><%=rep.getUser_id() %></b></span>
	        								<p>
		        								<%=rep.getRep_content() %>
	        								</p>
	        							</div>
	        						</div>
<%
								}
%>
								</div>
      						</div>
	        			</div>  
	      			</div>
<%						}
					}
%>	      
					
      			</div>
      			<!-- 회원수정 Component -->
				<div id="updateMember" style="display:none;">
					<!-- <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
	        			<img src="/w3images/avatar2.png" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
	        			<span class="w3-right w3-opacity">1 min</span>
	        			<h4>John Doe</h4><br>
	        			<hr class="w3-clear">
	        			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
	          			<div class="w3-row-padding" style="margin:0 -16px">
	            			<div class="w3-half">
	              				<img src="/w3images/lights.jpg" style="width:100%" alt="Northern Lights" class="w3-margin-bottom">
	            			</div>
	            			<div class="w3-half">
	              				<img src="/w3images/nature.jpg" style="width:100%" alt="Nature" class="w3-margin-bottom">
	          				</div>
	        			</div>
	       				<button type="button" class="w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up"></i>  Like</button> 
	        			<button type="button" class="w3-button w3-theme-d2 w3-margin-bottom"><i class="fa fa-comment"></i>  Comment</button> 
	      			</div> -->
      			</div>
    		<!-- End Middle Column -->
  			</div>
    
    		<!-- Right Column -->
    		<div class="w3-col m2">
    			<!-- 팔로워 추천 리스트 -->
    			<div class="w3-card-4 w3-round w3-white w3-center">				
<%
				int half = recipeCnt.size() / 2;
				for(int i = 0; i < recipeCnt.size(); i++) {
					MemberVO recfol = recipeCnt.get(i);
					if(half == i) {
%>
					<div class="recfol w3-animate-opacity" style="display:block;">
						<div class="w3-red" style="border-radius: 4px 4px 0 0;">팔로워 추천</div>
	        			<div class="w3-container w3-padding" style="position:relative;">
	          				<span class="glyphicon glyphicon-chevron-left" style="position:absolute; left:1%; top:25%; cursor:pointer;" onclick="recToUpper(this.parentNode.parentNode);"></span>
	          				<img src="<%=recfol.getUser_img()%>" alt="Forest" style="width:100%;">
	          				<span class="glyphicon glyphicon-chevron-right" style="position:absolute; right:1%; top:25%; cursor:pointer;" onclick="recToBelow(this.parentNode.parentNode);"></span>
	          				<br/><br/>
	          				<p style="margin-bottom:0;"><strong><%=recfol.getUser_name() %></strong></p>
	          				<p><%=recfol.getUser_email()%></p>
	          				<p>
	          					<button type="button" class="btn btn-danger btn-sm"	onclick="followRequest('<%=memberVO.getUser_id() %>','<%=recfol.getUser_id()%>', '<%=memberVO.getUser_img()%>', '<%=recfol.getUser_email() %>')" style="border-radius: 20px;">
										<strong>팔로우</strong>
								</button>
	          				</p>
	        			</div>
	      			</div>
<%
					continue; }
					
%>				
	      			<div class="recfol w3-animate-opacity" style="display:none;">
						<div class="w3-red" style="border-radius: 4px 4px 0 0;">팔로워 추천</div>
	        			<div class="w3-container w3-padding" style="position:relative;">
	          				<span class="glyphicon glyphicon-chevron-left" style="position:absolute; left:1%; top:25%; cursor:pointer;" onclick="recToUpper(this.parentNode.parentNode);"></span>
	          				<img src="<%=recfol.getUser_img()%>" alt="Forest" style="width:100%;">
	          				<span class="glyphicon glyphicon-chevron-right" style="position:absolute; right:1%; top:25%; cursor:pointer;" onclick="recToBelow(this.parentNode.parentNode);"></span>
	          				<br/><br/>
	          				<p style="margin-bottom:0;"><strong><%=recfol.getUser_name() %></strong></p>
	          				<p><%=recfol.getUser_email()%></p>
	          				<p>
	          					<button type="button" class="btn btn-danger btn-sm"	onclick="followRequest('<%=memberVO.getUser_id() %>','<%=recfol.getUser_id()%>', '<%=memberVO.getUser_img()%>', '<%=recfol.getUser_email() %>')" style="border-radius: 20px;">
										<strong>팔로우</strong>
								</button>
	          				</p>
	        			</div>
	      			</div>
<%
				}
%>

				</div>
				<script>
				function recToUpper(e) {
					if($(e).prev().attr("class") != "recfol w3-animate-opacity") {
						return;
					}
					$(e).css("display", "none");
					$(e).prev("div[class='recfol']").css("display", "block");
				}
				function recToBelow(e) {
					if($(e).next().attr("class") != "recfol w3-animate-opacity") {
						return;
					}
					$(e).css("display", "none");
					$(e).next("div[class='recfol']").css("display", "block");
				}
				</script>
      			<br>
      			
      			
      			<!-- 팔로우 신청한 사람들 띄워주는 곳 -->
      			<div class="w3-card-4 w3-round w3-white w3-center">
<%
      			int half_req = followRequest.size() / 2;
				for(int i = 0; i < followRequest.size(); i++) {
					NotificationVO folreq = followRequest.get(i);
					if(half_req == i) {
%>
					<div class="folreq w3-animate-opacity" style="display:block;" id="folreq<%=folreq.getNotice_id()%>">
						<div class="w3-red" style="border-radius: 4px 4px 0 0;">팔로우 요청</div>
	        			<div class="w3-container w3-padding" style="position:relative;">
	          				<span class="glyphicon glyphicon-chevron-left" style="position:absolute; left:1%; top:25%; cursor:pointer;" onclick="recToUpper(this.parentNode.parentNode);"></span>
	          				<img src="<%=folreq.getNotice_from_img()%>" alt="Forest" style="width:100%;">
	          				<span class="glyphicon glyphicon-chevron-right" style="position:absolute; right:1%; top:25%; cursor:pointer;" onclick="recToBelow(this.parentNode.parentNode);"></span>
	          				<br/><br/>
	          				<p style="margin-bottom:0;"><strong><%=folreq.getNotice_from_name() %></strong></p>
	          				<p>
	          					<button type="button" class="btn btn-info btn-sm"	onclick="updateNotificationF('<%=folreq.getNotice_id()%>', '수락');" style="border-radius: 20px;">
										<strong>수락</strong>
								</button>
								<button type="button" class="btn btn-danger btn-sm"	onclick="updateNotificationF('<%=folreq.getNotice_id()%>', '거절');" style="border-radius: 20px;">
										<strong>거부</strong>
								</button>
	          				</p>
	        			</div>
	      			</div>
<%
					continue; }
%>				
	      			<div class="folreq w3-animate-opacity" style="display:none;" id="folreq<%=folreq.getNotice_id()%>">
						<div class="w3-red" style="border-radius: 4px 4px 0 0;">팔로워 추천</div>
	        			<div class="w3-container w3-padding" style="position:relative;">
	          				<span class="glyphicon glyphicon-chevron-left" style="position:absolute; left:1%; top:25%; cursor:pointer;" onclick="recToUpperF('<%=folreq.getNotice_id()%>');"></span>
	          				<img src="<%=folreq.getNotice_from_img()%>" alt="Forest" style="width:100%;">
	          				<span class="glyphicon glyphicon-chevron-right" style="position:absolute; right:1%; top:25%; cursor:pointer;" onclick="recToBelowF('<%=folreq.getNotice_id()%>');"></span>
	          				<br/><br/>
	          				<p style="margin-bottom:0;"><strong><%=folreq.getNotice_from_name() %></strong></p>
	          				<p>
	          					<button type="button" class="btn btn-info btn-sm"	onclick="updateNotificationF('<%=folreq.getNotice_id()%>', '수락');" style="border-radius: 20px;">
										<strong>수락</strong>
								</button>
								<button type="button" class="btn btn-danger btn-sm"	onclick="updateNotificationF('<%=folreq.getNotice_id()%>', '거절');" style="border-radius: 20px;">
										<strong>거부</strong>
								</button>
	          				</p>
	        			</div>
	      			</div>
<%
				}
%>

				</div>
				<script>
				function recToUpperF(notice_id) {
					var e = "#folreq"+notice_id;
					if($(e).prev().attr("class") != "folreq w3-animate-opacity") {
						return;
					}
					$(e).css("display", "none");
					$(e).prev("div[class='rfolreq w3-animate-opacity']").css("display", "block");
				}
				function recToBelowF(notice_id) {
					var e = "#folreq"+notice_id;
					if($(e).next().attr("class") != "folreq w3-animate-opacity") {
						return;
					}
					$(e).css("display", "none");
					$(e).next("div[class='folreq w3-animate-opacity']").css("display", "block");
				}
				</script>
      			<br>
      
      			<div class="w3-card-4 w3-round w3-white w3-padding-16 w3-center">
        			<p>ADS</p>
      			</div>
      			<br>
      
      			<div class="w3-card w3-round w3-white w3-padding-32 w3-center">
        			<p><i class="fa fa-bug w3-xxlarge"></i></p>
      			</div>

		    <!-- End Right Column -->
    		</div>
    
		<!-- End Grid -->
  		</div>
  
	<!-- End Page Container -->
	</div>
<br>
<script>
// Accordion
function myFunction(id) {
    var x = document.getElementById(id);
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
        x.previousElementSibling.className += " w3-theme-d1";
    } else { 
        x.className = x.className.replace("w3-show", "");
        x.previousElementSibling.className = 
        x.previousElementSibling.className.replace(" w3-theme-d1", "");
    }
}
</script>
<footer class="container-fluid text-center" style="position:relative; bottom:0; width:100%;">
	<p>MADI</p>
</footer>
</body>
</html>