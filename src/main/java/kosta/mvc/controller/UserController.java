package kosta.mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kosta.mvc.dto.User;
import kosta.mvc.service.UserService;
import kosta.mvc.service.UserServiceImpl;

public class UserController implements Controller {
	UserService userService = new UserServiceImpl();

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
	 * 내 정보 가져오기
	 * */
	public ModelAndView myInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = getUserId(request);
		
		User user = userService.myInfo(id);
		request.setAttribute("user", user);
		
		return new ModelAndView("mypage/mypage.jsp"); //마이페이지 메인
	}
	
	/**
	 * 별점 평가
	 * */
	public ModelAndView starPoint(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		int point = Integer.parseInt(request.getParameter("point"));
		
		userService.starPoint(id, point);
		
		return new ModelAndView("", true); //평가 페이지
	}
	
	/**
	 * 내 정보 수정
	 * */
	public ModelAndView update(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = getUserId(request);
		String nickname = request.getParameter("nickname");
		int birth = Integer.parseInt(request.getParameter("birth"));
		String pwq = request.getParameter("pwq");
		String pwa = request.getParameter("pwa");
		
		userService.update(new User(id, nickname, birth, pwq, pwa));
		
		User user = userService.myInfo(id);
		request.setAttribute("user", user);
		
		return new ModelAndView("mypage/infoChange.jsp"); //마이페이지 메인
	}
	
	/**
	 * 비밀번호 변경
	 * */
	public ModelAndView pwChange(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = getUserId(request);
		String currPw = request.getParameter("currentPw");
		String newPw = request.getParameter("newPw");
		
		userService.pwChange(id, currPw, newPw);
		
		User user = userService.myInfo(id);
		request.setAttribute("user", user);
		
		return new ModelAndView("mypage/passChange.jsp"); //마이페이지 메인
	}
	
	/**
	 * 회원 탈퇴
	 * */
	public ModelAndView delete(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = getUserId(request);
		
		userService.delete(id);
		
		return new ModelAndView("", true); //로그인 페이지
	}
	
}
