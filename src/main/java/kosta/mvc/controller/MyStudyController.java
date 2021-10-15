package kosta.mvc.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyStudyController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		return null;
	}

	/**
	 * 내가 찜한 스터디 보기
	 * */
	public ModelAndView viewWishStudy(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return null;
	}
	
	/**
	 * 스터디 찜하기
	 * */
	public ModelAndView putWishStudy(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return null;
	}
	
	/**
	 * 내가 신청한 스터디 보기
	 * */
	public ModelAndView viewSignStudy(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return null;
	}
	
	/**
	 * 스터디 신청하기
	 * */
	public ModelAndView putSignStudy(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return null;
	}
	
	/**
	 * 내가 모집한 스터디 보기
	 * */
	public ModelAndView viewMyStudy(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return null;
	}
}
