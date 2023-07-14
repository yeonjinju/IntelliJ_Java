package main.java.test.servlet;

import main.java.test.member.dto.MemberDto;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/member")
public class MemberServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		MemberDto dto = new MemberDto(1, "김구라", "노량진");

		req.setAttribute("dto", dto);
		ServletContext sc = getServletContext();
		RequestDispatcher rd = sc.getRequestDispatcher("/test/member.jsp");
		rd.forward(req, resp);
	}
}
