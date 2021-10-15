package kosta.mvc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.mvc.dto.PostReply;
import kosta.mvc.service.ReplyService;
import kosta.mvc.service.ReplyServiceImpl;

public class ReplyController implements Controller {
	private ReplyService service = new ReplyServiceImpl();

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}
	/**
	 * 댓글 등록
	 */
	public ModelAndView insertReply(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int pReplyNo = Integer.parseInt(request.getParameter("pReplyNo"));
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		String userId = request.getParameter("userId");
		String pReplyContent = request.getParameter("pReplyContent");
		String pReplyDate = request.getParameter("pReplyDate");
		
		PostReply reply = new PostReply(pReplyNo, postNo, userId, pReplyContent, pReplyDate);
		
		service.insertReply(reply);

		return null;
	}
	
	/**
	 * 댓글 수정 
	 */
	public ModelAndView updateReply(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
	 * 댓글 삭제 
	 */
	public ModelAndView deleteReply(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
	 * 댓글 리스트 가져오기
	 */
	public ModelAndView selectAllReply(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		List<PostReply> replyList = service.selectAllReply(postNo);
		return null;
	}
	
	

}
