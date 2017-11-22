<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*,com.spring.madi.*"%>
<%
//로그인한 아이디
String user_id = (String)session.getAttribute("user_id");

MemberVO myInfo= (MemberVO)request.getAttribute("myInfo");

List<MemberFollowVO> followerList= (ArrayList<MemberFollowVO>)request.getAttribute("followerList");

List<MemberFollowVO> followingList= (ArrayList<MemberFollowVO>)request.getAttribute("followingList");

List<MemberFollowVO> recommendList= (ArrayList<MemberFollowVO>)request.getAttribute("recommendList");

List<BoardVO> boardList= (ArrayList<BoardVO>)request.getAttribute("getBoards");

List<BoardReplyVO> boardReplyList= (ArrayList<BoardReplyVO>)request.getAttribute("boardReplyList");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=divice-width, initial-scale=1">
<title>MADI MAIN PAGE</title>
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
.well.content_color{
 	background-color:#FFFFFF;
}
/* 냉장고 재료들 리스트 정렬 */
.ul.hori {
    list-style:none;
    margin:0;
    padding:0;
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
    padding: 15px;
    border : 0;
    float: left;
    font-size:17px;
}
</style>
<script>
	function updateBoardLike(){
		location.href="updateBoardLike.do";
	}

	function deleteFollowing(following_user_id) {
		location.href="deleteFollowing.do?following_user_id=" + following_user_id;
	}
	
	function insertFollowing(user_id, following_user_id) {
		location.href="insertFollowing.do";
	}
