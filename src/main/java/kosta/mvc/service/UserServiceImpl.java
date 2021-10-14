package kosta.mvc.service;

import java.sql.SQLException;

import kosta.mvc.dto.User;

public class UserServiceImpl implements UserService {

	
	/**
	 * 내 정보 가져오기
	 * */
	@Override
	public User myInfo(String id) throws SQLException {
		
		return null;
	}

	/**
	 * 별점 평가
	 * */
	@Override
	public void starPoint(String id, int point) throws SQLException {
		

	}

	/**
	 * 내 정보 수정
	 * */
	@Override
	public void update(User user) throws SQLException {
		

	}
	
	/**
	 * 비밀번호 변경
	 * */
	@Override
	public void pwChange(String id, String currPw, String newPw) throws SQLException {
	
		
	}

	/**
	 * 회원 탈퇴
	 * */
	@Override
	public void delete(String id) throws SQLException {
		

	}

}
