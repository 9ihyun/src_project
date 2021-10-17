package kosta.mvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.mvc.dao.MyStudyDAOImpl;
import kosta.mvc.dao.StudyDAOImpl;
import kosta.mvc.dto.User;
import net.sf.json.JSONArray;

/**
 * 스터디 신청이 거절되면 신청한 스터디에서 삭제해주는 서블릿
 */
@WebServlet("/removeSignStudy")
public class RemoveSignStudyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		String id = request.getParameter("id");
		int studyNo = Integer.parseInt(request.getParameter("studyNo"));
		
		try {
			if(new MyStudyDAOImpl().changeSignState(id, studyNo) != 0) {
				List<User> userList = new StudyDAOImpl().getUserList(studyNo);
				
				JSONArray arr = JSONArray.fromObject(userList);

				PrintWriter out = response.getWriter();
				out.print(arr);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
