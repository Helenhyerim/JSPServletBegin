<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 표준액션 중 include 에 대해서 알아보자</title>
</head>
<body>
	<h3>책소개</h3>
	도서명 : 어린왕자 <br>
	저자 : 이순신 <br>
	페이지 : 300p <br>
	<div>
		<jsp:include page="./01include.jsp" /> <%-- JSP 표준액션 중 jsp:include 은 실행된 결과물(html)을 가져온다는 것이다. --%>
	</div>
	가격 : 20,000원 <br>
	
	<%-- 
	<div>
		<%@ include file="./01include.jsp"%> <%-- include file 은 01include.jsp 파일의 소스를 그대로 가져온다는 것이다. --%>
	</div> 
	--%>
	
	<% int sum = 200; %>
</body>
</html>