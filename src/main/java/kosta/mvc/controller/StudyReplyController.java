package kosta.mvc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kosta.mvc.dto.StudyReply;
import kosta.mvc.service.StudyReplyService;
import kosta.mvc.service.StudyReplyServiceImpl;

/**
 * @author 홍전형
 */
public class StudyReplyController implements Controller {
	private StudyReplyService service = new StudyReplyServiceImpl();

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		return null;
	}
	
	/**
	 * Session에서 ID 꺼내오기
	 * */
	private String getUserId(HttpServletRequest request) {
		HttpSession session = request.getSession();
		return (String)session.getAttribute("userId");
	}
	
	/**
	 * 댓글 등록
	 */
	public ModelAndView insertReply(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String userId = getUserId(request);

		int studyNo = Integer.parseInt(request.getParameter("studyNo"));
		userId = request.getParameter("userId");
		String sReplyContent = request.getParameter("sReplyContent");
		
		StudyReply reply = new StudyReply(studyNo, userId, sReplyContent);
		
		service.insertReply(reply);

		return new ModelAndView("/front?key=study&methodName=viewStudy&studyNo=" + studyNo);
	}
	
	
	
	/**
	 * 댓글 수정 
	 */
	public ModelAndView updateReply(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String userId = getUserId(request);
		
		int studyNo = Integer.parseInt(request.getParameter("studyNo"));
		userId = request.getParameter("userId");
		String sReplyContent = request.getParameter("sReplyContent");
		
		StudyReply reply = new StudyReply(studyNo, userId, sReplyContent);
		
		service.updateReply(reply);
		return new ModelAndView("/front?key=study&methodName=viewStudy&studyNo=" + studyNo);
	}
	
	/**
	 * 댓글 삭제 
	 */
	public ModelAndView deleteReply(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int sReplyNo = Integer.parseInt(request.getParameter("sReplyNo"));
		int studyNo = Integer.parseInt(request.getParameter("studyNo"));
		String userId = getUserId(request);

		service.deleteReply(sReplyNo, userId);
		return new ModelAndView("/front?key=study&methodName=viewStudy&studyNo=" + studyNo);
	}
	
	/**
	 * 특정 게시글의 댓글 리스트 가져오기
	 */
	public ModelAndView selectAllReply(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int studyNo = Integer.parseInt(request.getParameter("studyNo"));
		List<StudyReply> replyList = service.selectAllReply(studyNo);
		
		request.setAttribute("StudyReply", replyList);
		
		return new ModelAndView("study/read.jsp");
	}
	
	
	

}
