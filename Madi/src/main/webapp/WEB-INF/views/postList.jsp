<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <html>
  <head>
  <meta charset="UTF-8">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=divice-width, initial-scale=1">
  <title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  
  	#columns {
  		column-width: 220px;
  		column-gap: 10px;
  		margin: 10px;
  	}
  	
  	#columns figure {
  		display: inline-block;
  		margin: 0;
  		margin-bottom: 15px;
  		padding: 4px;
  		max-height: 800px;
  	}
  	
  	#columns figure img {
  		width: 100%;
  		border-radius: 3%;
  		overflow: hidden;
  	} 
  	
  	#columns figure video {
  		width: 100%;
  		border-radius: 3%;
  		overflow: hidden;
  	} 
  	
  	video {
  		autostart: 0;
  	}
  	
	footer {
	    background-color: #DE4F4F;
	    color: white;
	    padding: 15px;
	}
  	
  	#postBtn {	 	
  		position:fixed;
  		right:0;
  		bottom:0;
  		margin-bottom: 80px;
  		margin-right: 25px;
  		z-index:10000;
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
	/* Modal 크기 조절 */
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
	.modal-dialog.modal-center {
	    display: inline-block;
	    text-align: left;
	    vertical-align: middle;
	}
	/* follow 모달 크기 조절 */
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
	<!-- 헤더 스타일 끝 -->
	
