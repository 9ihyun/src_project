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
 * 신청하기를 눌렀을 때 내가 신청한 스터디에 등록을 도와주는 서블릿
 */
@WebServlet("/putSignStudy")
public class PutSignStudyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("userId");
		int studyNo = Integer.parseInt(request.getParameter("studyNo"));
		
		int result = new MyStudyDAOImpl().putSignStudy(id, studyNo);
		
		PrintWriter out = response.getWriter();
		out.print(result);
	}

}
