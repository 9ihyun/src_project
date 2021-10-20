package kosta.mvc.dao;

import java.sql.SQLException;

import kosta.mvc.dto.User;

public interface LoginDAO {
	/**
	 * 로그인 체크
	 * */
	public User loginCheck(String id, String pw) throws SQLException;
	
	/**
	 * 회원가입
	 * */
	public int register(User user) throws SQLException;
	
	/**
	 * 아이디/비밀번호 찾기
	 * */
	public User idPwFind(int birth, String pwq, String pwa) throws SQLException;
	
	/**
	 * 아이디 중복 확인
	 * */
	public boolean idCheck(String id);
	
	/**
	 * 닉네임 중복 확인
	 * */
	public boolean nicknameCheck(String nickname);
}
