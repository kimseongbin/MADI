<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*,com.spring.madi.*"%>
<%@page import="com.spring.madi.MessageVO"%>
<%@page import="com.spring.madi.NotificationVO"%>
<%@page import="com.spring.madi.MemberVO"%>
<% 
	// Header에 들어갈 기본 정보 불러오기
	MemberVO memberVO= (MemberVO)request.getAttribute("memberVO");
	// 메시지 리시트 받아오기 
	ArrayList<MessageVO> messageList = (ArrayList<MessageVO>) request.getAttribute("messageList");
	// 알림 리스트 받아오기
	ArrayList<NotificationVO> notificationList = (ArrayList<NotificationVO>) request.getAttribute("notificationList");
	// 내 재료 목록 받아오기
	ArrayList<MemberBoxVO> myIrdntList = (ArrayList<MemberBoxVO>) request.getAttribute("myIrdntList");
	
	// myPage에서 사용할 기본 정보 
	// 내 팔로워 리스트 
	List<MemberVO> followerList= (ArrayList<MemberVO>)request.getAttribute("followerList");
	// 내가 팔로잉 리스트
	List<MemberVO> followingList= (ArrayList<MemberVO>)request.getAttribute("followingList");
	// 팔로잉 추천 리스트
	List<MemberFollowVO> recommendList= (ArrayList<MemberFollowVO>)request.getAttribute("recommendList");
	// 나의 게시판 목록
	List<BoardVO> myBoardList= (ArrayList<BoardVO>)request.getAttribute("myBoardList");
	// 팔로워 + 나 자신의 글 목록 불러옴
	List<BoardVO> allBoardList= (ArrayList<BoardVO>)request.getAttribute("allBoardList");
	// 모달창의 사진 클릭시 레시피로 이동함 
	List<RecipeVO> postList = (ArrayList<RecipeVO>)request.getAttribute("postList");
	//INCLUDE JSP 문서와 객체 공유
	request.setAttribute("memberVO", memberVO);
	request.setAttribute("notificationList", notificationList);
	request.setAttribute("messageList", messageList);
	request.setAttribute("myIrdntList", myIrdntList);

%>
<!DOCTYPE>
<html>
<head style="position: relative; z-index: 1; height: 260px;  margin:0 auto;">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마디 - 재료로  요리하다</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
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
	font-size: 17px;
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
    border : 0;
    float: left;
    font-size:15px;
}
/* 팔로워, 팔로잉 리스트 정렬 */
.ul.fol {
    list-style:none;
    margin:0;
    padding:0;
}

.li.fol {
    margin: 0 0 0 0;
    padding: 19px;
    border : 0;
    float: left;
    font-size:17px;
}
/* 팔로우 추천 정렬 */
.ul.fol2 {
    list-style:none;
    margin:0;
    padding:0;
}
.li.fol2 {
    padding: 4px;
    font-size:17px;
}
/* 본문 아이콘 정렬 */
.li.fol3 {
    padding: 2px;
    float: left;
    border : 0;
    margin: 0 0 0 0;
}
/* 내 사진 목록 */
.ul.hori2 {
	 list-style:none;
	 margin:0;
	 padding:10px;
}
	
.li.hori2 {
	margin: 5 5 5 5;
	padding: 14px;
	border : 10px;
	float: left;
	font-size:12px;
	width:70px;
	height:80px;
	}
/* follow 모달 크기 조절 */
.modal-dialog.follow-size {
    width: 470px;
    height: 50%;
    margin: 0;
    padding: 0;
}
.modal-content.follow-size {
    height: auto;
    min-height: 50%;
}
.modal.modal-center {
	    text-align: center;
}
@media screen and (min-width: 768px) {
    .modal.modal-center:before {
        display: inline-block;
        vertical-align: top;
        content: " ";
        height: 100%;
    }
}
.modal-dialog.modal-center {
    display: inline-block;
    text-align: left;
    vertical-align: top;
}
.xrs {
	 background-image: url('./resources/image/10.gif');
	}
