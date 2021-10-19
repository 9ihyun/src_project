package kosta.mvc.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kosta.mvc.dto.User;
import kosta.mvc.service.LoginService;
import kosta.mvc.service.LoginServiceImpl;

public class LoginController implements Controller {
	private LoginService loginService = new LoginServiceImpl();

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		return null;
	}
	
	/**
	 * 로그인
	 * */
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String userId = request.getParameter("userId");
		String pw = request.getParameter("pw");
		System.out.println("userId= " + userId);
		System.out.println("pw= " + pw);
		
		String nickname = loginService.loginCheck(userId, pw);
		
		HttpSession session = request.getSession();
		session.setAttribute("userId", userId);
		session.setAttribute("nickname", nickname);
		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/startPage.jsp"); //메인페이지 기입
		mv.setRedirect(true);
		
		return mv;
	}
	
	/**
	 * 로그아웃
	 * */
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.invalidate();
		
		return new ModelAndView(request.getRealPath("/singin.jsp"), true);
	}
	
	/**
	 * 회원가입
	 * */
	public ModelAndView register(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String nickname = request.getParameter("nickname");
		int birth = Integer.parseInt(request.getParameter("birth"));
		String question = request.getParameter("question");
		String anwser = request.getParameter("anwser");
		
		loginService.register(new User(id, nickname, pass, birth, question, anwser));
		
		return new ModelAndView(request.getRealPath("/singin.jsp"), true);
	}
	
	/**
	 * 아이디/비밀번호 찾기
	 * */
	public ModelAndView idPwFind(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int birth = Integer.parseInt(request.getParameter("birth"));
		String pwq = request.getParameter("question");
		String pwa = request.getParameter("anwser");
		
		User user = loginService.idPwFind(birth, pwq, pwa);
		request.setAttribute("user", user);
		
		return new ModelAndView(""); //찾기 페이지 기입
	}
	
}
