<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://code.jquery.com/jquery-latest.min.js"></script>
  <style>
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: lavender;
      padding: 25px;
    }

    .carousel-inner img {
      width: 100%; /* Set width to 100% */
      min-height: 470px;
    }

    /* Hide the carousel text when the screen is less than 600 pixels wide */
    @media (max-width: 600px) {
      .carousel-caption {
        display: none; 
      }
    }
  </style>
  <script>

  $(document).ready(function() {
  	$("#category_selected_form").on("submit", function(event) {
      	event.preventDefault();
    });
  }); 
  
  function addCategory(element) {
    	var category_selected_form = document.getElementById("category_selected_form");
    	
    	if(element.style.background == "blue") { 
        	element.style.background = "";
            document.getElementById(element.textContent).remove();
            category_selected_form.submit();
        } else {
        	console.log("1");
        	element.style.background = "blue";
    		category_selected_form.innerHTML += "<button id='" + element.textContent + "' class='btn btn-default' style='border:none; outline:none;' onclick='removeCategory(this);'>";
    		category_selected_form.innerHTML += 	element.textContent + "<span class='glyphicon glyphicon-remove'>";
    		category_selected_form.innerHTML += 	"<input type='hidden' name='category' value="+element.value+"/>";
    		category_selected_form.innerHTML += "</buton>";
            category_selected_form.submit();
        }
    }
  	
    function removeCategory(element) {
    	var category_selected_form = document.getElementById("category_selected_form");
    	element.remove();
        document.getElementsByName(element.textContent)[0].style.background = "";
        category_selected_form.submit();
    }
    
    function stay() {
    	return false;
    }
    

  </script>
</head>
<body>

