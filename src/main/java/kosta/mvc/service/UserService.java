package kosta.mvc.service;

import java.sql.SQLException;

import kosta.mvc.dto.User;

public interface UserService {
	/**
	 * 내 정보 가져오기
	 * */
	public User myInfo(String id) throws SQLException;
	
	/**
	 * 별점 평가
	 * */
	public void starPoint(String id, int point) throws SQLException;
	
	/**
	 * 내 정보 수정
	 * */
	public void update(User user) throws SQLException;
	
	/**
	 * 비밀번호 변경
	 * */
	public void pwChange(String id, String currPw, String newPw) throws SQLException;
	
	/**
	 * 회원 탈퇴
	 * */
	public void delete(String id) throws SQLException;
	
}
