package kosta.mvc.controller;

import java.io.IOException;
import java.lang.reflect.Method;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 모든 요청을 중앙 집중적으로 관리하게 될 Servlet
 *   : 진입점 Controller이다.
 */
@WebServlet(urlPatterns = "/front", loadOnStartup = 1)
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Map<String, Controller> map;
	private Map<String, Class<?>> clzMap;
	
	@Override
	public void init() throws ServletException {
		ServletContext application = super.getServletContext(); 
		map = (Map<String, Controller>)application.getAttribute("map");
		
		clzMap = (Map<String, Class<?>>)application.getAttribute("clzMap");
	}
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String key = request.getParameter("key");
		String methodName = request.getParameter("methodName");
		
		try {
			if(key==null || key.equals("")) {
				key="";
			}
			
			if(methodName==null || methodName.equals("")) {
				methodName="";
			}
			
			Class<?> clz = clzMap.get(key);
			
			Method method = clz.getMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
			
			Controller controller = map.get(key);
			
			ModelAndView mv = (ModelAndView) method.invoke(controller, request, response); 
//			System.out.println("mv = " + mv.getViewName());
			
			if(mv.isRedirect()) {
//			System.out.println("mv.getViewName() = " + mv.getViewName());
				response.sendRedirect(mv.getViewName());
			}else {
				request.getRequestDispatcher(mv.getViewName()).forward(request, response);
			}
		}catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getCause().getMessage());
			
			request.getRequestDispatcher("error/error.jsp").forward(request, response);
		}
	}

}










