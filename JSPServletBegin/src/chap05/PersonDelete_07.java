package chap05;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/personDelete.do")
public class PersonDelete_07 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private interPersonDAO_03 dao = new PersonDAO_04();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String method = request.getMethod();
		String path = "";
		
		if("POST".equalsIgnoreCase(method)) {
			String seq = request.getParameter("seq");
			String name = request.getParameter("name");
			
			try {
				int n = dao.deletePerson(seq);
				
				if(n==1) {
					String delInfo = "회원번호 "+seq+"번 "+name+" 님을 삭제했습니다.";
					request.setAttribute("delInfo", delInfo);
					
					path="/WEB-INF/chap05_OK/personDelete_success.jsp";
				}
				else {
					
				}
				
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
