<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%
	Map<String, String> map = (Map<String, String>)request.getAttribute("paraMap");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 성향 테스트 결과화면</title>
</head>
<body>
	<h2>개인 성향 테스트 결과</h2>
	
	<h3>스크립틀릿을 사용한 것</h3>
	<span style="color: blue;"><%= map.get("name")%></span>님의 개인 성향은 <br/><br/>
	학력은 <%= map.get("school")%>이며, <%= map.get("color")%>색을 좋아합니다. <br/>
	좋아하는 음식은 <%= map.get("foods")%>입니다. <br/>
	
	<hr style="border: solid 1px red;">
	
	
	<h3>EL을 사용한 것</h3>
	<span style="color: purple;">${requestScope.paraMap.name}</span> 님의 개인 성향은 <br/><br/>
	학력은 ${requestScope.paraMap.school}이며, ${requestScope.paraMap.color} 색을 좋아합니다. <br/>
	좋아하는 음식은 ${requestScope.paraMap.foods} 입니다. <br/>
	
	
</body>
</html>