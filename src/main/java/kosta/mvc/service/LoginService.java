package kosta.mvc.service;

import java.sql.SQLException;

import kosta.mvc.dto.User;
import kosta.mvc.exception.AuthenticationException;

public interface LoginService {
	/**
	 * 로그인 체크
	 * */
	public String loginCheck(String id, String pw) throws SQLException, AuthenticationException;
	
	/**
	 * 회원가입
	 * */
	 public void register(User user) throws SQLException;
	
	/**
	 * 아이디/비밀번호 찾기
	 * */
	 public User idPwFind(int birth, String pwq, String pwa) throws SQLException;
}