</script>
</head>
<body style="background-color: #F6F6F6;">
	<!-- 헤더 시작 -->
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
					</button>
				</li>
				<!-- 냉장고 아이콘 -->
				<li>
					<div style="padding-top: 9px;">
						<button type="button" class="btn form" data-toggle="modal"
							data-target="#fridge">
							<img src="./resources/food_icon/fridge.png" style="width:20px; height:20px;">
						</button>
						<!-- 냉장고 모달바 -->
						<div class="modal fade" id="fridge" tableindex="-1" role="dialog" 
						aria-labelledy="modallabel">
							<div class="modal-dialog modal-lg" role="document">
						    	<!-- content 시작 -->
						        <div class="modal-content">
						        <!-- 탭 -->
						        	<div class="modal-header" style="background-color:#DE4F4F;">
						          		<button type="button" class="close" data-dismiss="modal">&times;</button>	
						            	<h3 style="color:#FFFFFF; text-align:center;">
						            	<img src="./resources/food_icon/fridge_white.png" style="width:35px; height:35px;">
						            	<strong>냉장고 재료들</strong></h3>	
						            </div>
						            <div class="modal-body" style="text-align:center;">
						            	<div class="row">
						            <!-- 왼쪽 카테고리 -->
						            		<div class="col-sm-2">
						            			<ul class="nav nav-stacked">
						            				<li class="active">
						            					<a data-toggle="tab" href="#menu1">
						            						<strong>주재료</strong>
						            					</a>
						            				</li>
						            				<li>
						            					<a data-toggle="tab" href="#menu2">
						            						<strong>부재료</strong>
						            					</a>
						            				</li>
						            				<li>
						            					<a data-toggle="tab" href="#menu3">
						            						<strong>양념/소스</strong>
						            					</a>
						            				</li>
						            			</ul>
						            		</div>
						            <!--  가운데 리스트 나열 -->
						            		<div class="col-sm-8" style="background-color:#FFD8D8; text-align:center;">
						            			<div class="tab-content">
						            <!-- 메뉴1 주재료 -->
						            				<div id="menu1" class="tab-pane fade in active">
												        <ul class="ul hori">
												        	<li class="li hori">
				                                                <a href="#" class="text-muted">
				                                                	<img src="./resources/food_icon/bean.png"
				                                                      style="width: 35px; height: 35px;"><br><strong>녹두</strong>
				                                                </a>
												        	</li>
												        	<li class="li hori">
				                                                <a href="#" class="text-muted">
				                                                	<img src="./resources/food_icon/bean.png"
				                                                      style="width: 35px; height: 35px;"><br><strong>녹두</strong>
				                                                </a>
												        	</li>
												         </ul>
						            				</div>
						           <!-- 메뉴2 부재료-->
						            				<div id="menu2" class="tab-pane fade">
												        <ul class="ul hori">
												        	<li class="li hori">
				                                                <a href="#" class="text-muted">
				                                                	<img src="./resources/food_icon/bean.png"
				                                                      style="width: 35px; height: 35px;"><br><strong>녹두</strong>
				                                                </a>
												        	</li>
												        	<li class="li hori">
				                                                <a href="#" class="text-muted">
				                                                	<img src="./resources/food_icon/bean.png"
				                                                      style="width: 35px; height: 35px;"><br><strong>녹두</strong>
				                                                </a>
												        	</li>
												         </ul>
						            				</div>
						            <!-- 메뉴3 양념/조미료 -->
							            			<div id="menu3" class="tab-pane fade">
												        <ul class="ul hori">
												        	<li class="li hori">
				                                                <a href="#" class="text-muted">
				                                                	<img src="./resources/food_icon/bean.png"
				                                                      style="width: 35px; height: 35px;"><br><strong>녹두</strong>
				                                                </a>
												        	</li>
												        	<li class="li hori">
				                                                <a href="#" class="text-muted">
				                                                	<img src="./resources/food_icon/bean.png"
				                                                      style="width: 35px; height: 35px;"><br><strong>녹두</strong>
				                                                </a>
												        	</li>
												         </ul>
							            			</div>
							       <!-- 재료 입력 끝 -->
						            			</div>
						            		</div>
						       		<!-- 오른쪽 내가 가진 재료들? -->
						            		<div class="col-sm-2">
						            		</div>
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
				<!-- profile 아이콘(누르면 mypage로 넘어간다) -->
				<li>
					<div class="dropdown" style="padding-top: 9px; padding-left: 2px;">
						<button class="btn dropdown-toggle form" type="button"
							data-toggle="dropdown">
							<span class="glyphicon glyphicon-user color"></span>
						</button>
						<ul class="dropdown-menu" style="text-align: center; background-color:#F6F6F6;">
							<li><img src="<%=myInfo.getUser_img()%>" class="img-circle" height="70"
								width="70" alt="Avatar"></li>
							<li>
								<h4>
									<p class="text-primary"><%=myInfo.getUser_id()%></p>
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
							<span class="glyphicon glyphicon-align-justify color" style="padding-right:7px;"></span>
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
														<div class="col-sm-6">
															<h4 class="text-primary" style="">이글이글</h4>
														</div>
													</div>
													<!-- 알림 내용들 -->
													<li class="list-group-item"><img src="./resources/profile/bird.jpg"
														class="img-circle" height="20" width="20" alt="Avatar">
														<a>AAA</a><em> 님이 ~~~ 게시물을 공유했습니다.</em></li>
													<li class="list-group-item"><img src="./resources/profile/bird.jpg"
														class="img-circle" height="20" width="20" alt="Avatar">
														<a>AAA</a><em> 님이 ~~~ 게시물을 공유했습니다.</em></li>
													<li class="list-group-item"><img src="./resources/profile/bird.jpg"
														class="img-circle" height="20" width="20" alt="Avatar">
														<a>AAA</a><em> 님이 ~~~ 게시물을 공유했습니다.</em></li>
												</ul>
											</div>
											<div id="message" class="tab-pane fade">
												<ul class="list-group">
													<div class="row">
														<div class="col-sm-2" style="padding-bottom: 5px;">
															<img src="./resources/profile/bird.jpg" class="img-circle" height="40"
																width="40" alt="Avatar">
														</div>
														<div class="col-sm-6">
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
														alt="Avatar"> <a>AAA</a> <strong>: "지금
															뭐하는지"</strong></li>
													<li class="list-group-item"><strong>From </strong> <img
														src="./resources/profile/bird.jpg" class="img-circle" height="20" width="20"
														alt="Avatar"> <a>AAA</a> <strong>: "지금
															뭐하는지"</strong></li>
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
	<!-- 내용 시작 -->
	<div class="container">
		<!--left side -->
		<div class="row">
			<div class="col-sm-3 text-center" style="border-radius: 10px;">
				<div>
					<img src="<%=myInfo.getUser_img()%>" class="img-circle" height="65" width="65"
						alt="Avatar"> <br>
					<h4>
						<p class="text-primary" style="font-size: 20px;">
							<strong><%=myInfo.getUser_id()%></strong>
						</p>
					</h4>
					<h5><strong><%=myInfo.getUser_email()%></strong></h5>
					<br>
					<!-- 게시글, 팔로워, 팔로잉 -->
					<div class="row text-center" style="font-size: 14px;">
                    	<div class="col-sm-2"></div>
						<div class="col-sm-3">
							<p data-target="#follower"><strong class="bg-danger">게시글</strong>
                            <br>
                            <%=boardList.size()%>
                            </p>
						</div>
						<div class="col-sm-3">
							<p style="cursor: pointer" data-toggle="modal" data-target="#follower">
							<strong class="bg-danger">팔로워</strong>
                            <br>
                            <%=followerList.size()%>
                            </p>
						</div>
						<div class="col-sm-3">
							<p style="cursor: pointer" data-toggle="modal" data-target="#following">
							<strong class="bg-danger">팔로잉</strong>
                            <br>
                            <%=followingList.size()%>
                            </p>
						</div>
                        <div class="col-sm-1"></div>
					</div>
					<br>
					<!-- 팔로워 모달 -->
					<div class="modal fade" id="follower" role="dialog">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header" style="background-color: #DE4F4F;">
									<h3 class="modal-title">
										<strong style="color:#FFFFFF;">Follower 목록</strong>
									</h3>
								</div>
								<!-- 팔로워 Content -->
								<div class="modal-body">
									<div class="btn-group-vertical">
										<form>
											<ul class="ul fol">
											<%for(int i= 0; i<followerList.size(); i++) {
												MemberFollowVO follower= followerList.get(i);
												MemberVO follower1= (MemberVO)request.getAttribute("follower1");
											%>
												<li class="li fol">
											        <img src="<%=follower1.getUser_img()%>" class="img-circle" height="40"
													width="40">&nbsp;<a href="#"><strong><%=follower.getUser_id()%></strong></a>
													&nbsp;
													<button type="button" class="btn btn-danger btn-sm"
													onclick="deleteFollowing('<%=follower.getUser_id()%>')"
													style="border-radius: 20px;"><strong>삭제</strong></button>
											    </li>
										    <%} %>
										    </ul>
									    </form>
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
					<div class="modal fade" id="following" role="dialog">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header" style="background-color: #DE4F4F;">
									<h3 class="modal-title">
										<strong style="color:#FFFFFF;">Following 목록</strong>
									</h3>
								</div>
								<!-- 팔로잉 Content -->
								<div class="modal-body">
									<div class="btn-group-vertical">
										<ul class="ul fol">
											<%for(int j= 0; j<followerList.size(); j++) {
												MemberFollowVO following= followingList.get(j);
												MemberVO following1= (MemberVO)request.getAttribute("following1");
											%>
												<li class="li fol">
											        <img src="<%=following1.getUser_img()%>" class="img-circle" height="40"
													width="40">&nbsp;<a href="#"><strong><%=following.getUser_id()%></strong></a>
													&nbsp;
													<button type="button" class="btn btn-danger btn-sm"
													onclick="deleteFollowing('<%=following.getUser_id()%>')"
													style="border-radius: 20px;"><strong>삭제</strong></button>
											    </li>
										    <%} %>
									    </ul>
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
				<div style="margin-top: 20%; margin-right:20px;">
					<h4 style="margin-bottom:10px; margin-left:30px;">
						<strong>팔로워 추천 : </strong><a href="#">새로고침</a>
					</h4>
					<div class="btn-group-vertical" style="font-size: 17px; background-color: #F6F6F6">
						<ul>
						<%for(int z=0; z<3; z++) {
							MemberFollowVO recommend= recommendList.get(z);
							MemberVO recommendUser= (MemberVO)request.getAttribute("recommendUser");
						%>
							<p><img src="<%=recommendUser.getUser_img()%>" class="img-circle" height="30"
								width="30">&nbsp; <a href="#"><strong><%=recommend.getUser_id()%></strong></a>
								&emsp;
								<button type="button" class="btn btn-danger btn"
								style="border-radius: 10px;">
								<strong>팔로우</strong>
								</button>&nbsp;
							</p>
						<%} %>
						</ul>

					</div>
				</div>
			</div>

			<!-- middle side -->
			<div class="col-sm-7">
				<div class="row text-center" style="border-radius: 10px;">
					<!-- 본문 글 시작 -->
				<%
					for(int i=0; i<boardList.size(); i++) {
						BoardVO board= boardList.get(i);
						MemberVO user= (MemberVO)request.getAttribute("user");
				%>
					<div class="well content_color">
						<div class="row">
							<div class="col-sm-3" style="font-size: 16px; text-align: left;">
								<!-- profile -->
								<img src="<%=user.getUser_img()%>" class="img-circle" height="35" width="35">&nbsp;<a
									href="#"><strong><%=board.getUser_id()%></strong></a>
							</div>
							<!-- title -->
							<div class="col-sm-9" style="text-align: left;">
								<h4>
									<strong><%=board.getBoard_title()%></strong>
								</h4>
							</div>
						</div>
						<!-- image and date, like-->
						<img src="<%=board.getBoard_img()%>" style="width:30%; height:30%;" class="img-squere"><br>
						<div class="row">
							<table style="border-spacing: 20px; font-size: 17px;">
								<tr>
									<td>
										<p>
											<strong><%=board.getBoard_time()%></strong>
										</p>
									</td>
									<td><span class="glyphicon glyphicon-heart"
										style="padding-bottom: 14px;"></span></td>
									<td>
										<p style="padding-bottom: 3px;">
											<em><%=board.getBoard_like()%></em>
										</p>
									</td>
								</tr>
							</table>
						</div>
						<!-- 글 내용 -->
						<div class="row">
							<p style="font-size: 17px;"><%=board.getBoard_summry()%></p>
						</div>
						<br>
						<br>
						<!-- Icon -->
						<div class="row">
							<div class="pull-right">
								<span style="cursor: pointer" class="glyphicon glyphicon-comment icon-size"
									data-toggle="collapse" data-target="#comment"></span>&emsp;
								<span class="glyphicon glyphicon-heart icon-size"></span> &emsp; 
								<span class="glyphicon glyphicon-share-alt icon-size"></span>&emsp; 
							</div>
						</div> 
						<!-- comment -->
						<div id="comment" class="collapse">
							<ul class="list-group" style="text-align: left;">
							<%for(int j=0; j<boardReplyList.size(); j++) {
								BoardReplyVO reply= boardReplyList.get(i);
								MemberVO commentuser= (MemberVO)request.getAttribute("commentuser");
							%>
								<li class="list-group-item">
									<img src="<%=commentuser.getUser_img()%>"
									class="img-circle" height="30" width="30">&nbsp; <a
									href="#"><strong><%=reply.getUser_id()%></strong></a> &emsp;
									<strong><%=reply.getRep_content()%></strong>
								</li>
							<%} %>
							</ul>
						</div>
					</div>
				<%} %>
				<!-- 본문 글 끝 -->
				</div>
			</div>
		</div>
	</div>
	<footer class="container-fluid text-center">
	<p>MADI</p>
	</footer>
</body>
</html>