<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두개의 수를 입력받아 곱해주기</title>
</head>
<body>
	<h2>두개의 수를 입력받아 곱해주기</h2>

	<form name="myFrm">
		<p>
	         첫번째 수 : <input type="text" name="firstNum1" size="5" maxlength="5" /><br/>
	         두번째 수 : <input type="text" name="secondNum1" size="5" maxlength="5" /><br/>
	     <input type="button" onclick="goSubmit()" value="계산하기" />
	     <input type="reset"  value="취소" />
      </p>
	</form>
	
	<script type="text/javascript">
		// Function declaration
		function goSubmit() {
			// 정규표현식으로 유효성검사
			const regExp = /^[0-9]{1,5}$/;
			
			const frm = document.myFrm;
			const num1 = frm.firstNum1.value.trim();
			const num2 = frm.secondNum1.value.trim();
			
			if( !(regExp.test(num1) && regExp.test(num2)) ){
				alert("숫자로만 입력하세요");
				frm.firstNum1.value = "";
				frm.secondNum1.value = "";
				frm.firstNum1.value.focus();
				return; // 종료
			}
		
			frm.action = "01Multiply_result_02.jsp";
			// frm.method = "get"; // method 를 명시하지 않으면 기본값은 "get" 이다.
			frm.submit();
			
		}// end of function goSubmit()----------------------------
	
	</script>
</body>
</html>