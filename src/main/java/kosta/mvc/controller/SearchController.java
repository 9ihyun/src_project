package kosta.mvc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kosta.mvc.dto.Post;
import kosta.mvc.service.SearchService;
import kosta.mvc.service.SearchServicelmpl;


public class SearchController implements Controller{
	private SearchService service = new SearchServicelmpl();
	
	private String getUserId(HttpServletRequest request) {
		HttpSession session = request.getSession();
		return (String)session.getAttribute("userId");
		
	}
	
	public ModelAndView searchByTilte(HttpServletRequest request, HttpServletResponse response)throws Exception {
		String postTitle = request.getParameter("postTitle");
		List<Post> postList = service.searchByTitle(postTitle);
		

		request.setAttribute("postList", postList);
		return new ModelAndView("/front?key=Search&methodName=searchByTilte&postTitle="+postTitle);
		//return new ModelAndView("board/freeBoardWrite.jsp");
		
	}
	public ModelAndView searchById(HttpServletRequest request, HttpServletResponse response)throws Exception {
		//String userId = request.getParameter("userId");
		String userId = getUserId(request);
		List<Post> postList = service.searchById(userId);
		return null;
	}
	public ModelAndView searchByTag(HttpServletRequest request, HttpServletResponse response)throws Exception {
		int tagNo = Integer.parseInt(request.getParameter("tagNo"));
		List<Post> postList = service.searchByTag(tagNo);
		return null;
	}
	public ModelAndView searchByRecent(HttpServletRequest request, HttpServletResponse response)throws Exception {
		int postDate = Integer.parseInt(request.getParameter("postDate"));
		List<Post> postList = service.searchByTag(postDate);
		return null;
	}
	public ModelAndView searchByLikes(HttpServletRequest request, HttpServletResponse response)throws Exception {
	int postUp = Integer.parseInt(request.getParameter("postUp"));
	List<Post> postList = service.searchByTag(postUp);
	return null;
		
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
}
