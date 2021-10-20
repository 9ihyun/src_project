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

	// 자유게시판 (글작성 후 보이는 화면)
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
	 * update form (자유게시판 수정 form)
	 */
	public ModelAndView postUpdateView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		Post view = service.postView(postNo);

		request.setAttribute("view", view);
		return new ModelAndView("board/freeBoardUpdate.jsp");
		
	}
	
	/**
	 * update처리 (자유게시판 수정)
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

	
	//지식 정보 공유 게시판 (글작성 후 보이는 화면)
	public ModelAndView postInsert2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// String userId = getUserId(request);

		int tagNo = Integer.parseInt(request.getParameter("tagNo"));
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String userId = request.getParameter("userId");
		String postTitle = request.getParameter("postTitle");
		String postContent = request.getParameter("postContent");

		Post post = new Post(tagNo, boardNo, userId, postTitle, postContent);

		service.postInsert(post);
		
		return new ModelAndView("/front?key=post&methodName=Allpost");
	}
	

	
	/**
	 * update form (지식정보공유 수정 form)
	 */
	public ModelAndView postUpdateView2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		Post view2 = service.postView(postNo);

		request.setAttribute("view2", view2);
		return new ModelAndView("infoBoard/infoBoardUpdate.jsp");
		
	}
	
	/**
	 * update처리 (지식정보공유 수정)
	 */
	public ModelAndView postUpdate2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int postNo = Integer.parseInt(request.getParameter("postNo"));

		int tagNo = Integer.parseInt(request.getParameter("tagNo"));
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String postTitle = request.getParameter("postTitle");
		String postContent = request.getParameter("postContent");
		
		
		Post post = new Post(postNo, tagNo, boardNo, postTitle, postContent);
		
		service.postUpdate(post);

		return new ModelAndView("/front?key=post&methodName=postViewPost2&postNo="+postNo);
	}


	//삭제하기 
	public ModelAndView postDelete(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int postNo = Integer.parseInt(request.getParameter("postNo"));

		service.postDelete(postNo);
		return new ModelAndView("board/freeBoardWrite.jsp", true);
	}
	//자유게시판 (전체리스트 보기)
	public ModelAndView postSelectAllPost(HttpServletRequest request, HttpServletResponse response) throws Exception {

		List<Post> postList = service.selectAllPost();
			System.out.println(postList.size());
		
			request.setAttribute("postList", postList);
			
		return new ModelAndView("board/freeBoardWrite.jsp");
	}
	
	//지식정보공유 게시판 (전체리스트 보기)
	public ModelAndView Allpost(HttpServletRequest request, HttpServletResponse response) throws Exception {

		List<Post> postList2 = service.AllPost();
			System.out.println(postList2.size());
	
			request.setAttribute("postList2", postList2);
			
		return new ModelAndView("infoBoard/infoBoardWrite.jsp");
	}

	//자유게시판 
	public ModelAndView postViewPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		Post view = service.postView(postNo);

		request.setAttribute("view", view);
		return new ModelAndView("board/freeBoardread.jsp");
		
	}
	
	//지식정보공유 게시판 view2
	public ModelAndView postViewPost2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		Post view2 = service.postView(postNo);

		request.setAttribute("view2", view2);
		return new ModelAndView("infoBoard/infoBoardread.jsp");
		
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
