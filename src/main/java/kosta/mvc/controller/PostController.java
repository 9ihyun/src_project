package kosta.mvc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kosta.mvc.dto.Post;
import kosta.mvc.service.PostService;
import kosta.mvc.service.PostServicelmpl;

public class PostController implements Controller {
	private PostService service = new PostServicelmpl();

	private String getUserId(HttpServletRequest request) {
		HttpSession session = request.getSession();
		return (String) session.getAttribute("userId");
	}

	public ModelAndView postInsert(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// String userId = getUserId(request);

		int tagNo = Integer.parseInt(request.getParameter("tagNo"));
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String userId = request.getParameter("userId");
		String postTitle = request.getParameter("postTitle");
		String postContent = request.getParameter("postContent");

		Post post = new Post(tagNo, boardNo, userId, postTitle, postContent);

		service.postInsert(post);
		
		return new ModelAndView("/front?key=post&methodName=postSelectAllPost");
	}

	
	/**
	 * update form (수정)
	 */
	public ModelAndView postUpdateView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		Post view = service.postView(postNo);

		request.setAttribute("view", view);
		return new ModelAndView("board/freeBoardUpdate.jsp");
		
	}
	
	/**
	 * update처리 (수정)
	 */
	public ModelAndView postUpdate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// int postNo = getPostNo(request);
		int postNo = Integer.parseInt(request.getParameter("postNo"));

		int tagNo = Integer.parseInt(request.getParameter("tagNo"));
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String postTitle = request.getParameter("postTitle");
		String postContent = request.getParameter("postContent");
		
		
		Post post = new Post(postNo, tagNo, boardNo, postTitle, postContent);
		
		service.postUpdate(post);

		//return new ModelAndView("board/freeBoardread.jsp", true);
		return new ModelAndView("/front?key=post&methodName=postViewPost&postNo="+postNo);
	}

	public ModelAndView postDelete(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int postNo = Integer.parseInt(request.getParameter("postNo"));

		service.postDelete(postNo);
		return new ModelAndView("board/freeBoardWrite.jsp", true);
	}

	public ModelAndView postSelectAllPost(HttpServletRequest request, HttpServletResponse response) throws Exception {

		List<Post> postList = service.selectAllPost();
			System.out.println(postList.size());
		
			request.setAttribute("postList", postList);
			
		return new ModelAndView("board/freeBoardWrite.jsp");
	}
	public ModelAndView postSelectAll(HttpServletRequest request, HttpServletResponse response) throws Exception {

		List<Post> postList = service.AllPost();
			System.out.println(postList.size());
		
			request.setAttribute("postList", postList);
			
		return new ModelAndView("board/freeBoardWrite.jsp");
	}

	public ModelAndView postViewPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		Post view = service.postView(postNo);

		request.setAttribute("view", view);
		return new ModelAndView("board/freeBoardread.jsp");
	}

	public ModelAndView postLike(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return null;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}
}