/*   	/*table 디자인*/
  	table {
  		border-radius: 10px;
  		background-color: #EAEAEA;
  	} */
  	
  </style>
  	<script type="text/javascript">
  
  	$("#postBtn").affix({
  		offset: {
  			top: 100,
  			bottom: function() {
  				return (this.bottom = $('.footer').outerHeight(true))
  			}
  		}
  	});
  
  	/* 	function post() {
  		// 페이지 이동
  		location.href="post.do";
  	} */
  	
  	$(document).ready(function () {		
  		
  		// 무한 스크롤 이벤트
  		$(document).scroll(function() { // 스크롤이 변경될 때마다 이벤트 발생
  			var maxHeight = $(document).height(); // 현재 페이지의 높이
  			var currentScroll = $(window).scrollTop() + $(window).height();  // 브라우저의 스크롤 위치값   현재 페이지 문서의 높이
  			
  			if (maxHeight <= currentScroll + 100) {
  				$.ajax ({
  					// ajax로 비동기식으로 데이터 받아와서 무한 스크롤 구현하는 부분 
  				});
  			}
  		});
  			
  		// 이미지 마우스 hover시 이미지 투명하게 하는 이벤트
  		$(".imageHover").hover(function(){
  			$(this).css({
  				"opacity": "0.4"
  			});
  		},
  		function() {
  			$(this).css({
  				"opacity": "1.0"
  			})		
  		});
  		
  		$("#postBtn").click(function(){
  			$("#postModal").modal();
  		});
  				
  	});
  	</script>
  	
  </head>
  
  <body>
  <body style="background-color: #F6F6F6">
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
                <!-- 냉장고 아이콘 -->
                <li>
                    <div style="padding-top: 9px; padding-left: 5px;">
                        <button type="button" class="btn form" data-toggle="modal"
                            data-target="#fridge">
                            <img src="./resources/ingredient_icon/fridge.png" style="width:20px; height:20px;">
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
                        <ul class="dropdown-menu" style="text-align:center; background-color:#F6F6F6;">
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
  	
  	<div id="columns">
  	   <!-- 핀터레스트 형식으로 하려면 css의 멀티컬럼을 사용해야 함: 공통의 부모가 필요 -->
  	   <!-- 삽화를 그룹핑 -->
  		<figure>
  			<a href="#" class="imageHover">
  				<img class="imgsrc" src="//s3-us-west-2.amazonaws.com/s.cdpn.io/4273/cinderella.jpg">
  			</a>
  		</figure>
  			
  		<figure>
  			<a href="#" class="imageHover">
  				<img src="./resources/image/3.jpg">
  			</a>
  		</figure>	
  					
  		<figure>
  			<a href="#" class="imageHover">
  				<img class="imgsrc"  src="//s3-us-west-2.amazonaws.com/s.cdpn.io/4273/rapunzel.jpg">
  			</a>
  		</figure>
  			
  		<figure>
  			<a href="#" class="imageHover">
  				<img src="./resources/image/2.jpg">
  			</a>
  		</figure>	
  			
  		 <figure>
  			<a href="#" class="imageHover">
  				<img src="//s3-us-west-2.amazonaws.com/s.cdpn.io/4273/belle.jpg">
  			</a>
  		</figure>
  		  
  		<figure>
  			<img src="//s3-us-west-2.amazonaws.com/s.cdpn.io/4273/mulan_2.jpg">
  		</figure>
  			
  	   <figure>
  		 	<img src="//s3-us-west-2.amazonaws.com/s.cdpn.io/4273/sleeping-beauty.jpg">
  		</figure>
  			
  		<figure>
  			<img src="./resources/image/1.jpg">
  		</figure>	
  			
  	    <figure>
  			<img src="//s3-us-west-2.amazonaws.com/s.cdpn.io/4273/pocahontas_2.jpg">
  	 	</figure>
  			
  	 	<figure>
  	 		<img src="./resources/image/10.jpg">
  		</figure>
  			
  		<figure>
  			<img src="//s3-us-west-2.amazonaws.com/s.cdpn.io/4273/snow-white.jpg">
  		</figure>	
  		  		
  	    <figure>
  			<img src="//s3-us-west-2.amazonaws.com/s.cdpn.io/4273/ariel.jpg">
  		</figure>
  		  
  		 <figure>
  			<img src="//s3-us-west-2.amazonaws.com/s.cdpn.io/4273/tiana.jpg">
  		 </figure>	
  			
  		 <figure>
  			<img src="./resources/image/4.jpg">
  		 </figure>	
  			
  		 <figure>
  			<img src="./resources/image/5.jpg">
  		 </figure>	
  	
  		 <figure style="overflow: hidden">
  			<img src="./resources/image/6.jpg">
  		 </figure>			
  			
  			<figure>
  				<img src="./resources/image/7.jpg">
  			</figure>					
  				
  		    <figure>
  				<img src="//s3-us-west-2.amazonaws.com/s.cdpn.io/4273/tiana.jpg">
  			</figure>	
  			
  		    <figure>
  				<img src="//s3-us-west-2.amazonaws.com/s.cdpn.io/4273/tiana.jpg">
  			</figure>
  			
  		    <figure>
  				<img src="./resources/image/8.jpg">
  			</figure>
  					
  		    <figure>
  				<img src="./resources/image/9.jpg">
  			</figure>		
  			
  		    <figure>
  				<img src="./resources/image/10.gif">
  			</figure>
  			
  			<figure>
  				<img src="./resources/image/11.PNG">
  			</figure>
  			
  		    <figure>
  				<img src="./resources/image/11.gif">
  			</figure>
  			
  			<figure>
  				<video width="220" autoplay="autoplay" id="videoTest">
  					<source src="./resources/video/Wildlife.mp4" type="video/mp4">
  				</video>
  				<figurecaption id="videoDuration"></figurecaption>
  			</figure>
  	</div>
  	
  	<!-- 게시물 post 버튼 -->
  	<div id="postQuick" >
  		<button type="button" id="postBtn" class="btn btn-danger" data-spy="affixBtn"  style="border-radius: 100%; margin-left: 97%">+</button> <!--  onclick="javascript:post();" -->
  	</div>
  	
  	<!-- Footer -->
  	<footer class="container-fluid text-center">
  		<p>MADI</p>
  	</footer>
  	
  	<!-- Post Modal -->
  		  	<!-- Modal -->
  	  	<div class="modal fade" id="postModal" role="dialog" data-backdrop="static"> <!-- data-backdrop: 모달창 밖 눌렀을 때 방지 -->
  	    	<div class="modal-dialog">
  	
  		      	<!-- Modal content-->
  		      	<div class="modal-content">
  		        	<div class="modal-header">
  		          		<button type="button" class="close" data-dismiss="modal">&times;</button>
  		          		<h1 class="modal-title" align="center">레시피등록하기</h1>
  		        	</div>
  		       		<div class="modal-body">
  		         		    <!-- 썸네일 / 요리명 / 한줄 설명 -->
  					<br>
  						<div align="center">
  							<form id="boardForm" action="postProcess.do" method="post">
  							<div class="boardDiv">
  								<div><button class="btn" style="margin-bottom: 10px">썸네일등록</button></div>
  								<div><input type="text" placeholder="요리명" style="margin-bottom: 3px"></div>
  								<div><input type="text" placeholder="한줄설명"></div>
  							</div>  
