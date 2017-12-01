<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<title>WebSocket</title>
<script>
	var log= function(s) {
		//밑의 textarea의 output을 찾아서 s 내용과 줄바꿈 문자를 넣어서 기존 내용과 연결하겠다
		document.getElementById("output").textContent += (s + "\n");
	}
	//html5기능. 웹서버주소/웹소켓/uri를 브로드캐스팅으로 하면 servlet-context에서 socketHandler를 사용가능
	//소켓 객체 생성 후 소켓 변환 후 웹 소켓에 접속
	w= new WebSocket("ws://localhost:8080/websocket/broadcasting");
	w.onopen= function() {
		alert("WebSocket Connected");
	}
	//서버가 온라인으로 보내면 그걸 수신하는 메시지가 온메시지
	w.onmessage= function(e) {
		log(e.data.toString());
	}
	w.onclose= function(e) {
		log("WebSocket closed");
	}
	w.onerror= function(e) {
		log("WebSocket error");
	}
	//온로드는 해당 문서가 로딩이 완료될시 자동으로 호출
	window.onload= function() {
		document.getElementById("send_button").onclick= function() {
			if (document.getElementById("nicname").value == "") {
				alert("별명을 입력하세요");
			} else {
				var nicname= document.getElementById("nicname").value;
				var input= document.getElementById("input").value;
				w.send(nicname + ">" + input);
			}
		}
	}
</script>
</head>
<body>
<input type="text" id="input" placeholder="input message..." size="55">
<button id="send_button">Send</button>
대화명<input type="text" id="nicname" placeholder="대화명 입력" size="10">
<p/>
<textarea id="output" readonly rows="30" cols="80"></textarea>
</body>
</html>