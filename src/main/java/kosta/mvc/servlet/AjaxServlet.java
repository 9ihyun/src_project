package kosta.mvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.mvc.controller.Controller;
import kosta.mvc.controller.ModelAndView;
import kosta.mvc.dao.MyStudyDAOImpl;
import kosta.mvc.dao.StudyDAOImpl;
import kosta.mvc.dto.User;
import net.sf.json.JSONArray;

/**
 * 비동기화 통신 요청을 관리하는 서블릿
 */
@WebServlet("/ajax")
public class AjaxServlet extends HttpServlet {
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
			
			method.invoke(controller, request, response); 
			
		}catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", e.getCause().getMessage());
			
			request.getRequestDispatcher("error/error.jsp").forward(request, response);
		}
	}

}