</style>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script>
	function deleteFollowing(user_id, following_user_id) {
		//location.href="deleteFollowing.do?user_id=" + user_id + "&following_user_id=" + following_user_id;
		//alert("팔로잉 삭제 성공");
		var content = user_id+ "님께서 " + following_user_id+ "님을 팔로우 취소했습니다."
		$.ajax({
			url: "./deleteFollowing.do",
			type: "GET",
			data: {
				user_id: user_id,
				following_user_id: following_user_id,
				notice_to : following_user_id,
				notice_from : user_id,
				content : content,
				notice_type : "팔로잉 삭제"
			},
			dataType: "text",
			success: function(data) {
				alert(data);
				$("#following_modal").empty();
				$("#following_modal").append(data);
				followingMinus();
			}
		});
	}
	function deleteFollower(user_id, following_user_id) {
		//location.href="deleteFollowing.do?user_id=" + user_id + "&following_user_id=" + following_user_id;
		//alert("팔로워 삭제 성공");
		var content= user_id+ "님께서 " + following_user_id+ "님의 팔로우를 취소했습니다."
		$.ajax({
			url: "./deleteFollower.do",
			type: "GET",
			data: {
				user_id: user_id,
				following_user_id: following_user_id,
				notice_to : following_user_id,
				notice_from : user_id,
				content : content,
				notice_type : "팔로워 삭제"
			},
			dataType: "text",
			success: function(data) {
				alert(data);
				/* location.href="./mypage.do"; */
				$("#follower_modal").empty();
				$("#follower_modal").append(data);
				followerMinus();
			}
		});
	}
	function followRequest(user_id, following_user_id, user_img,
			following_user_img) {
		// 내가 날 팔로우할 순 없음
		if (user_id == following_user_id) {
			return;
		}

	}	
	function insertFollowing(user_id, following_user_id, user_img, following_user_img) {
		//location.href="insertFollowing.do?user_id=" + user_id + "&following_user_id=" + following_user_id +
		//"&user_img=" + user_img + "&following_user_img=" + following_user_img;
		//alert("팔로잉 추가 성공");
		var content= user_id+ "님께서 " + following_user_id+ "님을 팔로우 했습니다."
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
		
		var content= user_id+ "님께서" +board_num+ "번 게시물에 좋아요를 입력했습니다.";
		$.ajax({
			url: "./updateBoardLike.do",
			type: "GET",
			data: {
				user_id: user_id,
				board_num: board_num,
				notice_to : board_num,
				notice_from : user_id,
				content : content,
				notice_type : "좋아요 입력"
			},
			success: function(data) {
				/* location.href="./mypage.do"; */
				//alert("success");
				if (data == 0) {
					alert("좋아요 실패");
					document.getElementsByClassName("boardLike")[index].innerHTML = Number(document.getElementsByClassName("boardLike")[index].innerHTML) - 1;
				} else {
					alert("좋아요 성공");
					document.getElementsByClassName("boardLike")[index].innerHTML = Number(document.getElementsByClassName("boardLike")[index].innerHTML) + 1;				
				}
			}
		});
	}
	//게시글 누르면 자기 게시글만 보이게함
	function myBoard(user_id) {
		$.ajax({
			url: "./myBoard.do",
			type: "POST",
			data: {
				user_id: user_id
			},
			success: function(data) {
				alert("성공");
				$("#myBoard").empty();
				$("#myBoard").append(data);
			},
			error: function() {
				alert("실패");
			}
		});
	}
	//내 사진 보기
	function myPhoto(user_id) {
		$.ajax({
			url: "./myPhoto.do",
			type: "POST",
			data: {
				user_id: user_id
			},
			success: function(data) {
				alert("성공");
				$("#myBoard").empty();
				$("#myBoard").append(data);
			},
			error: function() {
				alert("실패");
			}
		});
	}
	//타임라인 보기
	function allBoard(user_id) {
		$.ajax({
			url: "./allBoard.do",
			type: "POST",
			data: {
				user_id: user_id
			},
			success: function(data) {
				alert("성공");
				$("#myBoard").empty();
				$("#myBoard").append(data);
			},
			error: function() {
				alert("실패");
			}
		})
	}
<<<<<<< HEAD
	//new 보드용 
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
=======
	// 내 정보 보기
	function myInfo(user_id) {
		$.ajax({
			url: "./myInfo.do",
			type: "POST",
			data: {
				user_id: user_id
			},
			success: function(data) {
				$("#myBoard").empty();
				$("#myBoard").append(data);
			},
			error: function() {
				alert('실패');
			}
		});
	}
