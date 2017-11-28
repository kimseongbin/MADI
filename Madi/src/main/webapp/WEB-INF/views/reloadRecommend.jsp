<%@page import="com.spring.madi.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.spring.madi.MemberFollowVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
List<MemberFollowVO> recommendList= (ArrayList<MemberFollowVO>)request.getAttribute("recommendList");
MemberVO memberVO= (MemberVO)request.getAttribute("memberVO");
%>
	<div class="btn-group-vertical Recommends" style="font-size: 17px; background-color: #F6F6F6">
		<form>
			<ul class="ul fol2">
				<%for(int y=0; y<recommendList.size(); y++) {
					MemberFollowVO recommend= recommendList.get(y);
					if (y%3 == 0) {%>

				<%						
					}
				%>
						<li class="li fol2"><img src="<%=recommend.getFollowing_user_img()%>" class="img-circle" height="40"
							width="40">&nbsp; <a href="#">
							<strong><%=recommend.getFollowing_user_id()%></strong></a>&emsp;
							<button type="button" class="btn btn-danger btn"
								onclick="insertFollowing('<%=memberVO.getUser_id()%>', '<%=recommend.getFollowing_user_id()%>',
								'<%=memberVO.getUser_img()%>', '<%=recommend.getFollowing_user_img()%>')" style="border-radius: 10px;">
								<strong style="font-size:15px;">팔로우</strong>
							</button>&nbsp;
						</li>

<%
					if (y%3 == 2 || y == recommendList.size()-1) {
%>
			</ul>
		</form>
	</div>
			<%					
					}
				}
			%>
						
<script>
	$(document).ready(function() {
		var Recommends= document.getElementsByClassName("Recommends")
		for(var y=0; y< Recommends.length; y++) {
			if(y == 0) {
				Recommends[y].style.display="block";
			} else {
				Recommends[y].style.display="none";
			}
		}
		
		var currentLocation= 0;
		$("moreRecommends").click(function() {
			currentLocation += 1;
			Recommends[currentLocation - 1].style.display="none";
			if(currentLocation == Recommends.length) {
				Recommends[0].style.display="block";
				currentLocaton= 0;
			} else {
				Recommends[currentLocation].style.display="block";
			}
		});
	});
</script>