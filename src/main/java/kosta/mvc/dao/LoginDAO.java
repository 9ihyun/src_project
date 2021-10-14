package kosta.mvc.dao;

import java.sql.SQLException;

import kosta.mvc.dto.User;

public interface LoginDAO {
	/**
	 * 로그인 체크
	 * */
	public String loginCheck(String id, String pw) throws SQLException;
	
	/**
	 * 회원가입
	 * */
	public int register(User user) throws SQLException;
	
	/**
	 * 아이디/비밀번호 찾기
	 * */
	public User idPwFind(int birth, String pwq, String pwa) throws SQLException;
}
