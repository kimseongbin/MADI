<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.spring.madi.MemberVO"%>
<% MemberVO vo = (MemberVO)request.getAttribute("user");  %>
<% request.setAttribute("genderchk", vo.getUser_gender()); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script>
	var chk = ${genderchk};
	alert(chk);
	if (chk == 0) {
		$("#join_user_gender").attr("checked", "checked");
	} else {
		$("#join_user_gender").attr("checked", "checked");
	}
</script>

<div>
	<form action="./updateInfo.do" method="post">
		<div class="form-group">		
			<hr/>
			<font class="madi_subtitle2">아이디</font><input type="text" class="form-control" id="join_user_id" placeholder="아이디" name="user_id" maxlength="20" value="<%=vo.getUser_id() %>" disabled="disabled" />
			<hr/>
      		<font class="madi_subtitle2">이름</font><input type="text" class="form-control" id="join_user_name" placeholder="이름" name="user_name" value="<%=vo.getUser_name() %>" disabled="disabled"/>
			<hr/>
      		<font class="madi_subtitle2">비밀번호</font><input type="password" class="form-control" id="join_user_pw" placeholder="비밀번호" name="user_pw" maxlength="20" value="<%=vo.getUser_pw()%>"/>
			<hr/>
      		<font class="madi_subtitle2">이메일</font><input type="email" class="form-control" id="join_user_email" placeholder=" 이메일" name="user_email" value="<%=vo.getUser_email()%>"/>
			<hr/>
			<font class="madi_subtitle2">성별</font><br/>
            <div class="btn-group" data-toggle="buttons" style="width:inherit;">
  					<input type="radio" name="user_gender" id="join_user_gender" value="0" disabled="disabled">남
    				<input type="radio" name="user_gender" id="join_user_gender" value="1" disabled="disabled">여
             </div>
    	</div>
    	<hr/>
      	<button type="submit" class="btn btn-primary btn-block">수정</button>
  	</form>
</div>
