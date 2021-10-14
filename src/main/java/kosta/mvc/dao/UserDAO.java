package kosta.mvc.dao;

import java.sql.SQLException;

import kosta.mvc.dto.User;

public interface UserDAO {
	/**
	 * 내 정보 가져오기
	 * */
	public User myInfo(String id) throws SQLException;
	
	/**
	 * 별점 평가
	 * */
	public int starPoint(String id, int point) throws SQLException;
	
	/**
	 * 내 정보 수정
	 * */
	public int update(User user) throws SQLException;
	
	/**
	 * 비밀번호 변경
	 * */
	public int pwChange(String id, String currPw, String newPw) throws SQLException;
	
	/**
	 * 회원 탈퇴
	 * */
	public int delete(String id) throws SQLException;
}