<!--   														
  								<table border="0" cellspacing="3" align="center">
  									<tr>
  										<td colspan="2" align="center"><button style="margin-bottom: 10px">썸네일등록</button></td>
  									</tr>
  									<tr>
  										<td><input type="text" placeholder="요리명" style="margin-bottom: 3px"></td>
  									</tr>
  									<tr>
  										<td><input type="text" placeholder="한줄설명"></td>
  									</tr>
  								</table>
-->
  							</form>
  							<br>
  							
  							<!-- 재료 / 분량 -->
  							<form id="irdntForm"  action="postProcess.do" method="post">
  								<div class="irdnt">
  									<div>
  										<h2>재료입력</h2>
  									</div>
  									<div id="irdnt_input">
  										<input type="text" placeholder="재료입력" style="margin-right: 5px; margin-bottom: 3px;">
  										<input type="text" placeholder="분량입력">
  									</div>
  									<div>
  										<button id="irdntAdd" type="button" class="btn btn-warning" style="border-radius: 100%" align="center">+</button>
  									</div>
  								</div>
<!--   							
  								<table id="abc" border="0" cellspacing="3">
  									<thead>
  										<tr>
  											<td colspan="2" align="center"><h2>재료입력</h2></td>
  										</tr>
  									</thead>
  									<tbody>
  										<tr>
  											<td><input type="text" placeholder="재료입력" style="margin-right: 5px; margin-bottom: 3px;"></td>
  											<td><input type="text" placeholder="분량입력"></td>
  										</tr>
  									</tbody>
  									<tfoot>
  										<tr>
  											<td colspan="2" align="right">
  												<button id="irdntAdd" type="button" class="btn btn-warning" style="border-radius: 100%" align="center">+</button>
  											</td>
  										</tr>
  									</tfoot>
  								</table>
-->
  							</form>
  							<br>
  							
  							<!-- 레시피 / 사진 /  설명 -->
  							<form id="recipeProcess.do"  action="postProcess.do" method="post">
  								<div class="recipe">
  									<div><h2>레시피</h2></div>
  									<div style="margin-bottom: 10px;">
  										<button class="btn" style="vertical-align: top;">사진등록</button>
  									</div>
  									<div>
  										<textarea class="form-control"></textarea>
  									</div>
  									<div>
  										<button id="recipeProcessAdd" type="button" class="btn btn-warning" style="border-radius: 100%">+</button>
  									</div>
  								</div>
  							
<!--   							
  								<table id="def" border="0" cellspacing="3">
  									<thead>
  										<tr>
  												<td colspan="2" align="center"><h2>레시피</h2></td>
  										</tr>
  									</thead>
  									<tbody>
  									<tr>
  										<td><button>사진등록</button>&nbsp;&nbsp;&nbsp;</td>
  										<td><textarea></textarea></td>
  									</tr>
  									</tbody>
  									<tfoot>
  										<tr>
  											<td colspan="2" align="right">
  												<button id="recipeProcessAdd" type="button" class="btn btn-warning" style="border-radius: 100%">+</button>
  											</td>
  										</tr>
  									</tfoot>
  								</table>
 -->  								
  							</form>
  						</div>
  				<br><br>
  				<div align="center">
  					<button class="btn btn-danger" onclick="javascript:submit()">submit</button>
  				</div>
  				
  				<script>
  	
  					var duration = document.getElementById("videoTest").duration;
  					document.getElementById("videoDuration").innerHTML = duration;
  					
  					$('#irdntAdd').click(function() {
  						var length = $("#abc tr").length;
  						//$('#abc > tbody:last').append('<tr><td><input type="text" placeholder="재료입력" style="margin-right: 5px; margin-bottom: 3px;"></td>' +  
  						//'<td><input type="text" placeholder="분량입력"></td></tr>');
  						
  						$('#irdnt_input').append('<br><input type="text" placeholder="재료입력" style="margin-right: 5px; margin-bottom: 3px;"><input type="text" placeholder="분량입력">');
  						return false;
  					 });	 
  					  
  					 $('#recipeProcessAdd').click(function() {
  					 	var length = $("#def tr").length;
  						$('#def > tbody:last').append('<tr><td><button>사진등록</button></td><td><textarea></textarea></td></tr>');
  						return false;
  					  });
  					  
  					  function submit() {
  						  alert('?');
  				  }
 				</script>
 </body>
 </html>