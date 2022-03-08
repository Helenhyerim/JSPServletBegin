<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- ==== JSTL(Java Standard Tag Library) 사용하기 ==== --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- === 변수의 선언방법 === --%>
<c:set var="result" value="${param.firstNum1 * param.secondNum1}" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두개의 수를 입력받아 곱한 결과를 출력하기</title>
</head>
<body>

	${param.firstNum1} 와 ${param.secondNum1} 의 곱은 ${result} 입니다.

</body>
</html>