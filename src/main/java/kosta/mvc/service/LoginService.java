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
	 
	/**
	 * 아이디 중복 확인
	 */
	public boolean idCheck(String id) throws SQLException;

	/**
	 * 닉네임 중복 확인
	 */
	public boolean nicknameCheck(String nickname) throws SQLException;
}
