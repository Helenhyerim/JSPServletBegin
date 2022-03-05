package chap02;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetMethod_01 extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("~~ 확인용 : doGet 메소드 호출됨 ");
		
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
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("~~ 확인용 : doPost 메소드 호출됨 ");
	}

}
