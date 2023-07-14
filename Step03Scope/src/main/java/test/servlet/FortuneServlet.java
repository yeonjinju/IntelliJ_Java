package main.java.test.servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/fortune")
public class FortuneServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		String fortune = "동쪽으로 가면 귀인을 만나요";

		req.setAttribute("fortune", fortune);
		ServletContext sc = getServletContext();
		RequestDispatcher rd = sc.getRequestDispatcher("/test/fortune.jsp");
		rd.forward(req, resp);
	}
}
