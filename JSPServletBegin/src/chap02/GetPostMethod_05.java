package chap02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/* === 중요 ===
확장자가 .xml 또는 .java 인 파일에서 URL경로를 나타낼때 맨 앞에 / 가 오면
 그 앞에는  http://ip주소:포트번호/컨텍스트패스명 이 자동으로 붙게 된다.
 우리의 컨텍스트 패스명은  /JSPServletBegin 이다.      
 즉, 우리는  http://localhost:9090/JSPServletBegin/01_getMethod.do 으로 된다. 
*/
@WebServlet("/05_getPostMethod.do")
public class GetPostMethod_05 extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		// HttpServletRequest req 객체는 전송되어져온 데이터를 처리해주는 용도로 쓰인다.
		String name = req.getParameter("name");
		String school = req.getParameter("school");
		String color = req.getParameter("color");
		
		String[] foodArr = req.getParameterValues("food");
		String food ="";
		if(foodArr != null) {
			food = String.join(",", foodArr);
		}
		else {
			// 좋아하는 음식이 하나도 없는 경우
			food = "좋아하는 음식이 선택지에 없습니다.";
		}
		
		
		// *** 콘솔에 출력하기 시작 *** //
		System.out.println("name => " + name);
		System.out.println("school => " + school);
		System.out.println("color => " + color);
		System.out.println("food => " + food);
		
		// *** 콘솔에 출력하기 끝 *** //
		
		// *** 클라이언트(form 태그가 있는 .jsp 파일)에서 넘어온 method 방식이 GET 인지 POST 인지 알아오기 *** //
		String method = req.getMethod(); // GET 또는 POST 리턴
		
		// *** 웹브라우저에 출력하기 시작 *** //
		// HttpServletResponse resp 객체는 넘어온 데이터를 조작해서 결과물을 나타내고자 할 때 쓰인다.
		resp.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
		// out 은 웹브라우저에 기술하는 대상체라고 생각하자.
		
		out.println("<html>");
		out.println("<head><title>개인 성향 테스트 결과화면 </title></head>");
		out.println("<body>");
		out.println("<h2>개인 성향 테스트 결과("+method+")</h2>");
		out.printf("<span style='color:purple; font-weight:bold;'>%s</span>님의 개인 성향은<br/><br/>", name);
		if(color != null) {
			out.printf("학력은 %s이며, %s색을 좋아합니다.<br><br>", school, color);
		}
		else {
			out.printf("학력은 %s이며, 좋아하는 색이 없습니다.<br><br>", school);
		}
		/*
			%d ==> decimal 정수
			%f ==> float   실수
			%s ==> string  문자열
		 */
		
		out.println("좋아하는 음식은? " +food);
		out.println("</body>");
		out.println("</html>");
		
		// *** 웹브라우저에 출력하기 끝 *** //
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
