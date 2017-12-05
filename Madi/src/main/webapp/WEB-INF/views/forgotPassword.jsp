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
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="./resources/js/jquery.form.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
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
$(document).ready(function() {
	 if('${code}' == '0'){
		 alert('${message}');
		 location.href="./";
	 }else if('${code}' == '-1'){
		 alert('${message}');
	 }else if('${code}' == '-2'){
		 alert('${message}');	
	 }
});

</script>
<script>
function goPwd(){
	var userEmail = $("#email").val();
	if(userEmail==""){
		alert("이메일을 입력해 주세요.");
		return;
	}
	 $("#itx_userEmail").val(userEmail);
	 $("#itx_form").attr("action","./sendMail.do");
	 $("#itx_form").submit();  
/* 	 $("#itx_form").ajaxSubmit({
        url: "./sendMail.do",
        type:'POST',
        dataType: 'json',
        success:function(data, statusText, xhr){
            if(data["code"] == "0"){
            	alert("111");
            	alert(data["message"]);
            }else{
                alert(data["message"]);
            }
        },
        error: function(data) {
            alert(data);
        }
    });  */
	 
	/*  $.ajax({
	        url: "./sendMail.do",
	        type:'POST',
	        data: {
	        	userEmail: userEmail
	        },
	        success:function(data){
	        	
	        	
	        	
	        },
	        error: function(data) {
	        	alert("실패")
	        }
		 
	 }); */
}
</script>

<body>
	<div class="container-fluid row vertical-center">
		<div id="color-overlay"></div>
		<div class="container col-sm-3">
		<form id="itx_form" name="form" method="post" action="./forgotPassword.do">
		<input type="hidden" name="userEmail" id="itx_userEmail">
			<div id = "join">
				<div class = "panel panel-default text-center" style="border-radius: 8px;">
					<h2 class="madi_title" style="margin-top:0;">Madi</h2>
					<p class="text-muted madi_content">
						<b>비밀번호를 잊어버리셨나요?</b><br/>		
		  			</p>
		  			<hr/>
					<b>비밀번호를 찾고자하는<br/>이메일을 입력하세요</b>	
    	  			<input type="text" class="form-control" id="email" placeholder="이메일" name="email">
		   			<hr/>				
		   			<div>
						<button class="btn btn-primary btn-block" onclick="javascript:goPwd();">비밀번호 찾기</button>
					</div>	
				</div>
			</div>
		</form>		
		</div>
	</div>
</body>
</html>