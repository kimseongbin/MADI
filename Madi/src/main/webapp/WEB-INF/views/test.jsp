<%@ page language="java" contentType="text/html; charset=UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>Login Demo - Kakao JavaScript SDK</title>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>



</head>
<body>
<a id="kakao-login-btn"></a>

<input type="button" onclick ="logout()" value="로그아웃">



<a href="http://developers.kakao.com/logout"></a>
<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init("ec2bc08d0edf68093b110c9b65f97883");
    // 카카오 로그인 버튼을 생성합니다.
    
   	
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
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
=======
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
>>>>>>> branch 'master' of https://github.com/kimseongbin/MADI.git

</body>
</html>