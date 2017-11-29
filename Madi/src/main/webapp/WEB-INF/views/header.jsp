<%@page import="com.spring.madi.MemberBoxVO"%>
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
<%
	//내 정보 받아오기
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
	//냉장고 정보 받아오기
	ArrayList<MemberBoxVO> myMemberBoxList= (ArrayList<MemberBoxVO>) request.getAttribute("myMemberBox");

	//메시지 리시트 받아오기 
	ArrayList<MessageVO> messageList = (ArrayList<MessageVO>) request.getAttribute("messageList");
	// 알림 리스트 받아오기
	ArrayList<NotificationVO> notificationList = (ArrayList<NotificationVO>) request.getAttribute("notificationList");
	// 내 재료 목록 받아오기
	ArrayList<MemberBoxVO> myIrdntList = (ArrayList<MemberBoxVO>) request.getAttribute("myIrdntList");
%>
  <style>  	
  	/*font 설정*/
  	@import url('https://fonts.googleapis.com/css?family=Pacifico');
	@import url('https://fonts.googleapis.com/earlyaccess/nanumgothic.css');	
	@import url('http://fonts.googleapis.com/earlyaccess/hanna.css');
	@import url('http://fonts.googleapis.com/earlyaccess/jejugothic.css');
	
	.madi_title {
		font-family: 'Pacifico', cursive;
		font-size: 55px;
	}
	
	.madi_logo {
		font-family: 'Pacifico', cursive;
		font-size: 37px;
		color: #f5f5f5;
	}
	
	.madi_subtitle {
		font-family: 'jejugothic';
		font-size: 48px;
		font-weight: bold;
	}
	
	.madi_content {
		font-family: 'jejugothic';
	}
	
	.madi_cc {
		font-family: 'Pacifico', cursive;
		font-size: 40px;
	}
	    
	footer {
	    background-color: #DE4F4F;
	    color: white;
	    padding: 15px;
	}  	
	/* ICON Design */
	.header.glyphicon {
	    font-size: 17px;
	}
	.header.glyphicon.top {
	    color: #000000;
	}
	.header.glyphicon.glyphicon-comment {
	    color: #4C4C4C;
	}
	.header.glyphicon.glyphicon-heart {
	    color: #DB005B;
	}
	.header.glyphicon.glyphicon-pencil {
	    color: #3D3D3D;
	}
	.header.glyphicon.glyphicon-share-alt {
	    color: #487BE1;
	}
	.header.glyphicon.icon-size {
	    font-size: 25px;
	}
  	
	/* 헤더버튼 주변색 */
	.header.btn.form {
	    background-color: #DE4F4F;
	}

	/*헤더 색*/
	.header.navbar.head {
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
	/* 알림창 Modal 크기 조절 */
	.modal-dialog.modal-size {
	    width: 300px;
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
	<!-- 헤더 스타일 끝 -->
	
	/*postModal*/
	@media (min-width: 600px) {
	    #navbar_toggle {
	      postion:absolute; /* Hide the carousel text when the screen is less than 600 pixels wide */
	      right: 0;
	    }
  	}
  	
  	.header.bg-1 {
	      color: #bdbdbd;
	}
	    
	.header.list-group-item:first-child {
		border-top-right-radius: 0;
	    border-top-left-radius: 0;
	}
	.header.list-group-item:last-child {
		border-bottom-right-radius: 0;
	    border-bottom-left-radius: 0;
	}
	  
	.header.btn {
	    padding: 10px 20px;
	    background-color: #DE4F4F;
	    color: #f1f1f1;
	    border-radius: 0;
	    transition: .2s;
	}
	.header.btn:hover, .btn:focus {
	    color: #000;
	 	outline: none;   
	}
	.header.modal-header, .header.h4, .close {
	    background-color: #DE4F4F;
	    color: #fff !important;
	    text-align: center;
	    font-size: 30px;
	}
	
	/* 냉장고 재료들 리스트 정렬 */
	.ul.hori {
	    list-style:none;
	    margin:0;
	    padding:0;
	}
	
	.li.hori {
	    margin: 0 0 0 0;
	    padding: 14px;
	    border : 0;
	    float: left;
	    font-size:12px;
	    width:70px;
	    height:80px;
	}

  </style>
<!-- 헤더 시작 -->
 <nav class="navbar navbar-default head header" data-spy="affix" data-offset-top="197">
    <div class="container-fluid">
        <div class="navbar-header header" style="padding-right: 0;" id="navbar_toggle">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar" style="background-color:#DE4F4F;">
                <span class="icon-bar" style="background-color:white;"></span>
                <span class="icon-bar" style="background-color:white;"></span>
                <span class="icon-bar" style="background-color:white;"></span>
            </button>
            <a class="navbar-brand" href="#"><font class="madi_logo">Madi</font></a>
        </div>
        <!--검색 창 -->
        <div class="collapse navbar-collapse" id="myNavbar" align="center">
            <ul class="nav navbar-nav navbar" style="text-align: center;">
                <form class="navbar-form navbar-right" role="search" style="margin-left: auto; margin-right: auto;">
                    <div class="form-group input-group">
                        <input type="text" class="form-control" placeholder="Search.." size="80%"> 
	                        	<span class="input-group-btn">
	                            <button class="btn btn-default" type="button" style="padding-bottom:2px; margin-top:1px;s">
	                                <span class="glyphicon glyphicon-search header"></span>
	                            </button>
                        	</span>
                    </div>
                </form>
            </ul>
              <!--오른쪽 아이콘 -->
            <ul class="nav navbar-nav navbar-right" style="vertical-align: middle;">
                <!--home 아이콘 -->
                <li>
                	<button type="button" class="btn form header" style="padding-top: 10px; margin-top:10px;" onclick="recipeDo();">
                    	<span class="glyphicon glyphicon-home color header"></span>
                    </button>
                </li>
                <!-- profile 아이콘 -->
                <li>
                    <div class="dropdown" style="padding-top: 9px; padding-left: 2px;">
                        <button class="btn dropdown-toggle form header" type="button" data-toggle="dropdown">
                            <span class="glyphicon glyphicon-user color header"></span>
                        </button>
                        <ul class="dropdown-menu" style="text-align:center; background-color:#F6F6F6;">
                            <li>
                            	<a href="./mypage.do"><img src="<%=memberVO.getUser_img()%>" class="img-circle" height="70" width="70" alt="Avatar"></a>
                            </li>
                            <li>
                                <h4>
                                    <a href="./mypage.do"><p class="text-primary"><%=memberVO.getUser_id()%></p></a>
                                </h4>
                            </li>
                            <li>
                            	<a href="./updateMember.do"><strong>회원수정</strong></a>
                            </li>
                            <li></li><!-- 간격을 주기 위한 빈 공간 -->
                            <li>
                            	<a href="./logout.do"><strong>로그아웃</strong></a>
                            </li>
                        </ul>
                    </div>
                </li>
                 <!-- 냉장고 아이콘 -->
                <li>
                    <div style="padding-top: 9px; padding-left: 5px;">
                        <button type="button" class="btn form header" data-toggle="modal" data-target="#fridge">
                            <img src="./resources/food_icon/fridge_white.png" style="width:20px; height:20px;" onmouseover="hover(this);" onmouseout="unhover(this);">
                        </button>
                    </div>
                </li>
                <script>
                function hover(element) {
                    element.setAttribute('src', './resources/food_icon/fridge.png');
                }
                function unhover(element) {
                    element.setAttribute('src', './resources/food_icon/fridge_white.png');
                }
                </script>              	
                <!--알림 아이콘 -->
                <li onclick="getNotification();">
                    <div style="padding-top: 10px; padding-left: 5px;">
                        <button type="button" class="btn form header" data-toggle="modal" data-target="#myModal">
                            <span class="glyphicon glyphicon-envelope color"></span>
                        </button>
                    </div>
                </li>
                <!--소셜 아이콘 -->
                <li onclick="postListDo();">
                    <button type="button" class="btn form header" style="padding-top: 10px; margin-top:10px; margin-left:1px;" >
                        <span class="glyphicon glyphicon-globe color"></span>
                    </button>
                </li>
          	</ul>
       	</div>
    </div>
</nav>
<!-- 냉장고 모달바 내용들 -->
<div class="modal fade" id="fridge" tableindex="-1" role="dialog"
	aria-labelledy="modallabel" style="height:530px;">
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
			<div class="modal-body">
				<div class="row">
					<!-- 왼쪽 카테고리 -->
					<div class="col-sm-2" style="overflow-y:scroll; height:272px;">
						<!-- 종류들 나열 -->
						<ul class="nav nav-stacked">
							<li class="active"><a data-toggle="tab" href="#menu1"> <strong>빵류</strong>
							</a></li>
							<li><a data-toggle="tab" href="#menu2"> <strong>콩류</strong>
							</a></li>
							<li><a data-toggle="tab" href="#menu3"> <strong>곡류</strong>
							</a></li>
							<li><a data-toggle="tab" href="#menu4"> <strong>면류</strong>
							</a></li>
							<li><a data-toggle="tab" href="#menu5"> <strong>해물류</strong>
							</a></li>
							<li><a data-toggle="tab" href="#menu6"> <strong>채소류</strong>
							</a></li>
							<li><a data-toggle="tab" href="#menu7"> <strong>고기류</strong>
							</a></li>
							<li><a data-toggle="tab" href="#menu8"> <strong>소스류</strong>
							</a></li>
							<li><a data-toggle="tab" href="#menu9"> <strong>스프/기름/즙</strong>
							</a></li>
							<li><a data-toggle="tab" href="#menu10"> <strong>향신료/가루</strong>
							</a></li>
							<li><a data-toggle="tab" href="#menu11"> <strong>유제품</strong>
							</a></li>
							<li><a data-toggle="tab" href="#menu12"> <strong>주류</strong>
							</a></li>
							<li><a data-toggle="tab" href="#menu13"> <strong>과일/견과</strong>
							</a></li>
						</ul>
						<!-- 종류 나열 끝 -->
					</div>
					<!--  가운데 리스트 나열 -->
					<div class="col-sm-7"
						style="background-color: #FFEAEA; text-align: center; padding-right:0;">
						<form id="IrdntList">
						<div class="tab-content" style="overflow-y:scroll; height:272px;">
							<!-- 메뉴1 빵류 -->
							<div id="menu1" class="tab-pane fade in active">
								<ul class="ul hori">
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/bread.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="꽃빵">
										<strong>꽃빵</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/bread.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="식빵">
										<strong>식빵</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/bread.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="모닝빵">
										<strong>모닝빵</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/bread.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="바게트">
										<strong>바게트</strong>
										</a>
									</li>
								</ul>
							</div>
							<!-- 메뉴2 콩류-->
							<div id="menu2" class="tab-pane fade">
								<ul class="ul hori">
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/bean.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="두부">
										<strong>두부</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/bean.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="녹두">
										<strong>녹두</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/bean.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="서리태콩">
										<strong>서리태콩</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/bean.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="풋콩">
										<strong>풋콩</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/bean.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="메주콩">
										<strong>메주콩</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/bean.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="콩비지">
										<strong>콩비지</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/bean.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="흰콩">
										<strong>흰콩</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/bean.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="팥">
										<strong>팥</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/bean.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="완두콩">
										<strong>완두콩</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/bean.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="유부">
										<strong>유부</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/bean.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="껍질콩">
										<strong>껍질콩</strong>
										</a>
									</li>
								</ul>
							</div>
							<!-- 메뉴3 곡류 -->
							<div id="menu3" class="tab-pane fade">
								<ul class="ul hori">
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/rice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="튀김가루">
										<strong>튀김가루</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/rice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="밀가루">
										<strong>밀가루</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/rice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="쌀">
										<strong>쌀</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/rice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="멥쌀">
										<strong>멥쌀</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/rice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="불린쌀">
										<strong>불린쌀</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/rice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="전분">
										<strong>전분</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/rice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="옥수수">
										<strong>옥수수</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/rice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="옥수수통조림">
										<strong>옥수수통조림</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/rice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="떡">
										<strong>떡</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/rice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="흰떡">
										<strong>흰떡</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/rice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="떡국떡">
										<strong>떡국떡</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/rice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="만두피">
										<strong>만두피</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/rice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="라이스페이퍼">
										<strong>라이스페이퍼</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/rice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="밥">
										<strong>밥</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/rice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="찬밥">
										<strong>찬밥</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/rice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="녹말">
										<strong>녹말</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/rice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="찹쌀">
										<strong>찹쌀</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/rice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="들깨">
										<strong>들깨</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/rice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="스위트콘">
										<strong>스위트콘</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/rice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="빵가루">
										<strong>빵가루</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/rice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="가래떡">
										<strong>가래떡</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/rice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="수수">
										<strong>수수</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/rice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="보리">
										<strong>보리</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/rice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="오곡곡물">
										<strong>오곡곡물</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/rice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="강력분">
										<strong>강력분</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/rice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="이스트">
										<strong>이스트</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/rice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="드라이이스트">
										<strong>드라이이스트</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/rice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="춘권피">
										<strong>춘권피</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/rice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="콘프레이크">
										<strong>콘프레이크</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/rice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="차조">
										<strong>차조</strong>
										</a>
									</li>
								</ul>
							</div>
							<!-- 메뉴4 면류 -->
							<div id="menu4" class="tab-pane fade">
								<ul class="ul hori">
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/noodle.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="스파게티면">
										<strong>스파게티면</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/noodle.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="스파게티">
										<strong>스파게티</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/noodle.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="냉면">
										<strong>냉면</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/noodle.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="쫄면">
										<strong>쫄면</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/noodle.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="국수">
										<strong>국수</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/noodle.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="쌀국수">
										<strong>쌀국수</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/noodle.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="우동면">
										<strong>우동면</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/noodle.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="메밀국수">
										<strong>메밀국수</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/noodle.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="페투치네">
										<strong>페투치네</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/noodle.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="칼국수">
										<strong>칼국수</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/noodle.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="칼국수면">
										<strong>칼국수면</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/noodle.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="소면">
										<strong>소면</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/noodle.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="라면">
										<strong>라면</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/noodle.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="당면">
										<strong>당면</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/noodle.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="밀국수">
										<strong>밀국수</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/noodle.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="녹차국수">
										<strong>녹차국수</strong>
										</a>
									</li>
								</ul>
							</div>
							<!-- 메뉴5 해물류 -->
							<div id="menu5" class="tab-pane fade">
							<ul class="ul hori">
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="새우">
									<strong>새우</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="새우액젓">
									<strong>새우액젓</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="새우젓">
									<strong>새우젓</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="잔새우">
									<strong>잔새우</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="칵테일">
									<strong>칵테일</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="중새우">
									<strong>중새우</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="마른새우">
									<strong>마른새우</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="새우살">
									<strong>새우살</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="가재새우">
									<strong>가재새우</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="다시마">
									<strong>다시마</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="국멸치">
									<strong>국멸치</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="잔멸치">
									<strong>잔멸치</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="멸치액젓">
									<strong>멸치액젓</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="멸치다시물">
									<strong>멸치다시물</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="낙지">
									<strong>낙지</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="감동젓">
									<strong>감동젓</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="굴">
									<strong>굴</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="생굴">
									<strong>생굴</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="북어">
									<strong>북어</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="송어">
									<strong>송어</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="잉어">
									<strong>잉어</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="메기">
									<strong>메기</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="꽁치">
									<strong>꽁치</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="꽁치통조림">
									<strong>꽁치통조림</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="김">
									<strong>김</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="구운김">
									<strong>구운김</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="김밥용김">
									<strong>김밥용김</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="바지락">
									<strong>바지락</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="대하">
									<strong>대하</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="꽃게">
									<strong>꽃게</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="오징어">
									<strong>오징어</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="갑오징어">
									<strong>갑오징어</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="마른오징어">
									<strong>마른오징어</strong>
									</a>
								</li>		
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="날치알">
									<strong>날치알</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="홍합">
									<strong>홍합</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="검은껍질홍합">
									<strong>검은껍질홍합</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="모시조개">
									<strong>모시조개</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="맛살조개">
									<strong>맛살조개</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="피조개">
									<strong>피조개</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="조개살">
									<strong>조개살</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="쭈꾸미">
									<strong>쭈꾸미</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="참치">
									<strong>참치</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="참치통조림">
									<strong>참치통조림</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="참치캔">
									<strong>참치캔</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="게맛살">
									<strong>가다랑이포</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="전어">
									<strong>전어</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="전어젓갈">
									<strong>전어젓갈</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="전복">
									<strong>전복</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="갈치">
									<strong>갈치</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="고등어">
									<strong>고등어</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="까나리액젓">
									<strong>까나리액젓</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="대구">
									<strong>대구</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="대구살">
									<strong>대구살</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="생대구">
									<strong>생대구</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="동태살">
									<strong>동태살</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="장어">
									<strong>장어</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="해초">
									<strong>해초</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="미역">
									<strong>미역</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="연어알">
									<strong>연어알</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="훈제연어">
									<strong>훈제연어</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="오보로">
									<strong>오보로</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="해파리">
									<strong>해파리</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="엑체육젓">
									<strong>엑체육젓</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="생태">
									<strong>생태</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="광어">
									<strong>광어</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="청어알">
									<strong>청어알</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="코다리">
									<strong>코다리</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="문어">
									<strong>문어</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="명란">
									<strong>명란</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="조기">
									<strong>조기</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="아귀">
									<strong>아귀</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="게">
									<strong>게</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="생선살">
									<strong>생선살</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="재첩">
									<strong>재첩</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="참소라살">
									<strong>참소라살</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="가리비">
									<strong>가리비</strong>
									</a>
								</li>
								<li class="li hori">
									<a href="#" class="text-muted">
									<img src="./resources/food_icon/fish.png" style="width: 35px; height: 35px;"><br>
									<input type="hidden" value="장어뼈">
									<strong>장어뼈</strong>
									</a>
								</li>
							</ul>	
							</div>
							<!-- 메뉴6 채소류 -->
							<div id="menu6" class="tab-pane fade">
								<ul class="ul hori">
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="마늘">
										<strong>마늘</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="통마늘">
										<strong>통마늘</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="채썬마늘">
										<strong>채썬마늘</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="무">
										<strong>무</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="무순">
										<strong>무순</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="열무">
										<strong>열무</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="무말랭이">
										<strong>무말랭이</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="총각무">
										<strong>총각무</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="동치미무">
										<strong>동치미무</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="파">
										<strong>파</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="실파">
										<strong>실파</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="대파">
										<strong>대파</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="쪽파">
										<strong>쪽파</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="통파">
										<strong>통파</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="파뿌리">
										<strong>파뿌리</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="가는파">
										<strong>굵은파</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="시금치">
										<strong>시금치</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="컬리플라워">
										<strong>컬리플라워</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="파프리카">
										<strong>파프리카</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="미니파프리카">
										<strong>미니파프리카</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="노란 파프리카">
										<strong>노란 파프리카</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="붉은 파프리카">
										<strong>붉은 파프리카</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="단호박">
										<strong>단호박</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="배추">
										<strong>배추</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="얼갈이배추">
										<strong>얼갈이배추</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="양배추">
										<strong>양배추</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="생강">
										<strong>생강</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="초생강">
										<strong>초생강</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="통생강">
										<strong>통생강</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="브로콜리">
										<strong>브로콜리</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="미나리">
										<strong>미나리</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="갓">
										<strong>갓</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="붉은갓">
										<strong>붉은갓</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="시래기">
										<strong>시래기</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="양파">
										<strong>인삼</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="감자">
										<strong>감자</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="당근">
										<strong>당근</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="당근잎">
										<strong>당근잎</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="피망">
										<strong>피망</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="홍피망">
										<strong>홍피망</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="청피망">
										<strong>청피망</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="팽이버섯">
										<strong>팽이버섯</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="미니새송이버섯">
										<strong>미니새송이버섯</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="표고버섯">
										<strong>표고버섯</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="느타리버섯">
										<strong>느타리버섯</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="송이버섯">
										<strong>송이버섯</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="목이버섯">
										<strong>목이버섯</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="석이버섯">
										<strong>석이버섯</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="고추">
										<strong>고추</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="이태리고추">
										<strong>이태리고추</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="홍고추">
										<strong>홍고추</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="청고추">
										<strong>청고추</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="다진고추">
										<strong>다진고추</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="풋고추">
										<strong>풋고추</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="꽈리고추">
										<strong>꽈리고추</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="청양고추">
										<strong>청양고추</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="월계수잎">
										<strong>월계수잎</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="토마토">
										<strong>토마토</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="방울토마토">
										<strong>방울토마토</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="홀토마토">
										<strong>홀토마토</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="샐러리">
										<strong>샐러리</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="파슬리">
										<strong>파슬리</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="이태리파슬리">
										<strong>이태리파슬리</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="차이브">
										<strong>차이브</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="양상추">
										<strong>양상추</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="오이">
										<strong>오이</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="백오이">
										<strong>백오이</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="콩나물">
										<strong>콩나물</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="쑥갓">
										<strong>쑥갓</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="샐러드">
										<strong>샐러드</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="숙주">
										<strong>숙주</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="더덕">
										<strong>더덕</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="호박">
										<strong>호박</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="애호박">
										<strong>애호박</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="겨자잎">
										<strong>겨자잎</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="비트">
										<strong>비트</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="부추">
										<strong>부추</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="가지">
										<strong>가지</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="상추">
										<strong>상추</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="토란">
										<strong>토란</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="우엉">
										<strong>우엉</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="도라지">
										<strong>도라지</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="고사리">
										<strong>고사리</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="깻잎">
										<strong>깻잎</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="아스파라거스">
										<strong>아스파라거스</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="우무">
										<strong>우무</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="죽순">
										<strong>죽순</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="">
										<strong></strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="고수잎">
										<strong>고수잎</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="수삼">
										<strong>수삼</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="치커리">
										<strong>치커리</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="취나물">
										<strong>취나물</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="봄동">
										<strong>봄동</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="고구마">
										<strong>고구마</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="돛나물">
										<strong>돛나물</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="박고지">
										<strong>박고지</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="달래">
										<strong>달래</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="고들빼기">
										<strong>고들빼기</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="아욱">
										<strong>아욱</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="피클">
										<strong>피클</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="마늘종">
										<strong>마늘종</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="냉이">
										<strong>냉이</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="우거지">
										<strong>우거지</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="근대잎">
										<strong>근대잎</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="청경채">
										<strong>청경채</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/vege.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="솔잎">
										<strong>솔잎</strong>
										</a>
									</li>
								</ul>
							</div>
							<!-- 메뉴7 고기류 -->
							<div id="menu7" class="tab-pane fade">
								<ul class="ul hori">
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/beef.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="돼지고기">
										<strong>돼지고기</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/beef.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="돼지갈비">
										<strong>돼지갈비</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/beef.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="돼지고기안심">
										<strong>돼지고기안심</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/beef.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="돼지 볼살">
										<strong>돼지 볼살</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/beef.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="닭">
										<strong>닭</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/beef.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="닭다리">
										<strong>닭다리</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/beef.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="닭발">
										<strong>닭발</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/beef.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="닭봉">
										<strong>닭봉</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/beef.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="닭안심">
										<strong>닭안심</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/beef.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="쇠고기">
										<strong>쇠고기</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/beef.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="계란">
										<strong>계란</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/beef.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="베이컨">
										<strong>베이컨</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/beef.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="햄">
										<strong>햄</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/beef.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="갈비">
										<strong>갈비</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/beef.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="사골">
										<strong>사골</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/beef.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="비엔나소시지">
										<strong>비엔나소시지</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/beef.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="프랑크소시지">
										<strong>프랑크소시지</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/beef.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="도가니">
										<strong>도가니</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/beef.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="양지머리">
										<strong>양지머리</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/beef.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="안심">
										<strong>안심</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/beef.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="곱창">
										<strong>곱창</strong>
										</a>
									</li>
								</ul>
							</div>
							<!-- 메뉴8 소스류 -->
							<div id="menu8" class="tab-pane fade">
								<ul class="ul hori">
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/sauce.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="토마토페이스트">
										<strong>토마토페이스트</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/sauce.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="순창콩된장">
										<strong>순창콩된장</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/sauce.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="미소된장">
										<strong>미소된장</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/sauce.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="식초">
										<strong>식초</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/sauce.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="고추장">
										<strong>고추장</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/sauce.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="발효초">
										<strong>발효초</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/sauce.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="꿀">
										<strong>꿀</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/sauce.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="굴소스">
										<strong>굴소스</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/sauce.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="마요네즈">
										<strong>마요네즈</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/sauce.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="케첩">
										<strong>케첩</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/sauce.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="토마토케첩">
										<strong>토마토케첩</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/sauce.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="머스터드">
										<strong>머스터드</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/sauce.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="바베큐소스">
										<strong>바베큐소스</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/sauce.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="매실액">
										<strong>매실액</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/sauce.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="두반장">
										<strong>두반장</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/sauce.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="핫소스">
										<strong>핫소스</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/sauce.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="돈까스소스">
										<strong>돈까스소스</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/sauce.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="우스터소스">
										<strong>우스터소스</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/sauce.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="타바스코">
										<strong>타바스코</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/sauce.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="겨자">
										<strong>겨자</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/sauce.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="고추냉이">
										<strong>고추냉이</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/sauce.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="와사비">
										<strong>와사비</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/sauce.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="청국장">
										<strong>청국장</strong>
										</a>
									</li>
								</ul>
							</div>
							<!-- 메뉴9 스프/기름/즙 -->
							<div id="menu9" class="tab-pane fade">
								<ul class="ul hori">
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/soup.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="레몬즙">
										<strong>레몬즙</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/soup.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="사과즙">
										<strong>사과즙</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/soup.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="배즙">
										<strong>배즙</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/soup.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="생강즙">
										<strong>생강즙</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/soup.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="당근즙">
										<strong>당근즙</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/soup.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="시금치즙">
										<strong>시금치즙</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/soup.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="양파즙">
										<strong>양파즙</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/soup.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="식용유">
										<strong>식용유</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/soup.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="올리브오일">
										<strong>올리브오일</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/soup.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="참기름">
										<strong>참기름</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/soup.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="포도씨유">
										<strong>포도씨유</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/soup.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="샐러드오일">
										<strong>샐러드오일</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/soup.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="들기름">
										<strong>들기름</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/soup.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="부침유">
										<strong>부침유</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/soup.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="고추기름">
										<strong>고추기름</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/soup.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="닭육수">
										<strong>닭육수</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/soup.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="물엿">
										<strong>물엿</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/soup.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="간장">
										<strong>간장</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/soup.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="국간장">
										<strong>국간장</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/soup.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="진간장">
										<strong>진간장</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/soup.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="맛술">
										<strong>맛술</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/soup.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="다시물">
										<strong>다시물</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/soup.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="엿기름">
										<strong>엿기름</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/soup.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="조청">
										<strong>조청</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/soup.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="미림">
										<strong>미림</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/soup.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="조미술">
										<strong>조미술</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/soup.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="요리술">
										<strong>요리술</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/soup.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="김칫국물">
										<strong>김칫국물</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/soup.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="동치미국물">
										<strong>동치미국물</strong>
										</a>
									</li>
								</ul>
							</div>
							<!-- 메뉴10 항신료/가루 -->
							<div id="menu10" class="tab-pane fade">
								<ul class="ul hori">
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/spice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="소금">
										<strong>소금</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/spice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="깨소금">
										<strong>깨소금</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/spice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="후추">
										<strong>후추</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/spice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="통후추">
										<strong>통후추</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/spice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="후춧가루">
										<strong>후춧가루</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/spice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="고춧가루">
										<strong>고춧가루</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/spice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="설탕">
										<strong>설탕</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/spice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="카레가루">
										<strong>카레가루</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/spice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="통계피">
										<strong>통계피</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/spice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="팔각">
										<strong>팔각</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/spice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="정향">
										<strong>정향</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/spice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="파슬리가루">
										<strong>파슬리가루</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/spice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="라임">
										<strong>라임</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/spice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="산초가루">
										<strong>산초가루</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/spice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="오레가노">
										<strong>오레가노</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/spice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="케일">
										<strong>케일</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/spice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="바질">
										<strong>바질</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/spice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="로즈마리">
										<strong>로즈마리</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/spice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="땅콩가루">
										<strong>땅콩가루</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/spice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="겨자가루">
										<strong>겨자가루</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/spice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="잣가루">
										<strong>잣가루</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/spice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="들깻가루">
										<strong>들깻가루</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/spice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="케이퍼">
										<strong>케이퍼</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/spice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="넛맥">
										<strong>넛맥</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/spice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="아몬드가루">
										<strong>아몬드가루</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/spice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="녹차분말">
										<strong>녹차분말</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/spice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="슈가파우더">
										<strong>슈가파우더</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/spice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="찹쌀가루">
										<strong>찹쌀가루</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/spice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="녹말가루">
										<strong>녹말가루</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/spice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="들깨가루">
										<strong>들깨가루</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/spice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="콩가루">
										<strong>콩가루</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/spice.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="계핏가루">
										<strong>계핏가루</strong>
										</a>
									</li>
								</ul>
							</div>
							<!-- 메뉴11 유제품 -->
							<div id="menu11" class="tab-pane fade">
								<ul class="ul hori">
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/milk.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="파마산치즈">
										<strong>파마산치즈</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/milk.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="모짜렐라치즈">
										<strong>모짜렐라치즈</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/milk.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="슬라이스치즈">
										<strong>슬라이스치즈</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/milk.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="크림치즈">
										<strong>크림치즈</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/milk.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="피자치즈">
										<strong>피자치즈</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/milk.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="우유">
										<strong>우유</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/milk.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="생크림">
										<strong>생크림</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/milk.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="요구르트">
										<strong>요구르트</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/milk.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="버터">
										<strong>버터</strong>
										</a>
									</li>		
								</ul>
							</div>
							<!-- 메뉴12 주류 -->
							<div id="menu12" class="tab-pane fade">
								<ul class="ul hori">
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/alcohol.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="화이트와인">
										<strong>화이트와인</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/alcohol.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="청주">
										<strong>청주</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/alcohol.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="레드와인">
										<strong>레드와인</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/alcohol.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="정종">
										<strong>정종</strong>
										</a>
									</li>
								</ul>
							</div>
							<!-- 메뉴13 과일/견과류 -->
							<div id="menu13" class="tab-pane fade">
								<ul class="ul hori">
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/fruit.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="배">
										<strong>배</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/fruit.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="파인애플">
										<strong>파인애플</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/fruit.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="과일통조림">
										<strong>과일통조림</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/fruit.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="오렌지">
										<strong>오렌지</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/fruit.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="레몬">
										<strong>레몬</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/fruit.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="사과">
										<strong>사과</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/fruit.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="올리브">
										<strong>올리브</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/fruit.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="아보카도">
										<strong>아보카도</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/fruit.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="키위">
										<strong>키위</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/fruit.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="자몽">
										<strong>자몽</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/fruit.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="곶감">
										<strong>곶감</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/peanut.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="밤">
										<strong>밤</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/peanut.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="잣">
										<strong>잣</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/peanut.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="대추">
										<strong>대추</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/peanut.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="땅콩">
										<strong>땅콩</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/peanut.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="검은깨">
										<strong>검은깨</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/peanut.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="호두">
										<strong>호두</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/peanut.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="통깨">
										<strong>통깨</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/peanut.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="참깨">
										<strong>참깨</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/peanut.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="건블루베리">
										<strong>건블루베리</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/peanut.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="아몬드">
										<strong>아몬드</strong>
										</a>
									</li>
									<li class="li hori">
										<a href="#" class="text-muted">
										<img src="./resources/food_icon/peanut.png" style="width: 35px; height: 35px;"><br>
										<input type="hidden" value="은행">
										<strong>은행</strong>
										</a>
									</li>
								</ul>
							</div>
							<!-- 재료 나열 끝 -->
						</div>
						</form>
					</div>
					<!-- 오른쪽 내 재료들 저장칸 -->
					<div class="col-sm-3">
						<div class="row">
						<ul class="ul hori">
						</ul>
						</div>
						<div class="row">
							<form>
								<p class="bg-danger" style="font-color:#FFFFFF; width=200px;"><strong>SUBMIT</strong></p>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 내용 끝 -->
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
		<!-- modal content 끝 -->

	</div>
	<!-- div dialog 끝 -->
</div>
<!-- div fade 끝. 냉장고 모달 끝 -->
<!-- 메시지 및 알림 모달 -->
<!-- Modal bar -->
<div class="modal modal-center fade" id="myModal" tableindex="-1" style="margin-top:100px;border-radius: 8px;" 
	role="dialog" aria-labelledby="modallabel">
	<div class="modal-dialog modal-size modal-center" role="document">
		<div class="modal-content modal-size" style="width: 400px; border-radius: 8px;">
			<!-- 알림, 메시지 탭 -->
			<div class="modal-header header" style="border-top-left-radius: 8px; border-top-right-radius: 8px; padding-bottom: 0px;">
				<button type="button" class="close" data-dismiss="modal" class="btn header">&times;</button>
				<ul class="nav nav-tabs" style="font-size: 14px;border-bottom: 0px;">
					<li class="active"><a data-toggle="tab" href="#home">알림 <span
							class="badge" id="no"><%=notificationList.size() %></span>
					</a></li>
					<li onclick="getMessage();"><a data-toggle="tab" href="#message">메시지 <span
							class="badge header" id="me"><%=messageList.size() %></span></a></li>
				</ul>
			</div>
			<!-- Modal bar 내용들 -->
			<div class="modal-body header">
				<div class="tab-content">
					<div id="home" class="tab-pane fade in active">
						<ul class="list-group">
							<div class="row">
								<div class="col-sm-2">
									<img src="./resources/profile/bird.jpg" class="img-circle"
										height="40" width="40" alt="Avatar" style="margin-bottom: 5px;">
								</div>
								
								<div class="col-sm-6">
									<h4 class="text-primary" style=""><%=memberVO.getUser_id() %></h4>
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
									<h5 class="text-primary header" style="magin-bottom:5px;">
										<strong>&nbsp;이글이글</strong>
									</h5>
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
<!-- //없는게 더 깔끔한 느낌			
			<div class="modal-footer">
				<button type="button" class="btn btn-default header" data-dismiss="modal">Close</button>
			</div> 
-->
		</div>
	</div>
</div>
<script>
	function recipeDo() {
		location.href = "./recipe.do";
	}
	function postListDo() {
		location.href = "./postList.do";
	}
	function getMessage() {
		var user_id = "<%=memberVO.getUser_id()%>";
		$.ajax({
			url: "./message.do",
			type: "GET",
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
	function getNotification() {
		var user_id = "<%=memberVO.getUser_id()%>";
		$.ajax({
			url: "./notification.do",
			type: "GET",
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
	function updateNotification(notice_id) {
		var id = "n"+notice_id;
		var li = document.getElementById(id);
		li.style.display = "none";
		$.ajax({
			url: "./updateNotification.do",
			type: "POST",
			data: {
				notice_id : notice_id
			},
			success: function() {
				document.getElementById("no").innerHTML = Number(document.getElementById("no").innerHTML) - 1;
			}
		});
	}
	function updateMessage(value) {
		var listSize = <%=messageList.size()%>;
		alert(listSize);
		var id = "m"+value;
		var li = document.getElementById(id);
		li.style.display="none";
		$.ajax({
			url: "./updateMessage.do",
			type: "POST",
			data: {
				message_id: value
			},
			success: function(status) {
				document.getElementById("me").innerHTML = listSize - 1;
			}
		});
	}
	//버튼 클릭시 나타나고 사라지고
	//내 냉장고 불러오기
	
	// 재료 저장/삭제
	$(document).ready(function() {
		// 재료 저장/삭제
		$("#IrdntList").find("li").click(function() {
			//var src = $(this).find("img").attr("src");
			var user_id = <%=memberVO.getUser_id()%>;
			var my_irdnt = $(this).find("input").val();
			$.ajax({
				url: "./insertMemberBox.do",
				type: "POST",
				data: {
					user_id : user_id,
					my_irdnt : my_irdnt,
					//src : src
				},
				success: function(data) {
					if(data == 1) {
						alert("재료 저장 성공");
        				$("#irdnt_modal").empty();
        				$("#irdnt_modal").append(data);
					} else {
						alert("재료 삭제 성공");
        				$("#irdnt_modal").empty();
        				$("#irdnt_modal").append(data);
					}
				},
				error: function() {
					alert();
				}
			});
		});
		var myirdnt= document.getElementsByClassName("irdntlist")
	});
	//버튼 클릭시 나타나고 사라지고
	$(document).ready(function() {
		var myirdnt= document.getElementById("myMemberBoxList")
		for(var y=0; y< myirdnt.length; y++) {
			if(y == 0) {
				myirdnt[y].style.display="block";
			} else {
				myirdnt[y].style.display="none";
			}
		}
		var currentLocation= 0;
		$("updateIrdnt").click(function() {
			currentLocation += 1;
			if(currentLocation == irdntList.length) {
				myirdnt[myirdnt.length-1].style.dsplay= "none";
				myirdnt[0].style.display="block";
			} else {
				myirdnt[0].style.display="block";
			}
		});
	});
</script>