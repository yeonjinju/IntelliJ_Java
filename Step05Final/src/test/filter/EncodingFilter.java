package test.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

/*
    요청을 중간에 가로채서 Encoding 설정 해주는 Filter 만들기

 */
@WebFilter("/*")    // "/*" 는 이 프로젝트에 오는 모든 요청에 대해 필터링을 하겠다는 의미
public class EncodingFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }
    // 필터가 동작할때 호출되는 메소드
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        // 1. 만일 인코딩 설정이 되지 않았다면
        if(request.getCharacterEncoding()==null){
            // POST 방식 전송했을때 한글깨짐 방지
            request.setCharacterEncoding("utf-8");
        }
        // 2. 요청의 흐름 이어가기
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }
}
