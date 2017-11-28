<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<title>Bootstrap Example</title>
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
<style>
	body {
		overflow: hidden;
	}
	.vertical-center {
  		min-height: 100%;  /* Fallback for browsers do NOT support vh unit */
  		min-height: 100vh; /* These two lines are counted as one :-)       */

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
	   
   }
</script> 
<body> <!-- background="./resources/image/wallpaper.jpg;"  -->
<div class="container-fluid row vertical-center">
	<div id="color-overlay"></div>
	<div class="container col-sm-3">
	<div id = "join">
		<div class = "panel panel-default text-center" style="border-radius: 8px;">
  			<h2 class="madi_title" style="margin-top:0;">Madi</h2>
  			<p class="text-muted madi_content"><b>레시피를 검색하고 요리를 공유하려면<br/>가입하세요.</b></p>
  			<hr/>
 			<form action="./join.do" method="post" onsubmit="return joinFormCheck();">
    			<div class="form-group">
      				<input type="text" class="form-control" id="join_user_id" placeholder="아이디" name="user_id" maxlength="20" />
      				<input type="text" class="form-control" id="join_user_name" placeholder="이름" name="user_name" />
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
		<div class = "panel panel-default text-center madi_content" style="border-radius: 8px;">
			<span>계정이 있으신가요?</span>&nbsp;<a class="madi_content" href="javascript:dpLogin();">로그인</a>
		</div>
	</div>
</div>
</div>
</body>
</html>