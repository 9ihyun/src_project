package kosta.mvc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.mvc.dto.Study;
import kosta.mvc.service.StudyService;
import kosta.mvc.service.StudyServiceImpl;

public class StudyController implements Controller {

	private StudyService service = new StudyServiceImpl();

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		return null;
	}

	/**
	 * 스터디 게시물 등록
	 * @author 홍전형
	 */
	public ModelAndView insertStudy(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int studyNo = Integer.parseInt(request.getParameter("studyNo"));
		int tagNo = Integer.parseInt(request.getParameter("studyNo"));
		String userId = request.getParameter("studyNo");
		int stateNo = Integer.parseInt(request.getParameter("studyNo"));
		int studyMaxnum = Integer.parseInt(request.getParameter("studyNo"));
		String studyLocationSi = request.getParameter("studyNo");
		String studyLocationGu = request.getParameter("studyNo");
		String studyDuedate = request.getParameter("studyNo");
		String studyTitle = request.getParameter("studyNo");
		String studyContent = request.getParameter("studyNo");

		Study study = new Study(tagNo, userId, stateNo, studyMaxnum, studyLocationSi, studyLocationGu,
				studyDuedate, studyTitle, studyContent);
		
		service.insertStudy(study);

		return null;
	}

	/**
	 * 스터디 게시물 수정 
	 * @author 홍전형
	 */
	public ModelAndView updateStudy(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int studyNo = Integer.parseInt(request.getParameter("studyNo"));
		int tagNo = Integer.parseInt(request.getParameter("studyNo"));
		String userId = request.getParameter("studyNo");
		int stateNo = Integer.parseInt(request.getParameter("studyNo"));
		int studyMaxnum = Integer.parseInt(request.getParameter("studyNo"));
		String studyLocationSi = request.getParameter("studyNo");
		String studyLocationGu = request.getParameter("studyNo");
		String studyDuedate = request.getParameter("studyNo");
		String studyTitle = request.getParameter("studyNo");
		String studyContent = request.getParameter("studyNo");
		
		Study study = new Study(tagNo, userId, stateNo, studyMaxnum, studyLocationSi, studyLocationGu,
				studyDuedate, studyTitle, studyContent);
		
		service.updateStudy(study);
		
		
		return null;
	}

	/**
	 * 스터디 게시물 삭제
	 * @author 홍전형
	 */
	public ModelAndView deleteStudy(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int studyNo = Integer.parseInt(request.getParameter("studyNo"));
		
		service.deleteStudy(studyNo);
		
		return null;
	}

	/**
	 * 스터디 게시물 리스트 보기
	 * @author 홍전형
	 */
	public ModelAndView selectAllStudy(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Study> list = service.selectAllStudy();

		return null; 
	}

	/**
	 * 스터디 게시물 상세보기
	 * @author 홍전형
	 */
	public ModelAndView viewStudy(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int studyNo = Integer.parseInt(request.getParameter("studyNo"));
		Study study = service.viewStudy(studyNo);
		return null;
	}

	/**
	 * 스터디 신청자 리스트 가져오기
	 * @author 홍전형
	 */
	public ModelAndView getUserList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int studyNo = Integer.parseInt(request.getParameter("studyNo"));
		return null;
	}
}
