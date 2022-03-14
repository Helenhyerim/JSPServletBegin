package chap05;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/personUpdateEnd.do")
public class PersonUpdateEnd_09 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private interPersonDAO_03 dao = new PersonDAO_04();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String method = request.getMethod();
		String path = "";
		
		if("POST".equalsIgnoreCase(method)) {
			
			String seq = request.getParameter("seq");
			String name = request.getParameter("name");
			String school = request.getParameter("school");
			String color = request.getParameter("color");
			String[] foodArr = request.getParameterValues("food");
			
			PersonDTO_02 psdto = new PersonDTO_02();
			psdto.setSeq(Integer.parseInt(seq)); 
			psdto.setName(name);
			psdto.setSchool(school);
			psdto.setColor(color);
			psdto.setFood(foodArr);
			
			try {
				int n = dao.updatePerson(psdto);
				
				if(n==1) {
					// 특정 개인에 대한 개인성향결과를 보여주는 페이지로 이동하자. (servlet -> servlet)
					// 즉, URL 경로로 페이지의 이동을 시켜준다.
					response.sendRedirect("personDetail.do?seq="+psdto.getSeq()); // 상대경로, 기존 URI에서 /뒤에만 바뀐다.
					return;
				}else {
					// 즉, URL 경로로 페이지의 이동을 시켜준다.
					response.sendRedirect("personSelectAll.do");
					return;
					
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
				path="/WEB-INF/chap05_OK/personRegister_fail.jsp";
			}
			
		}
		else {
			// "GET"방식으로 넘어온 것이라면
			path="/WEB-INF/chap05_OK/personDetail_funStop.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
