package kosta.mvc.service;

import java.sql.SQLException;

import kosta.mvc.dao.UserDAO;
import kosta.mvc.dao.UserDAOImpl;
import kosta.mvc.dto.User;

public class UserServiceImpl implements UserService {
	UserDAO userDAO = new UserDAOImpl();
	
	/**
	 * 내 정보 가져오기
	 * */
	@Override
	public User myInfo(String id) throws SQLException {
		User user = userDAO.myInfo(id);
		
		if(user.getUserId() == null)
			throw new SQLException("정보를 가져오는데 실패했습니다.");
		
		return user;
	}

	/**
	 * 별점 평가
	 * */
	@Override
	public void starPoint(String id, int point) throws SQLException {
		if(userDAO.starPoint(id, point) == 0)
			throw new SQLException(id + "님의 별점을 평가하는데 실패했습니다.");
	}

	/**
	 * 내 정보 수정
	 * */
	@Override
	public void update(User user) throws SQLException {
		if(userDAO.update(user) == 0)
			throw new SQLException("정보 수정에 실패했습니다.");
	}
	
	/**
	 * 비밀번호 변경
	 * */
	@Override
	public void pwChange(String id, String currPw, String newPw) throws SQLException {
		if(userDAO.pwChange(id, currPw, newPw) == 0)
			throw new SQLException("비밀번호 변경에 실패했습니다.");
	}

	/**
	 * 회원 탈퇴
	 * */
	@Override
	public void delete(String id) throws SQLException {
		if(userDAO.delete(id) == 0)
			throw new SQLException("탈퇴 처리에 실패했습니다.");
	}

}
