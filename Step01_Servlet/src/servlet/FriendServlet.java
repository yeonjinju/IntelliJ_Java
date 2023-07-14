package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/friend/list")
public class FriendServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//친구 목록 (sample data) 이라고 가정하자
		List<String> names=new ArrayList<>();
		names.add("김구라");
		names.add("해골");
		names.add("원숭이");
		//응답 인코딩 설정
		resp.setCharacterEncoding("utf-8");
		//응답 컨텐트 설정
		resp.setContentType("text/html; charset=utf-8");
		//클라이언트에게 문자열을 응답할수있는 객체의 참조값 얻어내기
		PrintWriter pw=resp.getWriter();
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'>");
		pw.println("<title></title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<h1>친구 목록입니다</h1>");
		pw.println("<ul>");
		//for 문을 이용해서 li 요소 여러개 출력하기 
		for(String tmp:names) {
			pw.println("<li>"+tmp+"</li>");
		}
		pw.println("</ul>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();		
	}
}








