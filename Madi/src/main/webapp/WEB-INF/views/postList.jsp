<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, com.spring.madi.*" %>
<%
	//세션 로그인 체크
	//비정상적 유입을 막기 위해 로그인 아이디가 존재하지 않으면 초기화면으로 돌아간다
	if((String)session.getAttribute("user_id") == null) {
		response.sendRedirect("/");
	}

	//Header 기본 정보 받아오기
	List<MessageVO> messageList = (ArrayList<MessageVO>) request.getAttribute("messageList");
	List<NotificationVO> notificationList = (ArrayList<NotificationVO>) request.getAttribute("notificationList");
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
	//Include 한 Header 파일과 객체 공유
	request.setAttribute("messageList", messageList);
	request.setAttribute("notificationList", notificationList);
	request.setAttribute("memberVO", memberVO);
	//RecipeList<시간 순>으로 받아오기
	List<RecipeVO> postList = (ArrayList<RecipeVO>)request.getAttribute("postList");
	
%>
  <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <html>
  <head>
  <meta charset="UTF-8">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=divice-width, initial-scale=1">
  <title>마디 - 재료로 요리하다</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
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
  		width: 100%;
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
  	#irdntAddBtn {
		float:right;
		padding-top:0px;
		padding-bottom:0px;
		padding-left:5px;
		padding-right:5px;
	}
  	
  	#recipeProcessAddBtn {
  		float:right;
  		padding-top:0px;
  		padding-bottom:0px;
  		padding-left:5px;
  		padding-right:5px;
  	}
  	
  	#cooking_no {
  		border: none;  		
  		background-color: white;
  	}
  	
	.file-upload {
		position: relative;
		display: inline-block;
	}
	
	.file-upload__label {
	  display: block;
	  /* padding: 1em 2em; */
	  color: #fff;
	  background: #DE4F4F;
	  border-radius: .4em;
	  transition: background .3s;
	}
	    
	.file-upload__input {
	    position: absolute;
	    left: 0;
	    top: 0;
	    right: 0;
	    bottom: 0;
	    font-size: 1;
	    width:0;
	    height: 100%;
	    opacity: 10;
	}

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
  	
  	$(document).ready(function () {	

  	  	
  		// 무한 스크롤 이벤트
  		$(document).scroll(function() { // 스크롤이 변경될 때마다 이벤트 발생
  			var maxHeight = $(document).height(); // 현재 페이지의 높이
  			var currentScroll = $(window).scrollTop() + $(window).height();  // 브라우저의 스크롤 위치값  + 현재 페이지 문서의 높이
  			console.log(maxHeight+":"+currentScroll);
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
  			$("#postModal").modal("show");
  		});
  		
  		
/*   	  	$('#recipeInsert').click(function(){
  	  		alert('?');
   	  		$("#recipeModalFrm").ajaxForm({
	  	  		url: '/recipeInsert.do',
	  	  		contentType: false,
	  	  		processData: false,
	  	  		enctype: "multipart/form-data", 
	  			data: formData,
	  			type: 'POST',
	  			success: function(result) {
	  				alert('?');
	  				$("#img_url").html(result);
	  			},
	  			error : function(error) {
	  		        alert("Error!");
	  		    }
  	  		});	  		
	  	});    */
  		
  	});
  	
  	function post(recipe_id) {
  		location.href="./recipeDetail.do?recipe_id="+recipe_id;
  	}
  	
  	function image () {}
  	  	
  	function recipeSubmit() {
  		
  		/* 내용 입력 체크 */
  		// 요리명 입력 체크
  		if ($("#recipe_title").val() == "") {
  			alert("요리명을 입력");
  			event.preventDefault();
  			return;
  		}
  		// 요리 설명 입력 체크
  		if (document.recipeModalFrm.recipe_desc.value == "") {
  			alert("요리 설명을 입력하세요");
  			document.recipeModalFrm.recipe_desc.focus();
  			event.preventDefault();
  			return;
  		}
  		
  		// 이미지 첨부 체크?
  		/* if (document.recipeModalFrm.img_url.value == "") {
  			alert("이미지를 넣어주세요");
  			event.preventDefault();
  			return;
  		} */
  		
  		// 재료명 입력 체크
  		if ($("#irdnt_name").val() == "") {
  			alert('재료명을 입력하세요');
  			event.preventDefault();
  			return;
  		}
  		
  		// 분량 입력 체크
  		if ($("#irdnt_cpcty").val() == "") {
  			alert('분량을 입력하세요');
  			event.preventDefault();
  			return;
  		}
  		
	  	
  	  	$('#recipeInsert').click(function(){
  	  		alert('?');
/*   	  		$("#recipeModalFrm").ajaxForm({
	  	  		url: '/recipeInsert.do',
	  	  		contentType: false,
	  	  		processData: false,
	  	  		enctype: "multipart/form-data", 
	  			data: formData,
	  			type: 'POST',
	  			success: function(result) {
	  				alert('?');
	  				$("#img_url").html(result);
	  			},
	  			error : function(error) {
	  		        alert("Error!");
	  		    }
  	  		});	  */ 		
	  	});  
  	  	
  		recipeModalFrm.submit();
  		
  	}
  	
 
  </script>
  	
  </head>
  
  <body style="background-color: #F6F6F6">
    <div class="header">
    	<jsp:include page="header.jsp"></jsp:include>
    </div>
  	<!-- 게시물 핀터레스트형식 리스트 -->
  	<div id="columns" style="margin: 50px;">
  	   <!-- 핀터레스트 형식으로 하려면 css의 멀티컬럼을 사용해야 함: 공통의 부모가 필요 -->
  	   <!-- 삽화를 그룹핑 -->	 
