<%@page import="com.spring.madi.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<title>이 페이지는 카카오로그인 성공시 간편회원가입창 입니다.</title>
	<link href="https://fonts.googleapis.com/css?family=Pacifico" rel="stylesheet">
	<style>
		@import url('https://fonts.googleapis.com/css?family=Pacifico');
		@import url('https://fonts.googleapis.com/earlyaccess/nanumgothic.css');	
	    .madi_title { 
	    	font-family: 'Pacifico', cursive;
	    	font-size: 55px; 
	    }
	    
	    .madi_logo {
	   		font-family: 'Pacifico', cursive;
	    	font-size: 37px; 
	    }
	    
	    .madi_content {
	    	font-family: 'Nanum Gothic', sans-serif;
	    }
	    
	    
	</style>	
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
	
	<!-- 카카오로그인 정보를 받아옵니다 (카카오 아이디, 이름, 프로필 사진, 유저 이메일) -->
	<% String user_id = (String)request.getAttribute("kakao_id");	%>
	<% String user_img = (String)request.getAttribute("kakao_img");	%>
	
	<% int x  = (Integer)(request.getAttribute("x")); %>


<style>
	body {
		overflow: hidden;
	}
	.vertical-center {
  		min-height: 100%;  /* Fallback for browsers do NOT support vh unit */
  		min-height: 100vh; /* These two lines are counted as one :s-)       */

  		display: flex;
  		align-items: center;
	}
	.container-fluid {
		background-image: url("./resources/image/wallpaper.jpg");
		background-size: cover;
    }
    
    #color-overlay {
    	position: absolute;
    	top: 0;
    	left: 0;
    	width: 100vw;
    	height: 100vh;
    	background-color: black;
    	opacity: 0.3;
    }
    .panel-default {
    	border: 1px solid #fafafa;
        border-radius: 0;
        padding-top: 35px;
        padding-left: 35px;
        padding-right: 35px;
        padding-bottom: 35px;
    }
    .panel-default input {
    	margin-top: 15px;
        background: #fafafa;
        margin-bottom: 15px;
    }
    .panel-default input:nth-child(4) {
    	margin-bottom: 15px;
    }
    #login {
    	display: none;
    }
   @media screen and (max-width:650px) {
   	 #indexImg{
    	display:none;
    }
    #login {
    	width: 440px;
    	margin-top: 100px;
    }
    #join {
    	width: 440px;
    	margin-top: 35px;
    }
   }
</style>
<script>
	/*
	function dpLogin() {
    	var lo = document.getElementById("login");
        var jo = document.getElementById("join");
    	lo.style.display = "block";
        jo.style.display = "none";
      
    }
	
    function dpJoin() {
    	var lo = document.getElementById("login");
        var jo = document.getElementById("join");
    	lo.style.display = "none";
        jo.style.display = "block";
      
    }
    function joinIdCheck() {
    	var id = $("#join_user_id").val();
		var reg =  /^[a-zA-Z0-9]{6,20}$/;
		if(!reg.test(id)) {
			alert("아이디는 6~20자의 영문 대소문자와 숫자를 혼합하여 입력해주세요.");
			return false;
		}
		return true;
    }
    function joinPwCheck() {
    	 var pw = $("#join_user_pw").val();
		 var num = pw.search(/[0-9]/g);
		 var eng = pw.search(/[a-z]/ig);
		 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		 
		 if(pw.length < 8 || pw.length > 20){
		  alert("비밀번호는 8자리 ~ 20자리 이내로 입력해주세요.");
		  return false;
		 }
		 if(pw.search(/₩s/) != -1){
		  alert("비밀번호는 공백업이 입력해주세요.");
		  return false;
		 }
		 if(num < 0 || eng < 0 || spe < 0 ){
		  alert("비밀번호는 영문, 숫자, 특수문자를 혼합하여 입력해주세요.");
		  return false;
		 }
		 return true;
    }
    
   function joinFormCheck() {
		var name = $("#join_user_name").val();
		var email = $("#join_user_emial").val();
		
		if(joinIdCheck() && joinPwCheck() && name.length >= 1 && email != null) {
			return true;
		}
	   
   } */
    function joinFormCheck() {
		var name = $("#join_user_name").val();
		var email = $("#join_user_email").val();
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		
		//메일체크
		if(exptext.test(email)==false ){
			
			//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			
			alert("이 메일형식이 올바르지 않습니다.");
			
			return false;
		}
		if(name.length < 2) {
			alert('이름은 2글자 이상 입력해주세요');
			return false;
		}
		//남녀체크
		//if($("#join_user_gender").is(":checked")==true){
		if($('input:radio[name=user_gender]').is(':checked')==true){
				
		}else{
			alert("성별을 체크해 주세요");
			return false;
		}
				
		if(name.length >= 2 && email != null) {
			return true;
		}
	//onsubmit 에서 꼭 리턴을 줘야하네요?
		
	    
   }
	//이메일 중복체크로 count 값 x 를 받아옵니다
	var x = <%= x %>	
	if(x != 0 ){
	alert("중복된 이메일 입니다. 다른계정을 확인해 보세요");
	//첫 화면으로 보냅니다..
	location.href="./";
	//location.href="redirect:/checkMember.do?user_name="+memberVO.getUser_name()+"&user_img="+memberVO.getUser_img()+"&user_email="+memberVO.getUser_email()+"&user_id="+memberVO.getUser_id();
	}
	

   
   
   
   
</script> 
<body> <!-- background="./resources/image/wallpaper.jpg;"  -->
<div class="container-fluid row vertical-center">
	<div id="color-overlay"></div>
	<div class="container col-sm-3">
	<div id = "join">
		<div class = "panel panel-default text-center" style="border-radius: 8px;">
  			<h2 class="madi_title" style="margin-top:0;">Madi</h2>
  			<p class="text-muted madi_content"><b>간편 회원가입<br/>레시피를 검색하고 요리를 공유하려면<br/>가입하세요.</b></p>
  			<hr/>
 			<form action="./sns_join.do" method="post" onsubmit="return joinFormCheck();">
 				<input type="hidden" name= "user_id" value="<%= user_id %>">
 				<input type="hidden" name="user_img" value="<%= user_img %>">
    			<div class="form-group">
      				<input type="email" class="form-control" id="join_user_email" placeholder="이메일을 입력해주세요" name="user_email" />
      				<input type="text" class="form-control" id="join_user_name" placeholder="이름을 입력해주세요" name="user_name" />
                    <div class="btn-group" data-toggle="buttons" style="width:inherit;">
  						<label class="btn btn-default" style="width:184px; outline:none;">
    						<input type="radio" name="user_gender" id="join_user_gender" autocomplete="off" value="0">남
 						</label>
  						<label class="btn btn-default" style="width:184px; outline:none;">
    						<input type="radio" name="user_gender" id="join_user_gender" autocomplete="off" value="1">여
    					</label>
                 	</div>
    			</div>
    			<hr/>
      			<button type="submit" class="btn btn-primary btn-block">회원가입</button>
  			</form>
		</div>
		<!--  
		<div class = "panel panel-default text-center madi_content" style="border-radius: 8px;">
			<span>계정이 있으신가요?</span>&nbsp;<a class="madi_content" href="javascript:dpLogin();">로그인</a>
		</div>
		-->
	</div>
</div>
</div>
</body>
</html>