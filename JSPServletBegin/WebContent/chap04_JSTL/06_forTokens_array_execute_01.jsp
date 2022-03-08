<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="chap03.PersonDTO, java.util.*" %>

<%
	String FriendNames1 = "태연,아이유,송혜교,김태희,유재석";
	String FriendNames2 = "이제훈,고수.강동원,김흥국/이순신";
	
	request.setAttribute("FriendNames1", FriendNames1);
	request.setAttribute("FriendNames2", FriendNames2);
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("06_forTokens_view_02.jsp"); // 같은 경로에 있으니까 
	dispatcher.forward(request, response);
	
	
	
	
%>