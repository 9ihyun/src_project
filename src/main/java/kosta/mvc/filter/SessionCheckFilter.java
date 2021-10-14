package kosta.mvc.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 로그인 후 이용가능한 페이지일 경우, 인증 여부를 확인해주는 필터
 */
@WebFilter("/front")
public class SessionCheckFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		String key = request.getParameter("key");
		if(key == null || !key.equals("login")) {
			HttpServletRequest req = (HttpServletRequest) request;
			HttpSession session = req.getSession();
			
			if(session.getAttribute("loginUser") == null) {
				req.setAttribute("errorMsg", "로그인하고 이용해주세요.");
				req.getRequestDispatcher("error/error.jsp").forward(request, response);
				return;
			}
		}
		
		chain.doFilter(request, response);
	}

}
