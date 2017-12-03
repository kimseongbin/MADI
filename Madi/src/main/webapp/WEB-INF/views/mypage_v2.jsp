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
	ArrayList<NotificationVO> notificationList = (ArrayList<NotificationVO>) request
			.getAttribute("notificationList");
	// 내 재료 목록 받아오기
	ArrayList<MemberBoxVO> myIrdntList = (ArrayList<MemberBoxVO>) request.getAttribute("myIrdntList");

	// myPage에서 사용할 기본 정보 
	// 내 팔로워 리스트 
	List<MemberVO> followerList = (ArrayList<MemberVO>) request.getAttribute("followerList");
	// 내가 팔로잉 리스트
	List<MemberVO> followingList = (ArrayList<MemberVO>) request.getAttribute("followingList");
	// 팔로잉 추천 리스트
	Map<String, List<MemberVO>> recommendMap = (Map<String, List<MemberVO>>) request
			.getAttribute("recommendMap");
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
	// 팔로워 + 나 자신의 글 목록 불러옴
	List<BoardVO> allBoardList = (ArrayList<BoardVO>) request.getAttribute("allBoardList");
	// 모달창의 사진 클릭시 레시피로 이동함 
	List<RecipeVO> postList = (ArrayList<RecipeVO>) request.getAttribute("postList");
	//INCLUDE JSP 문서와 객체 공유
	request.setAttribute("memberVO", memberVO);
	request.setAttribute("notificationList", notificationList);
	request.setAttribute("messageList", messageList);
	request.setAttribute("myIrdntList", myIrdntList);
