<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- ==== JSTL(Java Standard Tag Library) 사용하기 ==== --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>친구 명단 출력하기</title>
</head>
<body>

	<c:if test="${empty requestScope.arrFriendName }">
		<div>
			<span style="color: red;">친구 명단이 없습니다. </span>
		</div>
	</c:if>

	<c:if test="${not empty requestScope.arrFriendName }">
		<div>
			<ol>
				<c:forEach var="friendName" items="${requestScope.arrFriendName }">
					<%-- var="friendName" 에는 반복문을 돌면서 값들이 차례대로 들어온다. --%> <%-- items="${}" 에는 배열 또는 List 타입이다. --%>
					<li style="color: blue;">${friendName }</li>
				</c:forEach>
			</ol>
		</div>
	</c:if>
	
	
	<hr style="border: solid 1px red;">
	
	
	<c:if test="${empty requestScope.personList }">
		<div>
			<span style="color: red;">회원 명단이 없습니다. </span>
		</div>
	</c:if>

	<c:if test="${not empty requestScope.personList }">
		<div>
			<c:forEach var="psdto" items="${requestScope.personList }">
						<%-- var="psdto" 에는 반복문을 돌면서 값들이 차례대로 들어온다. --%> <%-- items="${}" 에는 배열 또는 List 타입이다. --%>
				<ol>
						<li>성명: ${psdto.name }</li>
						<li>학력: ${psdto.school }</li>
						<li>색상: ${psdto.color }</li>
						<li>음식: ${psdto.strFood }</li>
				</ol>
			</c:forEach>
		</div>
	</c:if>
	
</body>
</html>