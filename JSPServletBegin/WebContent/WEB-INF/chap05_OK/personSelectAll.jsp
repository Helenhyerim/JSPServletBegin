<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, chap05.PersonDTO_02" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String ctxPath = request.getContextPath();
	//		/JSPServletBegin
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인성향 모든 정보 출력 페이지</title>

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="<%=ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" type="text/css">

<style type="text/css">
	div#tbl {
		width: 80%;
		margin: 20px auto;
	}
	
	div#tbl > table {
		width: 100%;
		border-collapse: collapse;
	}
	
	div#tbl > table th, div#tbl > table td {
		border: solid 1px gray;
	}
	
	div#tbl > table > tbody > tr:hover {
      background-color: blue;
      color: white;
      cursor: pointer;
   }
   
   tbody > tr > td:nth-child(1) > span  { 
      color: blue; 
      display: none;
   }
   
   div.container > table > tbody > tr:hover {
      cursor: pointer;
   }
	
</style>

<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		$("tbody > tr").click(function(){// 디테일한 정보를 알고자 하는 학생의 아무정보나 클릭시
			
			const $target = $(event.target);	// <td> 태그이다.
			// console.log("확인용 $target.html() =>" + $target.html());
			
			const seq = $target.parent().find("span").text(); // 클릭한 곳(td)의 부모(tr) 에서 span 태그(seq)를 찾아서 내용물 갖고온다.
			// console.log("확인용 seq =>" + seq);
			
			// 해당 학생의 seq 로 그 학생만의 디테일을 보여주는 페이지로 넘긴다.
			location.href="personDetail.do?seq="+seq; // 상대경로, GET
			
		});
		
	});
</script>
</head>
<body>
	
	<div id="tbl">
		<h3>개인성향 모든 정보 출력 페이지(스크리틀릿을 사용하여 작성한 것)</h3>
<%
	List<PersonDTO_02> personList = (List<PersonDTO_02>)request.getAttribute("personList");
	
	if(personList.size() > 0){ %>
		<table>
			<thead>
				<tr>
					<th>성명</th>
					<th>학력</th>
					<th>색상</th>
					<th>음식</th>
					<th>등록일자</th>
				</tr>
			</thead>
			
			<tbody>
		<% 
			for(PersonDTO_02 psdto :personList) { %>
				<tr>
					<td><span><%= psdto.getSeq()%></span><%= psdto.getName() %></td>
					<td><%= psdto.getSchool() %></td>
					<td><%= psdto.getColor() %></td>
					<td><%= psdto.getStrFood() %></td>
					<td><%= psdto.getRegisterday() %></td>
				</tr>
		<%	}	%>
				
			</tbody>
		</table>
<% 	}
	else { %>
		<span style="color: red;">데이터가 존재하지 않습니다.</span>
<%	} %>
	
	</div>
	
	<hr style="border: solid 1px gold; margin: 30px 0;">
	
	<div class="container">
		<h3>개인성향 모든 정보 출력 페이지(JSTL을 사용하여 작성한 것)</h3>
		
		<table class="table table-hover">
		  <thead>
		    <tr>
				<th>성명</th>
				<th>학력</th>
				<th>색상</th>
				<th>음식</th>
				<th>등록일자</th>
			</tr>
		  </thead>
		  
		  <tbody>
		      <c:if test="${not empty requestScope.personList }">
		      	<c:forEach var="psdto" items="${requestScope.personList}">
		      		<tr>
					<td><span>${psdto.seq}</span>${psdto.name}</td> <!-- dto 클래스에서 가져올 메소드의 get 을 빼고 첫글자는 소문자로 한다. -->
					<td>${psdto.school}</td>
					<td>${psdto.color}</td>
					<td>${psdto.strFood}</td>
					<td>${psdto.registerday}</td> 
				</tr>
		      	</c:forEach>
		      </c:if>
		      
		      <c:if test="${empty requestScope.personList }">
		      	<span style="color: red;">데이터가 존재하지 않습니다.</span>
		      </c:if>
	
		  </tbody>
		</table>
		
	</div>
	
	<div style="width: 80%; margin: 0 auto;">
		<p class="text-center">
			<button type="button" class="btn btn-info" onclick="javascript:location.href='personRegister.do'">개인성향 입력페이지 가기</button>
		</p>
	</div>
	
</body>
</html>