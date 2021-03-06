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
		String board = request.getParameter("board");
		String postnum = request.getParameter("postnum");
		
		String postTitle = request.getParameter("postTitle");
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
	
		 
		List<Post> postList = service.searchByTitle(postTitle,boardNo);
		
	
		request.setAttribute("postList"+postnum+"", postList);
		
		return new ModelAndView(board+".jsp");
	
	
		
		
	}
	public ModelAndView searchById(HttpServletRequest request, HttpServletResponse response)throws Exception {
		String board = request.getParameter("board");
		String postnum = request.getParameter("postnum");
		String userId = request.getParameter("userId");;
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		List<Post> postList = service.searchById(userId,boardNo);
		
		request.setAttribute("postList"+postnum+"", postList);
		
		return new ModelAndView(board+".jsp");
	}
	public ModelAndView searchByTag(HttpServletRequest request, HttpServletResponse response)throws Exception {
		int tagNo = Integer.parseInt(request.getParameter("tagNo"));
		String postnum = request.getParameter("postnum");
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String board = request.getParameter("board");
		List<Post> postList = service.searchByTag(tagNo,boardNo);
		request.setAttribute("postList"+postnum+"", postList);
		
		return new ModelAndView(board+".jsp");
	}
	public ModelAndView searchByRecent(HttpServletRequest request, HttpServletResponse response)throws Exception {
		String board = request.getParameter("board");
		String postnum = request.getParameter("postnum");
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		List<Post> postList = service.searchByRecent(boardNo);
		
	
		request.setAttribute("postList"+postnum+"", postList);
		
		return new ModelAndView(board+".jsp");
	}
	public ModelAndView searchByLikes(HttpServletRequest request, HttpServletResponse response)throws Exception {
		String board = request.getParameter("board");
		String postnum = request.getParameter("postnum");
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		List<Post> postList = service.searchByLikes(boardNo);
		
	
		request.setAttribute("postList"+postnum+"", postList);
		
	return new ModelAndView(board+".jsp");
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
		String sql = "SELECT study_no, user_id, study_maxnum, study_location_si, study_location_gu, study_duedate, study_title, state_name FROM study join study_state using(state_no) WHERE study_title LIKE ?"; //where rnum <=? and rnum>=?
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
	
		
		request.setAttribute("studyList", list);
		

		return new ModelAndView("study/list.jsp"); //?????? ??????
	}
	public ModelAndView searchByTags(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String tagName = request.getParameter("tagName");;
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<Study> studyList = new ArrayList<>();
		String sql = "SELECT study_no, user_id, study_maxnum, study_location_si, study_location_gu, study_duedate, study_title, state_name FROM study join study_state using(state_no) WHERE tag_no LIKE ?"; //where rnum <=? and rnum>=?
		try {
				con = DbUtil.getConnection();
				ps = con.prepareStatement(sql);
				ps.setString(1, "%"+tagName+"%");
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
	
		
		request.setAttribute("studyList", list);
		

		return new ModelAndView("study/list.jsp"); //?????? ??????
	}
	public ModelAndView searchByState(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String stateName = request.getParameter("stateName");;
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<Study> studyList = new ArrayList<>();
		String sql = "SELECT study_no, user_id, study_maxnum, study_location_si, study_location_gu, study_duedate, study_title, state_name FROM study join study_state using(state_no) WHERE state_no LIKE ?"; //where rnum <=? and rnum>=?
		try {
				con = DbUtil.getConnection();
				ps = con.prepareStatement(sql);
				ps.setString(1, "%"+stateName+"%");
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
		
		
		request.setAttribute("studyList", list);
		

		return new ModelAndView("study/list.jsp"); //?????? ??????
	}
}