<nav class="navbar navbar-default head">
        <div class="container-fluid">
            <div class="navbar-header" >
                <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#myNavbar">
                    <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">MADI</a>
            </div>
            <!--검색 창 -->
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav">
                    <form class="navbar-form navbar-right" role="search">
                        <div class="form-group input-group">
                            <input id="s"type="text" class="form-control" placeholder="Search.."
                                size="60%"> <span class="input-group-btn">
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
                    <li><button type="button" class="btn"
                            style="margin-top: 9px; margin-left:1px;">
                            <span class="glyphicon glyphicon-home color"></span>
                        </button>
                    </li>
                    <li>
                        <div class="dropdown" style="padding-top: 9px; padding-left: 2px;">
                            <button class="btn dropdown-toggle" type="button"
                                data-toggle="dropdown">
                                <span class="glyphicon glyphicon-user color"></span>
                            </button>
                            <ul class="dropdown-menu" style="text-align: center">
                                <li><img src="bird.jpg" class="img-circle" height="70"
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
                        <div style="margin-top:9px; margin-left:1px;">
                            <button type="button" class="btn" data-toggle="modal"
                                data-target="#myModal">
                                <span class="glyphicon glyphicon-align-justify color"></span>
                            </button>
                            <!-- Modal bar -->
                            <div class="modal fade" id="myModal" role="dialog">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <ul class="nav nav-tabs">
                                                <li class="active"><a data-toggle="tab" href="#home">알림
                                                        <span class="badge">New</span>
                                                </a></li>
                                                <li><a data-toggle="tab" href="#message">메시지 <span
                                                        class="badge">New</span></a></li>
                                                <li><a data-toggle="tab" href="#notice">공지사항 <span
                                                        class="badge">New</span></a></li>
                                            </ul>
                                        </div>
                                        <!-- Modal bar 내용들 -->
                                        <div class="modal-body">
                                            <div class="tab-content">
                                                <div id="home" class="tab-pane fade in active">
                                                    <ul class="list-group">
                                                        <div class="row">
                                                            <div class="col-sm-1" style="padding-bottom: 5px;">
                                                                <img src="bird.jpg" class="img-circle" height="40"
                                                                    width="40" alt="Avatar">
                                                            </div>
                                                            <div class="col-sm-3">
                                                                <h4 class="text-primary">이글이글</h4>
                                                            </div>
                                                        </div>
                                                        <li class="list-group-item"><img src="bird.jpg"
                                                            class="img-circle" height="20" width="20" alt="Avatar">
                                                            <a>AAA</a> 님이 ~~~ 게시물을 공유했습니다.</li>
                                                        <li class="list-group-item"><img src="bird.jpg"
                                                            class="img-circle" height="20" width="20" alt="Avatar">
                                                            <a>BBB</a> 님이 프로필을 업데이트했습니다. <b>"~~~"</b>
                                                            <div class="row"></div></li>
                                                        <li class="list-group-item"><img src="bird.jpg"
                                                            class="img-circle" height="20" width="20" alt="Avatar">
                                                            <a>CCC</a> 님이 ~~~ 게시물을 공유했습니다.
                                                            <div class="row"></div></li>
                                                    </ul>
                                                </div>
                                                <div id="message" class="tab-pane fade">
                                                    <ul class="list-group">
                                                        <div class="row">
                                                            <div class="col-sm-1" style="padding-bottom: 5px;">
                                                                <img src="bird.jpg" class="img-circle" height="40"
                                                                    width="40" alt="Avatar">
                                                            </div>
                                                            <div class="col-sm-3">
                                                                <h4 class="text-primary">이글이글</h4>
                                                            </div>
                                                        </div>
                                                        <li class="list-group-item"><b>From </b> <img
                                                            src="bird.jpg" class="img-circle" height="20" width="20"
                                                            alt="Avatar"> <a>AAA</a> <b>: "지금 뭐하는지"</b></li>
                                                        <li class="list-group-item"><b>From </b> <img
                                                            src="bird.jpg" class="img-circle" height="20" width="20"
                                                            alt="Avatar"> <a>BBB</a> <b>: "먹을게 없다"</b></li>
                                                        <li class="list-group-item"><b>From </b> <img
                                                            src="bird.jpg" class="img-circle" height="20" width="20"
                                                            alt="Avatar"> <a>CCC</a> <b>: "사진"</b></li>
                                                    </ul>
                                                </div>
                                                <div id="notice" class="tab-pane fade">
                                                    <ul class="list-group">
                                                        <li class="list-group-item"><b>업데이트1</b></li>
                                                        <li class="list-group-item"><b>업데이트2 </b></li>
                                                        <li class="list-group-item"><b>업데이트3 </b></li>
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
                        <button type="button" class="btn" style="margin-top: 9px; margin-left:1px;">
                            <span class="glyphicon glyphicon-globe color"></span>
                        </button>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

<div class="container">
<div class="row">
  <div class="col-sm-8">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
      </ol>

      <!-- Wrapper for slides -->
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img src="https://placehold.it/800x400?text=IMAGE" alt="Image">
          <div class="carousel-caption">
            <h3>Sell $</h3>
            <p>Money Money.</p>
          </div>      
        </div>

        <div class="item">
          <img src="https://placehold.it/800x400?text=Another Image Maybe" alt="Image">
          <div class="carousel-caption">
            <h3>More Sell $</h3>
            <p>Lorem ipsum...</p>
          </div>      
        </div>
      </div>

      <!-- Left and right controls -->
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </div>
  <div class="col-sm-4">
  	<div class="panel" style="padding-left:10px;">
    	<h3>레시피 검색</h3>
        <p class="text-muted">재료 별 레시피 검색하기, 주로 쓰일 재료에 따라 레시피를 검색해주세요.<p>
    </div>
    <hr/>
    <form action="#" method="get">
    <div class="form-group">
      <label for="main">주재료</label>
      <input type="text" class="form-control" id="main" placeholder="/베이컨/계란/밀가루/브로콜리" name="main">
    </div>
    <div class="form-group">
      <label for="sub">부재료</label>
      <input type="text" class="form-control" id="sub" placeholder="/베이컨/계란/밀가루/양파" name="sub">
    </div>
     <div class="form-group">
      <label for="source">양념</label>
      <input type="text" class="form-control" id="source" placeholder="/소금/올리브유/후추가루" name="source">
    </div>
    <hr/>
    <button type="submit" class="btn btn-default btn-block">레시피 검색</button>
    <button class="btn btn-default btn-block">내 냉장고로 검색</button>
  </form>
  </div>
