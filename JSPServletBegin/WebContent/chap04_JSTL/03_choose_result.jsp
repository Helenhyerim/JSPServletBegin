<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- ==== JSTL(Java Standard Tag Library) 사용하기 ==== --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>choose 를 사용하여 전송되어져 온 주민번호를 가지고 성별을 파악한 결과물 출력하기</title>
</head>
<body>

	<c:set var="jubun" value="${param.jubun }"/>
	<c:set var="len" value="${fn:length(jubun) }"/>
	<c:set var="genderno" value="${fn:substring(jubun, 6, 7) }"/> 
	
	주민번호 : ${jubun} <br>
	주민번호 문자열 길이 : ${len} <br>
	성별을 나타내어주는 숫자 : ${genderno} <br>
	
	<c:if test="${len eq 0 }">
    	<span style="color: red;">주민번호를 입력하지 않으셨습니다.</span><br/>
    </c:if>
    
    <c:if test="${len ne 0 and len ne 13 }">
    	<span style="color: red;">주민번호의 길이가 맞지 않습니다.</span><br/>
    </c:if>
    
    <c:if test="${len eq 13}">
    	<c:choose>
    		<c:when test="${genderno eq '1'}">
    			1900 년대생 남자입니다.<br/>
    		</c:when>
    		
    		<c:when test="${genderno eq '2'}">
    			1900 년대생 여자입니다.<br/>
    		</c:when>
    		
    		<c:when test="${genderno eq '3'}">
    			2000 년대생 남자입니다.<br/>
    		</c:when>
    		
    		<c:when test="${genderno eq '4'}">
    			2000 년대생 여자입니다.<br/>
    		</c:when>
    		
    		<c:otherwise>
    			성별을 알 수 없습니다.
    		</c:otherwise>
    	</c:choose>
    </c:if>

</body>
</html>