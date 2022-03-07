<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int firstNum = (Integer)request.getAttribute("firstNum");
	int secondNum = (Integer)request.getAttribute("secondNum");
	int sum = (Integer)request.getAttribute("sum");
	// auto Unboxing (Integer ==> int)
	
	String s_firstNum = request.getParameter("firstNum");
	String s_secondNum = request.getParameter("secondNum");
	// form 태그에서 name 값을 forward 한 파일에서도 바로 getParameter로 가져올 수 있다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계산된 결과값을 보여주는 곳</title>
</head>
<body>
	<h3>계산된 결과값 -1</h3>
	<%=firstNum %>부터 <%=secondNum %>까지의 합은? <br> 
	결과값 : <span style="color:red;"><%=sum %></span>
	
	<br><br>
	
	<h3>계산된 결과값 -2</h3>
	<%=s_firstNum %>부터 <%=s_secondNum %>까지의 합은? <br> 
	결과값 : <span style="color:blue;"><%=sum %></span>
	
	
</body>
</html>