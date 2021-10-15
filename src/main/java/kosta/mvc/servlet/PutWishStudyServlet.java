package kosta.mvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kosta.mvc.dao.MyStudyDAOImpl;

/**
 * 찜버튼을 눌렀을 때 찜한 스터디에 등록을 도와주는 서블릿
 */
@WebServlet("/putWishStudy")
public class PutWishStudyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("userId");
		int studyNo = Integer.parseInt(request.getParameter("studyNo"));
		
		int result = new MyStudyDAOImpl().putWishStudy(id, studyNo);
		
		PrintWriter out = response.getWriter();
		out.print(result);
	}

}
