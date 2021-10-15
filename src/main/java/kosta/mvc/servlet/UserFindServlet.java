package kosta.mvc.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.mvc.controller.UserController;
import kosta.mvc.dao.UserDAO;
import kosta.mvc.dao.UserDAOImpl;
import kosta.mvc.dto.User;

/**
 * 아이디, 비번을 찾아주는 서블릿
 */
@WebServlet("/userFindServlet")
public class UserFindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 //아이디 찾기
		try {
		         //입력 : birth, question, anwser  -----> UserDto
		         request.setCharacterEncoding("UTF-8");
		         User user = new User(); 
		         user.setBirth(Integer.parseInt(request.getParameter("birth")));
		         user.setPwq(request.getParameter("question"));
		         user.setPwa(request.getParameter("anwser"));
		         
		         //처리
		         UserDAO dao = new UserDAOImpl();
		         String UserId =dao.myInfo(user);		        
		         
		         //출력
		         if(UserId != null) {//결과가 있으면(정보가 맞다면)
		            response.sendRedirect("find_id_result.jsp?UserId="+UserId);
		            
		            request.getSession().setAttribute("UserId", UserId);
		            response.sendRedirect("find_id_result.jsp");
		         }
		         else {//결과가 없으면(정보가 맞지 않으면)
		            response.sendRedirect("find_id.jsp?error");
		         }
		      }
		      catch(Exception e) {
		         e.printStackTrace();
		         response.sendError(500);
		      }
		
		 //비번 찾기
		try {
		         //입력 : birth, question, anwser  -----> UserDto
		         request.setCharacterEncoding("UTF-8");
		         User user = new User(); 
		         user.setBirth(Integer.parseInt(request.getParameter("birth")));
		         user.setPwq(request.getParameter("question"));
		         user.setPwa(request.getParameter("anwser"));
		         
		         //처리
		         UserDAO dao = new UserDAOImpl();
		         String pw =dao.myInfo(user);		        
		         
		         //출력
		         if(pw != null) {//결과가 있으면(정보가 맞다면)
		            response.sendRedirect("find_id_result.jsp?pw="+pw);
		            
		            request.getSession().setAttribute("pw", pw);
		            response.sendRedirect("find_id_result.jsp");
		         }
		         else {//결과가 없으면(정보가 맞지 않으면)
		            response.sendRedirect("find_id.jsp?error");
		         }
		      }
		      catch(Exception e) {
		         e.printStackTrace();
		         response.sendError(500);
		      }
		
		
		   }//dopost 끝
	}//


