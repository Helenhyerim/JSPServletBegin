<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 스케줄</title>

<link rel="stylesheet" type="text/css" href="./css/style.css" />

</head>
<body>

	<h3>오늘의 스케줄</h3>
	<ol>
		<li>기상</li>
		<li>출근</li>
		<li>퇴근</li>
		<li>공부</li>
	</ol>
	<div id="today">
	현재시각 : <%@ include file="./03_1_todayTime.jsp" %>
	</div>
</body>
</html>