</script>
</head>
<body class="w3-theme-l5">
	<!-- 헤더 시작 -->
	<div class="header">
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<!-- 컨테이너 시작 -->
	<div class="w3-container w3-content"
		style="max-width: 1400px; margin-top: 80px">
		<!-- w3-rom 시작 -->
		<div class="w3-row">
			<!-- Left Column -->
			<div class="w3-col m3">
				<!-- 프로필 -->
				<div class="w3-card w3-round w3-white">
					<div class="w3-container">
						<h4 class="w3-center">My Profile</h4>
						<p class="w3-center">
							<img src="<%=memberVO.getUser_img()%>" class="w3-circle"
								style="height: 106px; width: 106px" alt="Avatar">
						</p>
						<h4 style="text-align: center; font-color: #1245AB;"><%=memberVO.getUser_id()%></h4>
						<hr>
						<p>
							<i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i>
							Designer, UI
						</p>
						<p>
							<i class="fa fa-home fa-fw w3-margin-right w3-text-theme"></i>
							London, UK
						</p>
						<p>
							<i class="fa fa-at fa-fw w3-margin-right w3-text-theme"></i>
							AAA@gmail.com
						</p>
					</div>
				</div>
				<br>

				<!-- Accordion -->
				<div class="w3-card w3-round">
					<div class="w3-white">
						<button onclick="myFunction('following')"
							class="w3-button w3-block w3-theme-l1 w3-left-align">
							<i class="fa fa-users fa-fw w3-margin-right"></i> FOLLOWING
						</button>
						<div id="following" class="w3-hide w3-container">
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
						<button onclick="myFunction('follower')"
							class="w3-button w3-block w3-theme-l1 w3-left-align">
							<i class="fa fa-star fa-fw w3-margin-right"></i> FOLLOWER
						</button>
						<div id="follower" class="w3-hide w3-container">
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
						<button onclick="myFunction('photo')"
							class="w3-button w3-block w3-theme-l1 w3-left-align">
							<i class="fa fa-camera-retro fa-fw w3-margin-right"></i> PHOTO
						</button>
						<div id="photo" class="w3-hide w3-container">
							<div class="w3-row-padding" style="height: 300px; overflow-y: scroll;">
								<br>
								<!-- 사진 내용들 -->
									<%
										for (int i = 0; i < myBoardList.size(); i++) {
											BoardVO myBoard = myBoardList.get(i);
									%>
									<div class="w3-half container">
										<!-- <클릭 시 레시피 수정 화면으로 이동하자> -->
										<a
											href="./recipeDetail.do?recipe_id=<%=myBoard.getBoard_recipe_id()%>">
											<img src="<%=myBoard.getBoard_img()%>" alt="Avatar"
											class="image" style="width: 100%">
										</a>
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
						<p>Interests</p>
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

			<!-- Middle Column -->
			<div class="w3-col m6">
				<div class="w3-container btn-group">
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
				<!-- 글 시작 -->
				<div id="myBoard">
					<%
					for (int i = 0; i < allBoardList.size(); i++) {
						BoardVO board = allBoardList.get(i);
    				%>
					<div class="w3-container w3-card w3-white w3-round w3-margin">
						<br> <img src="<%=board.getUser_img()%>" alt="Avatar"
							class="w3-left w3-circle w3-margin-right" style="width: 60px">
						<span class="w3-right w3-opacity"><%=board.getBoard_time()%></span>
						<h4><%=board.getUser_id()%></h4>
						<br>
						<hr class="w3-clear">
						<img src="<%=board.getBoard_img()%>" style="width: 50%"
							class="w3-margin-bottom">
						<p>
							좋아요 :
							<%=board.getBoard_like()%></p>
						<p><%=board.getBoard_summry()%></p>
						<button type="button"
							class="w3-button w3-theme-d1 w3-margin-bottom" 
							onclick="updateBoardLike('<%=board.getBoard_num()%>', '<%=memberVO.getUser_id()%>', '<%=i%>')">
							<i class="fa fa-thumbs-up"></i>  Like
						</button>
						<button type="button"
							class="w3-button w3-theme-d2 w3-margin-bottom"
							onclick="myFunction('comment<%=board.getBoard_num()%>')">
							<i class="fa fa-comment"></i>  Comment
						</button>

						<!-- 댓글창 -->
						<div id="comment<%=board.getBoard_num()%>"
							class="w3-hide w3-container">
							<%
							List<BoardReplyVO> replyList = board.getBoardReplyList();
								for (int j = 0; j < replyList.size(); j++) {
								BoardReplyVO reply = replyList.get(j);
       						%>
							<p style="font-size: 27px; margin-bottom: 0px; margin-top: 0px;">
								<img src="<%=reply.getUser_img()%>" class="w3-circle"
									style="width: 40px;" alt="Avatar">
								<%=reply.getUser_id()%>
								:
								<%=reply.getRep_content()%></p>
							<%
								}//reply 끝
							%>
						</div>

					</div>
				<%
		    		}
				//게시글 for문 끝
		    %>
					<!-- div id 지정한거 끝 -->
				</div>
		
				<!-- End Middle Column -->
			</div>

			<!-- Right Column -->
			<div class="w3-col m2">
				<br>

				<div class="w3-card w3-round w3-white w3-center">
					<div class="w3-container">
						<p>나한테 팔로우 신청한 사람</p>
						<img src="./resources/profile/hansomedog.jpg" alt="Avatar" style="width: 50%"><br>
						<span>HANSOME DOG</span>
						<div class="w3-row w3-opacity">
							<div class="w3-half">
								<button class="w3-button w3-block w3-green w3-section"
									title="Accept">
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
					</div>
				</div>
				<br>

				<div class="w3-card w3-round w3-white w3-padding-16 w3-center">
				</div>
				<br>

				<div class="w3-card w3-round w3-white w3-padding-32 w3-center">
					<p>
						<i class="fa fa-bug w3-xxlarge"></i>
					</p>
				</div>

				<!-- 오른쪽 열 끝 -->
			</div>

			<!-- w3 rom 끝 -->
		</div>

		<!-- 컨테이너 끝 -->
	</div>
	<br>

	<!-- Footer -->
	<footer class="w3-container w3-theme-d3 w3-padding-16"
		style="text-align: center;">
		<h5>Footer</h5>
	</footer>

</body>
</html>