</div>
<hr>
</div>

<div class="container text-center">    
  <h3>마디가 추천하는 당신의 레시피</h3>
  <br/>
  <span class="glyphicon glyphicon-refresh" style="font-size:35px;"></span>
  <br/>
  <hr/>
  <div class="row">
  	<div class="col-sm-3 col-lg-3">
   <div class="thumbnail">
      <img src="https://placehold.it/234x234?text=IMAGE" class="img-responsive" style="width:100%; height:234px; z-index:1;" alt="Image">
      <div class="container-fluid" style="margin-top:-33px; z-index:5; position:relative; padding-left:0; padding-right:0;">
      	<img src="bird.jpg" class="img-circle" height="61"
                                    width="61" alt="Avatar">
                                    <p><strong>이글이글</strong></p>
        <h5><b>Title</b></h5>
        <span>Title Description Title Description Title Description Title Description Title Description Title Description Title Description Title Description</span>
      </div>
       <div class="container-fluid">
        	<div class="col-xs-4 col-sm-4" style="padding-left:0; padding-right:0;">
            	<button class="btn" style="background:white; border:none;">
                	<span class="glyphicon glyphicon-home" style="font-size:10px;"></span>&nbsp; 30분
                </button>
            </div>
            <div class="col-xs-4 col-sm-4" style="padding-left:0; padding-right:0;">
            	<button class="btn" style="background:white; border:none;">
                	<span class="glyphicon glyphicon-home" style="font-size:10px;"></span>&nbsp; 30분
                </button>
            </div>
            <div class="col-xs-4 col-sm-4" style="padding-left:0; padding-right:0;">
            	<button class="btn" style="background:white; border:none;">
                	<span class="glyphicon glyphicon-home" style="font-size:10px;"></span>&nbsp; 30분
                </button>
            </div>
        </div>
    </div>
    </div>
    <div class="col-sm-3 col-lg-3">
   <div class="thumbnail">
      <img src="https://placehold.it/234x234?text=IMAGE" class="img-responsive" style="width:100%; height:234px; z-index:1;" alt="Image">
      <div class="container-fluid" style="margin-top:-33px; z-index:5; position:relative; padding-left:0; padding-right:0;">
      	<img src="bird.jpg" class="img-circle" height="61"
                                    width="61" alt="Avatar">
                                    <p><strong>이글이글</strong></p>
        <h5><b>Title</b></h5>
        <span>Title Description</span>
      </div>
       <div class="container-fluid">
        	<div class="col-xs-4 col-sm-4" style="padding-left:0; padding-right:0;">
            	<button class="btn" style="background:white; border:none;">
                	<span class="glyphicon glyphicon-home" style="font-size:10px;"></span>&nbsp; 30분
                </button>
            </div>
            <div class="col-xs-4 col-sm-4" style="padding-left:0; padding-right:0;">
            	<button class="btn" style="background:white; border:none;">
                	<span class="glyphicon glyphicon-home" style="font-size:10px;"></span>&nbsp; 30분
                </button>
            </div>
            <div class="col-xs-4 col-sm-4" style="padding-left:0; padding-right:0;">
            	<button class="btn" style="background:white; border:none;">
                	<span class="glyphicon glyphicon-home" style="font-size:10px;"></span>&nbsp; 30분
                </button>
            </div>
        </div>
    </div>
    </div>
    <div class="col-sm-3 col-lg-3">
   <div class="thumbnail">
      <img src="https://placehold.it/234x234?text=IMAGE" class="img-responsive" style="width:100%; height:234px; z-index:1;" alt="Image">
      <div class="container-fluid" style="margin-top:-33px; z-index:5; position:relative; padding-left:0; padding-right:0;">
      	<img src="bird.jpg" class="img-circle" height="61"
                                    width="61" alt="Avatar">
                                    <p><strong>이글이글</strong></p>
        <h5><b>Title</b></h5>
        <span>Title Description</span>
      </div>
       <div class="container-fluid">
        	<div class="col-xs-4 col-sm-4" style="padding-left:0; padding-right:0;">
            	<button class="btn" style="background:white; border:none;">
                	<span class="glyphicon glyphicon-home" style="font-size:10px;"></span>&nbsp; 30분
                </button>
            </div>
            <div class="col-xs-4 col-sm-4" style="padding-left:0; padding-right:0;">
            	<button class="btn" style="background:white; border:none;">
                	<span class="glyphicon glyphicon-home" style="font-size:10px;"></span>&nbsp; 30분
                </button>
            </div>
            <div class="col-xs-4 col-sm-4" style="padding-left:0; padding-right:0;">
            	<button class="btn" style="background:white; border:none;">
                	<span class="glyphicon glyphicon-home" style="font-size:10px;"></span>&nbsp; 30분
                </button>
            </div>
        </div>
    </div>
    </div>
    <div class="col-sm-3 col-lg-3">
   <div class="thumbnail">
      <img src="https://placehold.it/234x234?text=IMAGE" class="img-responsive" style="width:100%; height:234px; z-index:1;" alt="Image">
      <div class="container-fluid" style="margin-top:-33px; z-index:5; position:relative; padding-left:0; padding-right:0;">
      	<img src="bird.jpg" class="img-circle" height="61"
                                    width="61" alt="Avatar">
                                    <p><strong>이글이글</strong></p>
        <h5><b>Title</b></h5>
        <span>Title Description</span>
      </div>
       <div class="container-fluid">
        	<div class="col-xs-4 col-sm-4" style="padding-left:0; padding-right:0;">
            	<button class="btn" style="background:white; border:none;">
                	<span class="glyphicon glyphicon-home" style="font-size:10px;"></span>&nbsp; 30분
                </button>
            </div>
            <div class="col-xs-4 col-sm-4" style="padding-left:0; padding-right:0;">
            	<button class="btn" style="background:white; border:none;">
                	<span class="glyphicon glyphicon-home" style="font-size:10px;"></span>&nbsp; 30분
                </button>
            </div>
            <div class="col-xs-4 col-sm-4" style="padding-left:0; padding-right:0;">
            	<button class="btn" style="background:white; border:none;">
                	<span class="glyphicon glyphicon-home" style="font-size:10px;"></span>&nbsp; 30분
                </button>
            </div>
        </div>
    </div>
    </div>
  <hr>
