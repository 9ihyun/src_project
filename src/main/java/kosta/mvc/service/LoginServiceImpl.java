package kosta.mvc.service;

import java.sql.SQLException;

import kosta.mvc.dao.LoginDAO;
import kosta.mvc.dao.LoginDAOImpl;
import kosta.mvc.dto.User;
import kosta.mvc.exception.AuthenticationException;

public class LoginServiceImpl implements LoginService {
	LoginDAO loginDAO = new LoginDAOImpl();
	
	/**
	 * 로그인 체크
	 * */
	@Override
	public String loginCheck(String id, String pw) throws SQLException, AuthenticationException {
		String nickname = loginDAO.loginCheck(id, pw);
		
		if(nickname == null)
			throw new AuthenticationException("아이디 혹은 비밀번호를 다시 확인하고 입력해주세요.");
		
		return nickname;
	}

	/**
	 * 회원가입
	 * */
	@Override
	public void register(User user) throws SQLException {
		if(loginDAO.register(user) == 0)
			throw new SQLException("회원 가입에 실패했습니다.");
	}

	/**
	 * 아이디/비밀번호 찾기
	 * */
	@Override
	public User idPwFind(int birth, String pwq, String pwa) throws SQLException {
		User user = loginDAO.idPwFind(birth, pwq, pwa);
		
		if(user.getUserId() == null)
			throw new SQLException("정보를 다시 확인하고 입력해주세요.");
		
		return user;
	}

}