%>
<html>
<head>
<title>W3.CSS Template</title>
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
	function deleteFollowing(element, user_id, following_user_id) {
		$.ajax({
			url : "./deleteFollowing.do",
			type : "GET",
			data : {
				user_id : user_id,
				following_user_id : following_user_id
			},
			success : function(data) {
				element.parent().remove();
				document.getElementById("followingSize").innerHTML = data;
			}
		});
	}
	function deleteFollower(element, user_id, following_user_id) {
		$.ajax({
			url : "./deleteFollower.do",
			type : "GET",
			data : {
				user_id : user_id,
				following_user_id : following_user_id,
			},
			success : function(data) {
				element.parent().remove();
				document.getElementById("followerSize").innerHTML = data;
			}
		});
	}
	function followRequest(user_id, following_user_id, user_img,
			following_user_img) {
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
	function updateBoardLike(board_num, user_id, index) {
		//location.href="updateBoardLike.do?user_id=" + user_id;

		var content = user_id + "님께서" + board_num + "번 게시물에 좋아요를 입력했습니다.";
		$
				.ajax({
					url : "./updateBoardLike.do",
					type : "GET",
					data : {
						user_id : user_id,
						board_num : board_num,
						notice_to : board_num,
						notice_from : user_id,
						content : content,
						notice_type : "좋아요 입력"
					},
					success : function(data) {
						/* location.href="./mypage.do"; */
						//alert("success");
						if (data == 0) {
							alert("좋아요 실패");
							document.getElementsByClassName("boardLike")[index].innerHTML = Number(document
									.getElementsByClassName("boardLike")[index].innerHTML) - 1;
						} else {
							alert("좋아요 성공");
							document.getElementsByClassName("boardLike")[index].innerHTML = Number(document
									.getElementsByClassName("boardLike")[index].innerHTML) + 1;
						}
					}
				});
	}
	//게시글 누르면 자기 게시글만 보이게함
	function myBoard(user_id) {
		$.ajax({
			url : "./myBoard.do",
			type : "POST",
			data : {
				user_id : user_id
			},
			success : function(data) {
				alert("성공");
				$("#myBoard").empty();
				$("#myBoard").append(data);
			},
			error : function() {
				alert("실패");
			}
		});
	}
	//내 사진 보기
	function myPhoto(user_id) {
		$.ajax({
			url : "./myPhoto.do",
			type : "POST",
			data : {
				user_id : user_id
			},
			success : function(data) {
				alert("성공");
				$("#myBoard").empty();
				$("#myBoard").append(data);
			},
			error : function() {
				alert("실패");
			}
		});
	}
	//타임라인 보기
	function allBoard(user_id) {
		$.ajax({
			url : "./allBoard.do",
			type : "POST",
			data : {
				user_id : user_id
			},
			success : function(data) {
				alert("성공");
				$("#myBoard").empty();
				$("#myBoard").append(data);
			},
			error : function() {
				alert("실패");
			}
		})
	}
	// 내 정보 보기
	function myInfo(user_id) {
		$.ajax({
			url : "./myInfo.do",
			type : "POST",
			data : {
				user_id : user_id
			},
			success : function(data) {
				$("#myBoard").empty();
				$("#myBoard").append(data);
			},
			error : function() {
				alert('실패');
			}
		});
	}
</script>
</head>
<body class="w3-theme-l5">
	<!-- Header -->
	<div class="header">
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<!-- Page Container -->
	<div class="w3-container w3-content"
		style="max-width: 1400px; margin-top: 30px">
		<!-- The Grid -->
		<div class="w3-row">
			<!-- Left Column -->
			<div class="w3-col m3">

				<!-- Profile -->
				<div class="w3-card w3-round w3-white">
					<div class="w3-container">
						<div class="w3-container bg" style="height: 180px;"></div>
						<div style="margin-top: -53px;">
							<p class="w3-center">
								<img src="<%=memberVO.getUser_img()%>" class="w3-circle"
									style="height: 106px; width: 106px" alt="Avatar">
							</p>
							<h3 class="w3-center text-primary"><%=memberVO.getUser_name()%> 님
							</h3>
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
							<i
								class="fa fa-birthday-cake fa-fw w3-margin-right w3-text-theme"></i>
							<%=memberVO.getUser_email()%></p>
					</div>
				</div>
				<br>

				<!-- Accordion -->
				<!-- 팔로잉 보기 -->
				<div class="w3-card w3-round">
					<div class="w3-white">
						<button onclick="myFunction('following')"
							class="w3-button w3-block w3-theme-l1 w3-left-align">
							<i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i>
							FOLLOWING
						</button>
						<div id="following" class="w3-hide w3-container-fluid">
							<ul class="w3-ul w3-hoverable" id="following_modal"
								style="text-align: center;">
								<%
									if (followingList.size() == 0) {
								%>
								<li class="w3-animate-opacity">현재 회원님께선 아직 팔로잉한 친구가 없습니다.</li>
								<%
									} else {
										for (int j = 0; j < followingList.size(); j++) {
											MemberVO following = followingList.get(j);
								%>
								<li class="w3-animate-left"><img
									src="<%=following.getUser_img()%>" class="img-circle"
									height="30" width="30"> &nbsp; <strong><%=following.getUser_name()%></strong>
									&nbsp;
									<button type="button" class="btn btn-danger btn-sm"
										onclick="deleteFollowing(this,'<%=memberVO.getUser_id()%>', '<%=following.getUser_id()%>')"
										style="border-radius: 20px;">
										<strong>삭제</strong>
									</button></li>
								<%
									}
									}
								%>
							</ul>
						</div>
						<!-- 팔로워 보기 -->
						<button onclick="myFunction('follower')"
							class="w3-button w3-block w3-theme-l1 w3-left-align">
							<i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i>
							FOLLOWER
						</button>
						<div id="follower" class="w3-hide w3-container-fluid">
							<ul class="w3-ul w3-hoverable" id="following_modal"
								style="text-align: center;">
								<%
									if (followerList.size() == 0) {
								%>
								<li class="w3-animate-opacity">현재 회원님의 팔로워 목록이 비어있습니다.</li>
								<%
									} else {
										for (int i = 0; i < followerList.size(); i++) {
											MemberVO follower = followerList.get(i);
								%>
								<li class="w3-animate-left"><img
									src="<%=follower.getUser_img()%>" class="img-circle"
									height="30" width="30"> &nbsp; <strong><%=follower.getUser_name()%></strong>
									&nbsp;
									<button type="button" class="btn btn-danger btn-sm"
										onclick="deleteFollowing(this,'<%=memberVO.getUser_id()%>', '<%=follower.getUser_id()%>')"
										style="border-radius: 20px;">
										<strong>삭제</strong>
									</button></li>
								<%
									}
									}
								%>
							</ul>
						</div>
						<!-- 사진보기 -->
						<button onclick="myFunction('myPhoto')"
							class="w3-button w3-block w3-theme-l1 w3-left-align">
							<i class="fa fa-users fa-fw w3-margin-right"></i> My Photos
						</button>
						<div id="myPhoto" class="w3-hide w3-container"
							style="height: 600px; overflow-y: scroll;">
							<div class="w3-row-padding">
								<br>
								<%
									for (int i = 0; i < myBoardList.size(); i++) {
										BoardVO myBoard = myBoardList.get(i);
								%>
								<div class="w3-half container">
									<!-- <클릭 시 레시피 수정 화면으로 이동하자> -->
									<a
										href="./recipeRewrite.do?board_num=<%=myBoard.getBoard_num()%>">
										<img src="<%=myBoard.getBoard_img()%>" alt="Avatar"
										class="image" style="width: 100%">
									</a>
									<div class="middle">
										<div class="text">
											<small><b><%=myBoard.getBoard_title()%></b></small>
										</div>
									</div>
								</div>
								<%
									}
								%>
							</div>
						</div>
					</div>
				</div>
				<br>

				<!-- Interests -->
				<div class="w3-card w3-round w3-white w3-hide-small">
					<div class="w3-container">
						<p>
							<b>Interests</b>
						</p>
						<p>
							<span class="w3-tag w3-small w3-theme-d5">한식</span>
							<span class="w3-tag w3-small w3-theme-d4">일식</span>
							<span class="w3-tag w3-small w3-theme-d3">중식</span>
							<span class="w3-tag w3-small w3-theme-d2">Games</span>
							<span class="w3-tag w3-small w3-theme-d1">Friends</span>
							<span class="w3-tag w3-small w3-theme">Games</span>
							<span class="w3-tag w3-small w3-theme-l1">Friends</span>
							<span class="w3-tag w3-small w3-theme-l2">Food</span>
							<span class="w3-tag w3-small w3-theme-l3">Design</span>
							<span class="w3-tag w3-small w3-theme-l4">Art</span>
							<span class="w3-tag w3-small w3-theme-l5">Photos</span>
						</p>
					</div>
				</div>
				<br>
				<!-- End Left Column -->
			</div>
			<!-- 여백 주는 공란 -->

			<!-- middle side -->
			<div class="col-sm-6">
				<div class="row">
					<div class="col-sm-7 btn-group" style="padding-left: 0px;">
						<button type="button" class="btn btn-default"
							onclick="allBoard('<%=memberVO.getUser_id()%>')">타임라인</button>
						<button type="button" class="btn btn-default"
							onclick="myBoard('<%=memberVO.getUser_id()%>')">게시글</button>
						<button type="button" class="btn btn-default"
							style="cursor: pointer; margin-bottom: 0px;"
							onclick="myPhoto('<%=memberVO.getUser_id()%>')">사진</button>
						<button type="button" class="btn btn-default"
							style="cursor: pointer; margin-bottom: 0px;" onclick="">정보</button>
					</div>
				</div>
				<div class="row text-center" id="myBoard"
					style="border-radius: 10px;">
					<!-- 본문 글 시작 -->
					<%
						for (int i = 0; i < allBoardList.size(); i++) {
							BoardVO board = allBoardList.get(i);
					%>
					<div class="well content_color" style="padding-bottom: 0px;">
						<div class="row">
							<div class="col-sm-4" style="font-size: 16px; text-align: left;">
								<!-- profile -->
								<img src="<%=board.getUser_img()%>" class="img-circle"
									height="40" width="40">&nbsp;<a href="#"><strong><%=board.getUser_id()%></strong></a>
							</div>
							<!-- title -->
							<div class="col-sm-8" style="text-align: left;">
								<p>
									<strong style="font-size: 25px;"><%=board.getBoard_title()%></strong>
								</p>
							</div>
						</div>
						<!-- image and date, like-->
						<img src="<%=board.getBoard_img()%>"
							style="width: 40%; height: 40%;" class="img-squere"><br>
						<div class="row">
							<table style="border-spacing: 20px; font-size: 17px;">
								<tr>
									<td>
										<p>
											<%=board.getBoard_time()%>
										</p>
									</td>
									<td><span class="glyphicon glyphicon-heart"
										style="padding-bottom: 14px;"></span></td>
									<td>
										<p style="padding-bottom: 3px;">
											<em class="boardLike"><%=board.getBoard_like()%></em>
										</p>
									</td>
								</tr>
							</table>
						</div>
						<!-- 글 내용 -->
						<div class="row">
							<p style="font-size: 17px;"><%=board.getBoard_summry()%></p>
						</div>
						<br> <br>
						<!-- Icon -->
						<div class="row">
							<div class="pull-left">
								<div class="w3-container w3-card w3-white w3-round w3-margin">
									<button type="button" class="w3-button w3-theme-d2 w3-margin-bottom"
									 data-toggle="collapse" data-target="#comment<%=board.getBoard_num()%>">
									<i class="fa fa-comment"></i>  Comment
									</button> 
									<button type="button" class="w3-button w3-theme-d1 w3-margin-bottom" 
										onclick="updateBoardLike('<%=board.getBoard_num()%>', '<%=memberVO.getUser_id()%>', '<%=i%>')">
										<i class="fa fa-thumbs-up"></i>  Like
									</button> 
								</div>
							</div>
						</div>
						<!-- 댓글 comment -->
						<div id="comment<%=board.getBoard_num()%>" class="collapse">
							<ul class="list-group" style="text-align: left;">
								<%
									List<BoardReplyVO> replyList = board.getBoardReplyList();
										for (int j = 0; j < replyList.size(); j++) {
											BoardReplyVO reply = replyList.get(j);
								%>
								<li class="list-group-item"><img
									src="<%=reply.getUser_img()%>" class="img-circle" height="30"
									width="30">&nbsp; <a href="#"><strong><%=reply.getUser_id()%></strong></a>
									&emsp; <strong><%=reply.getRep_content()%></strong></li>
								<%
									} // for replyList
								%>
							</ul>
						</div>
						<!-- 본문 글 끝 -->
					</div>
					<%
						} // for allBoardList
					%>
				</div>
		<!-- middle side end -->
			</div>
			<!-- Right Column -->
			<div class="w3-col m2">
				<div class="w3-card w3-round w3-white w3-center">
					<div class="w3-container">
						<p>...</p>
					</div>
				</div>
				<br>
				<!-- 팔로우 받기 -->
				<div class="w3-card w3-round w3-white w3-center">
					<div class="w3-container">
						<p>Friend Request</p>
						<%
						for(int i = 0; i < followers.size(); i++) {
							MemberVO rec = followers.get(i);
						%>
						<img src="<%=rec.getUser_img()%>" alt="Avatar"
							style="width: 50%"><br> <strong class="text-primary"><%=rec.getUser_id()%></strong>
						<div class="w3-row w3-opacity">
							<div class="w3-half">
								<button class="w3-button w3-block w3-green w3-section"
									title="Accept" 
									onclick="followRequest('<%=memberVO.getUser_id() %>',  '<%=rec.getUser_id() %>', '<%=memberVO.getUser_img() %>', '<%=rec.getUser_img() %>')"
									style="border-radius: 10px;">
												
									<i class="fa fa-check"></i>
								</button>
							</div>
							<div class="w3-half">
								<button class="w3-button w3-block w3-red w3-section"
									title="Decline">
									<i class="fa fa-remove"></i>
								</button>
							</div>
						</div>
						<%
						}
						%>
					</div>
				</div>
				<br>
				<!-- 딱정벌레 -->
				<div class="w3-card w3-round w3-white w3-padding-32 w3-center">
					<p>
						<i class="fa fa-bug w3-xxlarge"></i>
					</p>
				</div>

				<!-- End Right Column -->
			</div>

			<!-- End Grid -->
		</div>

		<!-- End Page Container -->
	</div>
	<br>

	<!-- Footer -->
	<footer class="container-fluid text-center">
		<p>MADI</p>
	</footer>

	<script>
		// Accordion
		function myFunction(id) {
			var x = document.getElementById(id);
			if (x.className.indexOf("w3-show") == -1) {
				x.className += " w3-show";
				x.previousElementSibling.className += " w3-theme-d1";
			} else {
				x.className = x.className.replace("w3-show", "");
				x.previousElementSibling.className = x.previousElementSibling.className
						.replace(" w3-theme-d1", "");
			}
		}

		// Used to toggle the menu on smaller screens when clicking on the menu button
		function openNav() {
			var x = document.getElementById("navDemo");
			if (x.className.indexOf("w3-show") == -1) {
				x.className += " w3-show";
			} else {
				x.className = x.className.replace(" w3-show", "");
			}
		}
	</script>

</body>
</html>
