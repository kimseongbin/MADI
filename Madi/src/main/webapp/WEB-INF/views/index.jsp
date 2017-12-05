<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<title>마디 - 재료로 요리하다</title>
	<link href="https://fonts.googleapis.com/css?family=Pacifico" rel="stylesheet">
	
	<!-- 카카오 api 연동 -->
	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	
	
	
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
	    	font-color: white;
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
    .parallax {
    /* The image used */
    background-image: url("./resources/image/wallpaper_v2.png");

    /* Full height */
    height: 100%; 

    /* Create the parallax scrolling effect */
    background-attachment: fixed;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover; 
	
	}
    
    .form-control {
    	color: white;
    	font-weight: bold;
    	font-family: 'Nanum Gothic', sans-serif;
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
   ::-webkit-input-placeholder { /* Chrome/Opera/Safari */
  	color: pink;
	}
	input:focus {
  		outline: none;
	}
</style>
<script>
	function falseReciver() {
		return false;
	}
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
    var idcheck;
    function joinIdCheck() {
    	var id = $("#join_user_id").val();
		var reg =  /^[a-zA-Z0-9]{6,20}$/;
		if(!reg.test(id)) {
			$("#idReporter").empty();
			$("#idReporter").css("color","red");
			$("#idReporter").append("6~20자의 영문 대소문자와 숫자를 혼합해 입력해주세요");
			idcheck=0;
		}
		if(reg.test(id)){
			$.ajax({
				url: "./join.do?ck=id",
				type: "POST",
				data: {
					user_id: id
				},
				success: function(data) {
					if(data != 0) {
						$("#idReporter").empty();
						$("#idReporter").css("color","red");
						$("#idReporter").append("아이디가 중복되었습니다");
						idcheck=0;
					} else {
						$("#idReporter").empty();
						$("#idReporter").css("color","green");
						$("#idReporter").append("사용할 수 있는 아이디입니다");
						idcheck=1;
					}
				}
			});
		}
    }
    var pwcheck;
    function joinPwCheck() {
    	 var pw = $("#join_user_pw").val();
		 var num = pw.search(/[0-9]/g);
		 var eng = pw.search(/[a-z]/ig);
		 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		 
		 if(pw.length < 8 || pw.length > 20){
			 $("#pwReporter").empty();
		     $("#pwReporter").css("color","red");
			 $("#pwReporter").append("비밀번호는 8자리 ~ 20자리 이내로 입력해주세요");
		  	 pwcheck=0;
		  	 return;
		 }
		 if(pw.search(/₩s/) != -1){
			 $("#pwReporter").empty();
		     $("#pwReporter").css("color","red");
			 $("#pwReporter").append("비밀번호는 공백업이 입력해주세요");
			 pwcheck=0;
			 return;
		 }
		 if(num < 0 || eng < 0 || spe < 0 ){
			 $("#pwReporter").empty();
		     $("#pwReporter").css("color","red");
			 $("#pwReporter").append("비밀번호는 영문, 숫자, 특수문자를 혼합하여 입력해주세요");
			 pwcheck=0;
			 return;
		 }
		 pwcheck=1;
    }
    var emailcheck;
    function joinEmailCheck() {
    	var email = $("#join_user_email").val();
    	$.ajax({
			url: "./join.do?ck=email",
			type: "POST",
			data: {
				user_email: email
			},
			success: function(data) {
				if(data != 0) {
					$("#emailReporter").empty();
					$("#emailReporter").css("color","red");
					$("#emailReporter").append("중복된 이메일입니다");
					emailcheck=0;
				} else {
					$("#emailReporter").empty();
					$("#emailReporter").css("color","green");
					$("#emailReporter").append("사용할 수 있는 이메일입니다");
					emailcheck=1;
				}
			}
		});
    }
   function joinFormCheck() {
		var name = $("#join_user_name").val();
		var email = $("#join_user_email").val();
		
		if(name.length == 0) {
			alert("이름을 입력해주세요.");
			return false;
		}
		if(email.length == 0) {
			alert("이메일을 입력해주세요.");
			return false;
		}
		
		if(idcheck==0) {
			alert("아이디가 잘못 입력되었습니다");
			return false;
		}
		
		if(pwcheck==0) {
			alert("비밀번호가 잘못 입력되었습니다");
			return false;
		}
		if(emailcheck==0) {
			alert("이메일이 잘못 입력되었습니다");
			return false;
		}
		return true;
	   
   }
</script> 
<body class="parallax">
<div class="container-fluid row vertical-center">
	<div class="container col-sm-3">
		<div id="login">
		<div class = "panel panel-default text-center" style="border:none; border-radius:8px; background: rgba(72,72,72,.4);">
  			<h2 class="madi_title" style="margin-top:0; opacity:0.9;"><font color="#DE4F4F">Madi</font></h2>
  			<p class="madi_content"><b><font color="white"><big>지금 마디를 시작하세요</big></font></b></p>
  			<hr/>
    		<!-- 카카오버튼입니다 -->
  			<a id="kakao-login-btn1"></a>
  			<hr/>
  			<form action="./login.do" method="post">
    			<div class="form-group ">
    	  			<input type="text" class="form-control" id="login_user_id" placeholder="아이디" name="user_id" style="background-color:transparent; outline:none; border-radius: 0;">
	      			<input type="password" class="form-control" id="login_user_pw" placeholder="비밀번호" name="user_pw" style="background-color:transparent; outline:none; border-radius: 0;">
    			</div>
    			<hr/>
      			<button type="submit" class="btn btn-primary btn-block madi_content">로그인</button>
      			<br/>
      			<p class="madi_content"><a href="#" style="font-weight:bold; font-color:#4948FF;">비밀번호를 잊으셨나요?</a></p>
  			</form>
		</div>
		<div class="panel panel-default text-center" style="border:none; border-radius:8px; background:rgba(72,72,72,.4);">
			<span><font color="white">계정이 없으신가요?</font></span>&nbsp;<a class="madi_content" href="javascript:dpJoin();" style="font-weight:bold; font-color:#4948FF;"><big>가입하기</big></a>
		</div>
	</div>
	<div id = "join">
		<div class ="panel panel-default text-center opa" style="border:none; border-radius:8px; background: rgba(72,72,72,.4);">
  			<h2 class="madi_title" style="margin-top:0; opacity:0.9;"><font color="#DE4F4F">Madi</font></h2>
  			<p class="madi_content"><b><font color="white"><big>레시피를 검색하고<br/>요리를 공유하려면 가입하세요</big></font></b></p>
  			<hr/>
  			<!-- 카카오버튼입니다 -->
  			<div id="kakao-login-btn"></div>
  			<hr/>
  			<form action="./join.do" method="post" onsubmit="return joinFormCheck();">
    			<div class="form-group" style="margin-bottom: 0px;">
      				<input type="text" class="form-control" id="join_user_id" onChange="joinIdCheck();"
      				placeholder="아이디" name="user_id" maxlength="20" style="margin-top:0; margin-bottom:0; background-color:transparent; outline:none; border-radius: 0;"/>
      				<div id="idReporter" style="color:red; height:20px;"></div>
      				<input type="password" class="form-control" id="join_user_pw" onchange="joinPwCheck();" 
      				placeholder="비밀번호" name="user_pw" maxlength="20" style=" margin-top:0; margin-bottom:0;background-color:transparent; border-radius: 0;"/>
      				<div id="pwReporter" style="color:red; height:20px;"></div>
      				<input type="text" class="form-control" id="join_user_name"
      				placeholder="이름" name="user_name"  style="margin-top:0; margin-bottom:0; background-color:transparent; border-radius: 0;"/>
      				<div style="color:red; height:20px;"></div>
      				<input type="email" class="form-control" id="join_user_email" onchange="joinEmailCheck();"
      				placeholder="이메일" name="user_email" style="margin-top:0; margin-bottom:0; background-color:transparent; border-radius: 0;"/>
      				<div id="emailReporter" style="color:red; height:20px;"></div>
    			</div>
    			<hr style="margin-top: 0px;"/>
      			<button type="submit" class="btn btn-primary btn-block">회원가입</button>
  			</form>
		</div>
		<div class = "panel panel-default text-center madi_content" style="border:none; border-radius:8px; background:rgba(72,72,72,.4);">
			<span><font color="white">계정이 있으신가요?</font></span>&nbsp;<a class="madi_content" href="javascript:dpLogin();" style="font-weight:bold; font-color:#4948FF;"><big>로그인</big></a>
		</div>
	</div>
</div>
</div>
</body>

<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init("ec2bc08d0edf68093b110c9b65f97883");
   
    
    
    // 카카오 로그인 버튼을 생성합니다.(첫번째 버튼)
    Kakao.Auth.createLoginButton({
    	   
      container: '#kakao-login-btn',
      success: function(authObj) {
      	 getProfile();
      	 
      },
      fail: function(err) {
         alert(JSON.stringify(err));
      }
    }); 
 // 카카오 로그인 버튼을 생성합니다.(두번째 버튼)  	
    Kakao.Auth.createLoginButton({
 	   
        container: '#kakao-login-btn1',
        success: function(authObj) {
        	 getProfile();
        	 
        },
        fail: function(err) {
           alert(JSON.stringify(err));
        }
      }); 
    
    //카카오 로그아웃
    function logout(){
    	Kakao.Auth.logout(function() { 
    		alert('로그아웃되었습니다');
    		location.href="./kakaologout.do"; 
    		
    		});
    };
   	//카카오버튼 클릭시 수행할 메소드    
    function getProfile(){
    	Kakao.API.request({
			url: '/v1/user/me',
			success: function(res) {
				var a = res.properties.nickname;
				var b = res.properties.profile_image;
				var c = res.kaccount_email;	
				var d = res.id;
				location.href="./checkMember.do?user_name="+ a + "&user_img=" + b + "&user_email=" + c + "&user_id=" + d ; 				
				//$("#kakao-profile").append(res.properties.nickname);
				//$("#kakao-profile").append($("<img/>",{"src":res.properties.profile_image,"alt":res.properties.nickname+"님의 프로필 사진"}));
				//$("#kakao-profile").append(res.kaccount_email);
				//$("#kakao-profile").append(res.kaccount_email_verified);
					
				
			},
			fail: function(error) {
				console.log(error);
			}
		});
    };
  //]]>
</script>

</html>