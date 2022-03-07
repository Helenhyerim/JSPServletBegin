<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 필요한 클래스를 import 할때는, <%@ page  %> page directive(페이지 지시어)를 사용하여 import 한다.--%>
<%@ page import="java.util.Date" %>

<%
	// *** 현재시각을 알아오기 *** //
	Date now = new Date(); // 현재시각
	
	String currentTime = String.format("%tF %tT %tA", now, now, now); 
	
	int sum = 0;
%>
<%= currentTime%>
<br>
&copy; 이 웹페이지의 저작권은 이순신에게 있습니다.
<br>