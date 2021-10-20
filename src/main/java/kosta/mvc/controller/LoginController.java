package kosta.mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
		
		User user = loginService.loginCheck(userId, pw);
		
		HttpSession session = request.getSession();
		session.setAttribute("user", user);		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/freeBoardMain.jsp"); //메인페이지 기입
		mv.setRedirect(true);
		
		return mv;
	}
	
	/**
	 * 로그아웃
	 * */
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.invalidate();
		
		return new ModelAndView("user/singin.jsp", true);
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
		
		return new ModelAndView("user/joinProc.jsp", true);
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
		
		return new ModelAndView("user/idPassView.jsp"); //찾기 페이지 기입
	}
	
	/**
	 * 아이디 중복 확인
	 * */
	public void idCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		
		String id = request.getParameter("id");		
		PrintWriter out = response.getWriter();		
		
		if(loginService.idCheck(id)) {
			out.print("이미 사용 중인 아이디입니다.");
		}else {
			out.print("사용가능한 아이디입니다.");
		}
	}
	
	/**
	 * 닉네임 중복 확인
	 * */
	public void nicknameCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		
		String nickname = request.getParameter("nickname");		
		PrintWriter out = response.getWriter();
		
		if(loginService.nicknameCheck(nickname)) {
			out.print("이미 사용 중인 닉네임입니다.");
		}else {
			out.print("사용가능한 닉네임입니다.");
		}
	}
	
}
