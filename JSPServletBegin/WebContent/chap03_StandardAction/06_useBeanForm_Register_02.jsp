<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form 태그를 사용한 데이터 전송시 useBean 을 사용하여 결과 보여주기</title>
</head>
<body>
	<h2>개인성향 입력 결과 정보(JSP 표준액션 중 useBean 사용)</h2>
	
	<jsp:useBean id="psdto" class="chap03.PersonDTO" />
	<%-- form 태그에서 넘어온 name 의 값이다. --%>
	<jsp:setProperty property="name" name="psdto" value="${param.name}"/> 
	<jsp:setProperty property="school" name="psdto" value="${param.school}"/> 
	<jsp:setProperty property="color" name="psdto" value="${param.color}"/> 
	<jsp:setProperty property="food" name="psdto" value="${paramValues.food}"/> 
	<%-- getParameterValues 와 같은 것이다. --%>
	
	<ul>
		<li>성명 : <jsp:getProperty property="name" name="psdto" /></li>
		<li>학력 : <jsp:getProperty property="school" name="psdto" /></li>
		<li>색상 : <jsp:getProperty property="color" name="psdto" /></li>
		<li>음식 : <jsp:getProperty property="strFood" name="psdto" /></li>
	</ul>
	
	
	<br>
	<hr style="border: solid 1px red;" >
	<br>
	
	
	<jsp:useBean id="psdto_2" class="chap03.PersonDTO" />
	<jsp:setProperty property="*" name="psdto_2" /> 
	<%-- 
		위와 같이 <jsp:setProperty property="*" name="psdto_2" />  을 사용하기 위한 전제조건은
		chap03.PersonDTO 클래스에 setXXX() 메소드의 XXX 이름과 form 태그에서 전달되어져 오는 name 값이 같아야 한다.
		예:> setName 의 name 과, form 태그의 name="name" 이 같아야 한다.
			setFoode 의 food 과, form 태그의 name="food" 이 같아야 한다.
		그러면 일일이 쓸 필요없이 알아서 찾아간다.
		즉, db 의 컬럼네임(DTO) 와 form 태그의 name 값이 같아지면 간단해진다.
	 --%>
	
	<ul>
		<li>성명 : <jsp:getProperty property="name" name="psdto_2" /></li>
		<li>학력 : <jsp:getProperty property="school" name="psdto_2" /></li>
		<li>색상 : <jsp:getProperty property="color" name="psdto_2" /></li>
		<li>음식 : <jsp:getProperty property="strFood" name="psdto_2" /></li>
	</ul>
	
	
</body>
</html>