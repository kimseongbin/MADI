<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	var socket;
	function connect() {
		socket = new WebSocket("ws://localhost:8080/madi/chatting");
		
		socket.onopen = onOpen;
		socket.onmessage = onMessage;
		socket.onclose = onClose;
	}
	function onOpen(e) {
		alert("연결되었습니다");
	}
	function onClose(e) {
		alert("연결 종료");
	}
	function onMessage(e) {
		var msg = e.data.toString();
		alert("서버로부터 메시지를 전송받았습니다  " + msg);
	}
	function send() {
		var msg = $("#chatMsg").val();
		socket.send(msg);
	}
</script>
<body>
	<button onclick="connect();">연결</button>
	<input type="text" id="chatMsg"/>
	<button onclick="send();">전송</button>
</body>
</html>