package chap05;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/personDetail.do")
public class PersonDetail_06 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private interPersonDAO_03 dao = new PersonDAO_04();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String seq = request.getParameter("seq"); // personSelectAll.jsp 에서 넘어온 sep 값
		String path ="";
		try {
			PersonDTO_02 psdto = dao.selectOne(seq);
			request.setAttribute("psdto", psdto);
			
			if(psdto != null) {
				path = "/WEB-INF/chap05_OK/personDetail.jsp";
			}
			else {
				path = "/WEB-INF/chap05_OK/personDetail_funStop.jsp";
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			path = "/WEB-INF/chap05_OK/personRegister_fail.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
