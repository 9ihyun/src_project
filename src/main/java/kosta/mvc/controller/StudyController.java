package kosta.mvc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kosta.mvc.dto.Study;
import kosta.mvc.dto.User;
import kosta.mvc.service.StudyService;
import kosta.mvc.service.StudyServiceImpl;

/**
 * @author 홍전형 
 */
public class StudyController implements Controller {

	private StudyService service = new StudyServiceImpl();

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

		Study study = new Study(tagNo, userId, stateNo, dayNo, studyMaxnum, studyLocationSi, studyLocationGu,
				studyDuedate, studyTitle, studyContent);
		
		service.insertStudy(study);

		return new ModelAndView("", true); //이동 위치 
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
		
		Study study = new Study(tagNo, userId, stateNo, dayNo, studyMaxnum, studyLocationSi, studyLocationGu,
				studyDuedate, studyTitle, studyContent);
		
		service.updateStudy(study);
		
		
		return null;
	}

	/**
	 * 스터디 게시물 삭제
	 */
	public ModelAndView deleteStudy(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int studyNo = Integer.parseInt(request.getParameter("studyNo"));
		String userId = getUserId(request);

		service.deleteStudy(studyNo, userId);
		
		return new ModelAndView("", true); //이동 위치
	}

	/**
	 * 스터디 게시물 리스트 보기
	 */
	public ModelAndView selectAllStudy(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pageNo = request.getParameter("pageNo");
		if(pageNo==null || pageNo.equals("")) {
			pageNo="1";
		}
		
		List<Study> list = service.selectAllStudy();

		request.setAttribute("studyList", list);
		return new ModelAndView(""); //이동 위치
	}

	/**
	 * 스터디 게시물 상세보기
	 */
	public ModelAndView viewStudy(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int studyNo = Integer.parseInt(request.getParameter("studyNo"));
		Study study = service.viewStudy(studyNo);
		
		request.setAttribute("study", study);
		return new ModelAndView("");//이동 위치
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
