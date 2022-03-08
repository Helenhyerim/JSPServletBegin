<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="chap03.PersonDTO, java.util.*" %>

<%
	String[] arrFriendName = {"태연","아이유","송혜교","김태희","유재석"};
	
	request.setAttribute("arrFriendName", arrFriendName);
	
	
	///////////////////////////////////////////////////////////////////////////////////////////
	
	List<PersonDTO> personList = new ArrayList<>();
	
	PersonDTO person1 = new PersonDTO();
	person1.setName("김태희");
	person1.setSchool("고졸");
	person1.setColor("red");
	person1.setFood("라면,초콜릿,사탕".split("\\,"));
	
	PersonDTO person2 = new PersonDTO();
	person2.setName("송혜교");
	person2.setSchool("대졸");
	person2.setColor("blue");
	person2.setFood("라면,초콜릿,사탕".split("\\,"));
	
	PersonDTO person3 = new PersonDTO();
	person3.setName("아이유");
	person3.setSchool("대학원졸");
	person3.setColor("green");
	person3.setFood("라면,초콜릿,사탕".split("\\,"));
	
	personList.add(person1);
	personList.add(person2);
	personList.add(person3);
	
	request.setAttribute("personList", personList);
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("05_forEach_view_02.jsp");
    dispatcher.forward(request, response);
	
%>