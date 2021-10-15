package kosta.mvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.mvc.dao.UserDAO;
import kosta.mvc.dao.UserDAOImpl;

/**
 * 아이디/닉네임 중복 확인을 도와주는 서블릿
 */
@WebServlet("/duplicationCheck")
public class DuplicationCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		UserDAO userDAO = new UserDAOImpl();
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		if(id != null || !id.equals("")) {
			if(userDAO.idCheck(id)) {
				out.print("이미 사용 중인 아이디입니다.");
			}else {
				out.print("사용가능한 아이디입니다.");
			}
		}
		
		String nickname = request.getParameter("nickname");
		if(nickname != null || !nickname.equals("")) {
			if(userDAO.nicknameCheck(nickname)) {
				out.print("이미 사용 중인 닉네임입니다.");
			}else {
				out.print("사용가능한 닉네임입니다.");
			}
		}
	}

}