<%		
		for(int i = 0; i < postList.size(); i++)
		{
			RecipeVO recipe = postList.get(i);
			
%>			<!-- 알 수 없는 error 메시지가 나오지만 정상적으로 아주 잘 작동함. 무시 -->
	  		<figure>
	  			<a href="#" class="imageHover">
	  				<img class="imgsrc" id="enters" src="<%= recipe.getImg_url()%>" onclick="post(<%=recipe.getRecipe_id()%>)"/>
	  			</a>
	  		</figure>
<%
		}
%>  		 
  	</div>
  	
  	<!-- 게시물 post 버튼 -->
  	<div id="postQuick" >
  		<button type="button" data-target="#postModal" id="postBtn" class="btn btn-danger" data-spy="affixBtn"  style="margin-left: 97%">+</button> 
  		<!--  onclick="javascript:post();" -->
  	</div>
  	
  	<!-- Footer -->
  	<footer class="container-fluid text-center">
  		<p>MADI</p>
  	</footer>
  	
  	<!-- Post Modal -->
	<!-- Modal -->
	<form name="recipeModalFrm" action="./recipeInsert.do" enctype="multipart/form-data" method="POST">
		<div class="modal fade" id="postModal" role="dialog" style="margin-top: 130px;" data-backdrop="static">
			<div class="modal-dialog">
				    
		    <!-- Modal content-->
		    <div class="modal-content">
		    	<div class="modal-header">
		    		<button type="button" class="close" data-dismiss="modal">x</button>
		    		<recipe style="font-size:20px;font-weight:bold"><span class="glyphicon glyphicon-cutlery"></span> 레시피 등록</recipe>
		    	</div>
		    <div>
		    
		    <!-- 요리명/사진등록 -->
		    <div class="modal-body">
		    	<div class="form-group">
		    		<label for="usrname">
		    			<span class="glyphicon glyphicon-cutlery"></span> 요리명
		    		</label>
		            
			        <div>	
		    			<!-- 사진: board_img -->					
			        	<div class="file-upload" id="upload_recipe_pic">
			        		<img src="" id="titlePreview" width=100% height=100% alt="미리보기" />
						    <label for="upload" class="file-upload__label">
						    	<span class="glyphicon glyphicon-camera"><input id="recipeInsert" class="file-upload__input" type="file" name="titleImg" ></span>사진등록
						    </label>
						    <script>
							    $(document).ready(function() {
						            $("#recipeInsert").on('change', function(){
						                readURL(this);
						            });
						        });
	
						        function readURL(input) {
						            if (input.files && input.files[0]) {
						            var reader = new FileReader();
	
						            reader.onload = function (e) {
						                    $('#titlePreview').attr('src', e.target.result);
						                }
	
						              reader.readAsDataURL(input.files[0]);
						            }
						        }
						    </script>
						</div>
			        	<input type="text" class="form-control" name="recipe_title" id="recipe_title" placeholder="요리명 입력" style="margin-bottom: 5px">
			        	<input type="text" class="form-control" name="recipe_desc" id="recipe_desc" placeholder="한줄 설명">
			        </div>
		          </div>
		      </div>
		      
		      <div class="modal-body">
		      	<div class="form-group">
		      		<div>
			      		<label>
			      			<span class="glyphicon glyphicon-map-marker"></span> 국가
			      		</label>
			      		<select name="nation_code" id="nation_code" class="form-control">
			      			<option value="3020001">한식</option>
			      			<option value="3020002">서양</option>
			      			<option value="3020003">일본</option>
			      			<option value="3020004">중국</option>
			      			<option value="3020005">동남아시아</option>
			      			<option value="3020006">이탈리아</option>
			      			<option value="3020009">퓨전</option>
			      		</select>
			      		<br>
			      		<label>
			      			<span class="glyphicon glyphicon-tags"></span> 종류
			      		</label>
			      		<select name="ty_code" id="ty_code" class="form-control">
			      			<option value="3010001">밥</option>
			      			<option value="3010002">국</option>
			      			<option value="3010003">조림</option>
			      			<option value="3010004">구이</option>
			      			<option value="3010005">튀김/커틀릿</option>
			      			<option value="3010006">찜</option>
			      			<option value="3010007">나물/생채/샐러드</option>
			      			<option value="3010008">밑반찬/김치</option>
			      			<option value="3010009">양식</option>
			      			<option value="3010010">도시락/간식</option>
			      			<option value="3010012">양념장</option>
			      			<option value="3010013">떡/한과</option>
			      			<option value="3010014">빵/과자</option>
			      			<option value="3010015">음료</option>
			      			<option value="3010016">만두/면류</option>
			      			<option value="3010016">찌개/전골/스튜</option>
			      			<option value="3010018">부침</option>
			      			<option value="3010019">그타랑/리조또</option>
			      			<option value="3010020">샌드위치/햄버거</option>
			      			<option value="3010021">피자</option>
			      			<option value="3010022">볶음</option>
			      			<option value="3010023">기타</option>
			      		</select>
		      		</div>
		      	</div>
		      </div>
		      
		      <!-- 재료/분량입력 -->
		      <div class="modal-body">
		      	<div class="form-group">
		      		<label for="psw">
		      			<span class="glyphicon glyphicon-shopping-cart"></span> 재료 입력
		      		</label>
		      		
		      		<!-- + -->
		      		<button type="button" id="irdntAddBtn" class="btn btn-primary btn-xs">+</button>
		      		<div id="irdntAdd">
		      			<input type="text" class="form-control" name="irdnt_name" id="irdnt_name" placeholder="재료 입력" style="margin-bottom: 5px;">
		      			<input type="text" class="form-control" name="irdnt_cpcty" id="irdnt_cpcty" placeholder="분량 입력" style="margin-bottom: 5px;">
		      			<!-- 재료타입(주재료/부재료/양념) select option -->
		      			<select id="irdnt_type_code" class="form-control" name="irdnt_ty_code">
		      				<option value="3060001">주재료</option>
		      				<option value="3060002">부재료</option>
		      				<option value="3060003">양념</option>
		      			</select>
		      		</div>		      			
		       	 </div>
		       </div>
		        
		       <!-- 사진/과정 -->
		       <div class="modal-body">
		       	<div class="form-group">
		       		<div style="display:inline-block;">
			       		<label for="psw">
			       			<span class="glyphicon glyphicon-sort-by-order"></span> 레시피 입력
			       		</label>
		       		</div>
		       		&nbsp;&nbsp;&nbsp;&nbsp;
		       		<div style="display:inline-block;">
		       		<!-- + -->	       		
			       		<input type="text" class="form-control" name="cooking_time" placeholder="예상시간(분)" style="width:105px; height:35px;">
			       	</div>
			       	<br/><br/>
		       		<button type="button" id="recipeProcessAddBtn" class="btn btn-primary btn-xs">+</button>	
		       		<div id="reciptInput">
		       			<!-- 사진이미지: step_img_url -->
		       			<!-- 순서 -->
		       			1 
		       			<input type="hidden" name="cooking_no" id="cooking_no" value="1">	     
			        	<div class="file-upload">
						    <label for="upload" class="file-upload__label"><span class="glyphicon glyphicon-camera"></span>사진등록</label>
						    <input id="upload_recipe" class="file-upload__input" type="file" name="stepImg">
						</div>
		       			<textarea name="cooking_desc" id="cooking_desc" class="form-control" style="margin-bottom: 5px;" placeholder="입력"></textarea>
		       			<input type="text" name="step_tip" id="step_tip" class="form-control" style="margin-bottom: 5px;" placeholder="TIP★ 입력" />
		        	</div>
		        </div>
		        
		        <button class="btn btn-block" onclick="javascript:recipeSubmit()">submit
		        	<span class="glyphicon glyphicon-ok"></span>
		        </button>
		       </div>
		      </div>
		    </div>
		  </div>
		</div>
  	</form>			
  	<script>  	
	  	
	  	$('#irdntAddBtn').click(function() {
	  		
	  		// 수정
	  		$("#irdntAdd").append('<hr/><input type="text" class="form-control" name="irdnt_name" id="irdnt_name" placeholder="재료 입력" style="margin-bottom: 5px">');
	  		$("#irdntAdd").append('<input type="text" class="form-control" name="irdnt_cpcty" id="irdnt_cpcty" step="0.5" min="0" placeholder="분량 입력" style="margin-bottom: 5px;">');
	  		$("#irdntAdd").append('<select id="irdnt_type_code" class="form-control" name="irdnt_ty_code"><option value="3060001">주재료</option><option value="3060002">부재료</option><option value="3060003">양념</option></select>');
	  		
	  		return false;
	  	});
	  	
	  	var i = parseInt($("#cooking_no").val());
	  	
	  	$('#recipeProcessAddBtn').click(function() {
	  		
	  		$("#reciptInput").append('<hr/>'+ (i + 1) +'<input type="hidden" name="cooking_no" id="cooking_no" value="'+ (i + 1) +'">');
	  		$("#reciptInput").append('<div class="file-upload"><label for="upload" class="file-upload__label"><span class="glyphicon glyphicon-camera"></span>사진등록</label><input id="upload" class="file-upload__input" type="file" name="stepImg"></div>');
	  		$("#reciptInput").append('<textarea name="cooking_desc" id="cooking_desc" class="form-control" style="margin-bottom: 5px;" placeholder="입력"></textarea>');
	  		$("#reciptInput").append('<input type="text" name="step_tip" id="step_tip" class="form-control" style="margin-bottom: 5px;" placeholder="TIP★ 입력">');
	  		
	  		i++;
	  		
	  		return false;
	  	});

	  	
  	</script>
 </body>
 </html>