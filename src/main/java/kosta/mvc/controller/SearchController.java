package kosta.mvc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kosta.mvc.dto.Post;
import kosta.mvc.dto.Study;
import kosta.mvc.paging.PageCnt;
import kosta.mvc.service.SearchService;
import kosta.mvc.service.SearchServicelmpl;
import kosta.mvc.util.DbUtil;


public class SearchController implements Controller{
	private SearchService service = new SearchServicelmpl();
	
	private String getUserId(HttpServletRequest request) {
		HttpSession session = request.getSession();
		return (String)session.getAttribute("userId");
		
	}
	
	public ModelAndView searchByTitle(HttpServletRequest request, HttpServletResponse response)throws Exception {
		String postTitle = request.getParameter("postTitle");
		List<Post> postList = service.searchByTitle(postTitle);
		System.out.println(postList);
	
		request.setAttribute("postList", postList);
		
	return new ModelAndView("board/freeBoardWrite.jsp");
	
	
		
		
	}
	public ModelAndView searchById(HttpServletRequest request, HttpServletResponse response)throws Exception {
		String userId = request.getParameter("userId");;
		List<Post> postList = service.searchById(userId);
		request.setAttribute("postList", postList);
		
		return new ModelAndView("board/freeBoardWrite.jsp");
	}
	public ModelAndView searchByTag(HttpServletRequest request, HttpServletResponse response)throws Exception {
		int tagNo = Integer.parseInt(request.getParameter("tagNo"));
		List<Post> postList = service.searchByTag(tagNo);
		request.setAttribute("postList", postList);
		
		return new ModelAndView("board/freeBoardWrite.jsp");
	}
	public ModelAndView searchByRecent(HttpServletRequest request, HttpServletResponse response)throws Exception {
		List<Post> postList = service.searchByRecent();
		System.out.println(postList.size());
	
		request.setAttribute("postList", postList);
		
	return new ModelAndView("board/freeBoardWrite.jsp");
	}
	public ModelAndView searchByLikes(HttpServletRequest request, HttpServletResponse response)throws Exception {
		List<Post> postList = service.searchByLikes();
		System.out.println(postList.size());
	
		request.setAttribute("postList", postList);
		
	return new ModelAndView("board/freeBoardWrite.jsp");
//	int postUp = Integer.parseInt(request.getParameter("postUp"));
//	List<Post> postList = service.searchByTag(postUp);
//	return null;
		
	}
	public ModelAndView searchByRegion(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}
	public ModelAndView searchByRecuit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}
	
	public ModelAndView selectTitleStudy(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String studyTitle = request.getParameter("studyTitle");;
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<Study> studyList = new ArrayList<>();
		String sql = "SELECT * FROM study WHERE study_title LIKE ?"; //where rnum <=? and rnum>=?
		try {
				con = DbUtil.getConnection();
				ps = con.prepareStatement(sql);
				ps.setString(1, "%"+studyTitle+"%");
				rs = ps.executeQuery();
				while (rs.next()) {
					Study study = new Study(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5),
							rs.getString(6), rs.getString(7), rs.getString(8));
					studyList.add(study);
				}
	
			
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		List<Study> list = studyList;
		System.out.println(list);
		
		request.setAttribute("studyList", list);
		

		return new ModelAndView("study/list.jsp"); //이동 위치
	}
}
