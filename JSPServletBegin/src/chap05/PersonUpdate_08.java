package chap05;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/personUpdate.do")
public class PersonUpdate_08 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private interPersonDAO_03 dao = new PersonDAO_04();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String method = request.getMethod();
		String path = "";
		
		if("POST".equalsIgnoreCase(method)) {
			String seq = request.getParameter("seq");
			
			try {
				PersonDTO_02 psdto = dao.selectOne(seq); // 일단 db 에 있는 1명에 대한 정보를 보여준다.
				request.setAttribute("psdto", psdto);
				
				path="/WEB-INF/chap05_OK/personUpdate.jsp";
			
			} catch (SQLException e) {
				e.printStackTrace();
				path="/WEB-INF/chap05_OK/personRegister_fail.jsp";
			}
		}
		else {// 비정상적인 GET 방식으로 들어왔을 때
			path = "/WEB-INF/chap05_OK/personDetail_funStop.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
