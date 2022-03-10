package chap05;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/personRegister.do")
public class PersonRegister_01 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private interPersonDAO_03 dao = new PersonDAO_04(); // 인터페이스로 dao 04 객체 하나 만듦

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getMethod();
		// System.out.println("확인용 method => " + method);
		
		if("GET".equalsIgnoreCase(method)) {
			// GET 방식으로 넘어왔다면(uri 에서 엔터해서 들어온 것)
			// GET 방식으로 http://localhost:9090/JSPServletBegin/personRegister.do 을 하면 "개인성향 데이터를 DB로 전송하기" 페이지(폼태그)가 나오도록 한다.
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/chap05_OK/personRegister.jsp");
			dispatcher.forward(request, response);
		}
		else {
			// POST 방식으로 넘어왔다면(제대로 submit() 해서 들어온 것)
			// POST 방식으로 http://localhost:9090/JSPServletBegin/personRegister.do 을 하면 submit 되어져온 데이터를 받아서 DB로 보내야 한다.
			String name = request.getParameter("name");
			String school = request.getParameter("school");
			String color = request.getParameter("color");
			String[] foodArr = request.getParameterValues("food");
			
			// PersonDTO_02 DTO 에 담는다
			PersonDTO_02 psdto = new PersonDTO_02();
			psdto.setName(name);
			psdto.setSchool(school);
			psdto.setColor(color);
			psdto.setFood(foodArr);
			
			String pathName = "";
			
			try {
				int n = dao.personRegister(psdto);
				
				if(n==1) {
					pathName ="/WEB-INF/chap05_OK/personRegister_success.jsp";
				}
			} catch (SQLException e) {
				e.printStackTrace();
				pathName ="/WEB-INF/chap05_OK/personRegister_fail.jsp";
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(pathName); // 성공 또는 실패시 해당 jsp로 forward
			dispatcher.forward(request, response);
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
