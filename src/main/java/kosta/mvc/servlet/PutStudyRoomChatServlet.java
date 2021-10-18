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
import kosta.mvc.dto.StudyChat;

/**
 * 스터디룸 대화 내용 입력시 비동기화 통신을 도와주는 서블릿
 */
@WebServlet("/putStudyRoomChat")
public class PutStudyRoomChatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		int studyNo = Integer.parseInt(request.getParameter("studyNo"));
		String chatContent = request.getParameter("chatContent");
		
		int result = new MyStudyDAOImpl().putStudyRoomChat(new StudyChat(studyNo, id, chatContent));
		
		PrintWriter out = response.getWriter();
		out.print(result);
	}

}
