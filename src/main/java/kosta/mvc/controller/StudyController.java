package kosta.mvc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kosta.mvc.dto.Study;
import kosta.mvc.dto.StudyReply;
import kosta.mvc.dto.User;
import kosta.mvc.service.StudyReplyService;
import kosta.mvc.service.StudyReplyServiceImpl;
import kosta.mvc.service.StudyService;
import kosta.mvc.service.StudyServiceImpl;

/**
 * @author 홍전형 
 */
public class StudyController implements Controller {

	private StudyService service = new StudyServiceImpl();
	private StudyReplyService replyService = new StudyReplyServiceImpl();

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
	 * 스터디 게시물 등록
	 */
	public ModelAndView insertStudy(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String userId = getUserId(request);

		int tagNo = Integer.parseInt(request.getParameter("tagNo"));
			userId = request.getParameter("userId");
		int stateNo = Integer.parseInt(request.getParameter("stateNo"));
		int dayNo = Integer.parseInt(request.getParameter("dayNo"));
		int studyMaxnum = Integer.parseInt(request.getParameter("studyMaxnum"));
		String studyLocationSi = request.getParameter("studyLocationSi");
		String studyLocationGu = request.getParameter("studyLocationGu");
		String studyDuedate = request.getParameter("studyDuedate");
		String studyTitle = request.getParameter("studyTitle");
		String studyContent = request.getParameter("studyContent");

		System.out.println("tagNo=" + tagNo);
		
		Study study = new Study(tagNo, userId, stateNo, dayNo, studyMaxnum, studyLocationSi, studyLocationGu,
				studyDuedate, studyTitle, studyContent);
		
		service.insertStudy(study);

		return new ModelAndView("/front?key=study&methodName=selectAllStudy"); //이동 위치 
	}
	
	/**
	 * 스터디 게시물 수정 폼 이동
	 */
	public ModelAndView updateStudyView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int studyNo = Integer.parseInt(request.getParameter("studyNo"));
		Study view = service.updateStudyView(studyNo);

		request.setAttribute("view", view);
		return new ModelAndView("study/update2.jsp");
		
	}

	/**
	 * 스터디 게시물 수정 
	 */
	public ModelAndView updateStudy(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String userId = getUserId(request);
		int studyNo = Integer.parseInt(request.getParameter("studyNo"));
		int tagNo = Integer.parseInt(request.getParameter("tagNo"));
		int stateNo = Integer.parseInt(request.getParameter("stateNo"));
		int dayNo = Integer.parseInt(request.getParameter("dayNo"));
		int studyMaxnum = Integer.parseInt(request.getParameter("studyMaxnum"));
		String studyLocationSi = request.getParameter("studyLocationSi");
		String studyLocationGu = request.getParameter("studyLocationGu");
		String studyDuedate = request.getParameter("studyDuedate");
		String studyTitle = request.getParameter("studyTitle");
		String studyContent = request.getParameter("studyContent");
		
		Study study = new Study(studyNo, tagNo, userId, stateNo, dayNo, studyMaxnum, studyLocationSi, studyLocationGu,
				studyDuedate, studyTitle, studyContent);
		
		service.updateStudy(study);
		
		Study dbStudy = service.viewStudy(studyNo);
		
		request.setAttribute("study", dbStudy);
		return new ModelAndView("study/read.jsp");
	}

	/**
	 * 스터디 게시물 삭제
	 */
	public ModelAndView deleteStudy(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int studyNo = Integer.parseInt(request.getParameter("studyNo"));
		String userId = getUserId(request);

		service.deleteStudy(studyNo, userId);
		
		return new ModelAndView("study/studyMain.jsp", true); //이동 위치
	}

	/**
	 * 스터디 게시물 리스트 보기
	 */
	public ModelAndView selectAllStudy(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pageNo = request.getParameter("pageNo");
		if(pageNo==null || pageNo.equals("")) {
			pageNo="1";
		}
		
		List<Study> list = service.selectAllStudy(Integer.parseInt(pageNo));

		request.setAttribute("studyList", list);
		request.setAttribute("pageNo", pageNo);

		return new ModelAndView("study/list.jsp"); //이동 위치
	}

	/**
	 * 스터디 게시물 상세보기
	 */
	public ModelAndView viewStudy(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int studyNo = Integer.parseInt(request.getParameter("studyNo"));
		Study study = service.viewStudy(studyNo);
			request.setAttribute("study", study); //ㄱ게시물
		
			//StudyReply 이름에 저장....
			List<StudyReply> listReply = replyService.selectAllReply(studyNo);
			System.out.println("listReply = " + listReply);
			request.setAttribute("StudyReply", listReply);
			
		return new ModelAndView("study/read.jsp");//이동 위치
	}

	/**
	 * 스터디 신청자 리스트 가져오기
	 */
	public ModelAndView getUserList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int studyNo = Integer.parseInt(request.getParameter("studyNo"));
		List<User> userList = service.getUserList(studyNo);
		
		request.setAttribute("userList", userList);
		return new ModelAndView("");//이동 위치
	}
}
