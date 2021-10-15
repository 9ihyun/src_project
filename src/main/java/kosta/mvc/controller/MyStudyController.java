package kosta.mvc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kosta.mvc.dto.Study;
import kosta.mvc.service.MyStudyService;
import kosta.mvc.service.MyStudyServiceImpl;

public class MyStudyController implements Controller {
	MyStudyService myStudyService = new MyStudyServiceImpl();

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
	 * 내가 찜한 스터디 보기
	 * */
	public ModelAndView viewWishStudy(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = getUserId(request);
		
		List<Study> wishList = myStudyService.viewWishStudy(id);
		request.setAttribute("wishList", wishList);
		
		return new ModelAndView(""); //찜한 스터디 페이지
	}
	
	/**
	 * 내가 신청한 스터디 보기
	 * */
	public ModelAndView viewSignStudy(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = getUserId(request);
		
		List<Study> signList = myStudyService.viewSignStudy(id);
		request.setAttribute("signList", signList);
		
		return new ModelAndView(""); //신청한 스터디 페이지
	}
	
	/**
	 * 내가 등록한 스터디 보기
	 * */
	public ModelAndView viewMyStudy(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = getUserId(request);
		
		List<Study> myStudyList = myStudyService.viewMyStudy(id);
		request.setAttribute("myStudyList", myStudyList);
		
		return new ModelAndView(""); //등록한 스터디 페이지
	}
}