</div>

<div class="container">
  <div class="container-fluid text-center" style="padding:0;">    
    <div class="container-fluid"><h3>레시피 목록</h3></div>
    <br>
    <div class="row" style="padding:0;">
    	<div class="col-xs-12 col-sm-6" style="padding:0;">
        	<div class="col-xs-4 col-sm-4" style="padding:0;">
            	<button name = "밥" class="btn btn-default btn-block" value="3010001" onclick="addCategory(this);">밥</button>
            </div>
        	<div class="col-xs-4 col-sm-4" style="padding:0;">
        		<button name = "국" class="btn btn-default btn-block" value="3010002" onclick="addCategory(this);">국</button>
      		</div>
      		<div class="col-xs-4 col-sm-4" style="padding:0;"> 
        		<button name = "조림" class="btn btn-default btn-block" value="3010003" onclick="addCategory(this);">조림</button>
      		</div>
		</div>
    	<div class="col-xs-12 col-sm-6" style="padding:0;">
        	<div class="col-xs-4 col-sm-4" style="padding:0;">
            	<button name = "구이" class="btn btn-default btn-block" value="3010004" onclick="addCategory(this);">구이</button>
            </div>
        	<div class="col-xs-4 col-sm-4" style="padding:0;">
        		<button name = "튀김/커틀릿" class="btn btn-default btn-block" value="3010005" onclick="addCategory(this);">튀김/커틀릿</button>
      		</div>
      		<div class="col-xs-4 col-sm-4" style="padding:0;"> 
        		<button name = "찜" class="btn btn-default btn-block" value="3010006" onclick="addCategory(this);">찜</button>
      		</div>
		</div>
        <div class="col-xs-12 col-sm-6" style="padding:0;">
        	<div class="col-xs-4 col-sm-4" style="padding:0;">
            	<button name = "나물/생채/샐러드" class="btn btn-default btn-block" value="3010007" onclick="addCategory(this);">나물/생채/샐러드</button>
            </div>
        	<div class="col-xs-4 col-sm-4" style="padding:0;">
        		<button name = "밑반찬/김치" class="btn btn-default btn-block" value="3010008" onclick="addCategory(this);">밑반찬/김치</button>
      		</div>
      		<div class="col-xs-4 col-sm-4" style="padding:0;"> 
        		<button name = "양식" class="btn btn-default btn-block" value="3010009" onclick="addCategory(this);">양식</button>
      		</div>
		</div>
        <div class="col-xs-12 col-sm-6" style="padding:0;">
        	<div class="col-xs-4 col-sm-4" style="padding:0;">
            	<button name = "도시락/간식" class="btn btn-default btn-block" value="3010010" onclick="addCategory(this);">도시락/간식</button>
            </div>
        	<div class="col-xs-4 col-sm-4" style="padding:0;">
        		<button name = "양념장" class="btn btn-default btn-block" value="3010012" onclick="addCategory(this);">양념장</button>
      		</div>
      		<div class="col-xs-4 col-sm-4" style="padding:0;"> 
        		<button name = "떡/한과" class="btn btn-default btn-block" value="3010013" onclick="addCategory(this);">떡/한과</button>
      		</div>
		</div>
        <div class="col-xs-12 col-sm-6" style="padding:0;">
        	<div class="col-xs-4 col-sm-4" style="padding:0;">
            	<button name = "빵/과자" class="btn btn-default btn-block" value="3010014" onclick="addCategory(this);">빵/과자</button>
            </div>
        	<div class="col-xs-4 col-sm-4" style="padding:0;">
        		<button name = "음료" class="btn btn-default btn-block" value="3010015" onclick="addCategory(this);">음료</button>
      		</div>
      		<div class="col-xs-4 col-sm-4" style="padding:0;"> 
        		<button name = "만두/면류" class="btn btn-default btn-block" value="3010016" onclick="addCategory(this);">만두/면류</button>
      		</div>
		</div>
        <div class="col-xs-12 col-sm-6" style="padding:0;">
        	<div class="col-xs-4 col-sm-4" style="padding:0;">
            	<button name = "찌개/전골/스튜" class="btn btn-default btn-block" value="3010017" onclick="addCategory(this);">찌개/전골/스튜</button>
            </div>
        	<div class="col-xs-4 col-sm-4" style="padding:0;">
        		<button name = "부침" class="btn btn-default btn-block" value="3010018" onclick="addCategory(this);">부침</button>
      		</div>
      		<div class="col-xs-4 col-sm-4" style="padding:0;"> 
        		<button name = "그랑조/리조또" class="btn btn-default btn-block" value="3010019" onclick="addCategory(this);">그랑조/리조또</button>
      		</div>
		</div>
        <div class="col-xs-12 col-sm-6" style="padding:0;">
        	<div class="col-xs-4 col-sm-4" style="padding:0;">
            	<button name = "샌드위치/햄버거" class="btn btn-default btn-block" value="3010020" onclick="addCategory(this);">샌드위치/햄버거</button>
            </div>
        	<div class="col-xs-4 col-sm-4" style="padding:0;">
        		<button name = "피자" class="btn btn-default btn-block" value="3010021" onclick="addCategory(this);">피자</button>
      		</div>
      		<div class="col-xs-4 col-sm-4" style="padding:0;"> 
        		<button name = "볶음" class="btn btn-default btn-block" value="3010022" onclick="addCategory(this);">볶음</button>
      		</div>
		</div>
    </div>
  </div><br>
</div>
<div class="container">
	<div class="row">
    	<div class="col-xs-3 col-sm-3 panel panel-default" style="padding:0;">
        	결과
        </div>
        <div id="category_selected"class="col-xs-9 col-sm-9 panel panel-default text-left" style="padding-left:20px;">
        	<form id="category_selected_form" name="category_selected_form" onsubmit="return stay();">
            	
            </form>
        </div>
    </div>
</div>

<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

</body>
</html>
    
    