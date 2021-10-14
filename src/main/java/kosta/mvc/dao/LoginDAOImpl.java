package kosta.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import kosta.mvc.dto.User;
import kosta.mvc.util.DbUtil;

public class LoginDAOImpl implements LoginDAO {
	Properties proFile = new Properties();
	
	public LoginDAOImpl() {
		try {
			proFile.load(getClass().getClassLoader().getResourceAsStream("dbQuery.properties"));
		}catch (Exception e) {
			e.printStackTrace();
		}
	}	

	/**
	 * 로그인 체크
	 * */
	@Override
	public String loginCheck(String id, String pw) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = proFile.getProperty("login.loginCheck");
		String nickname = null;
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pw);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				nickname = rs.getString(1);
			}
			
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return nickname;
	}

	/**
	 * 회원가입
	 * */
	@Override
	public int register(User user) throws SQLException {
		
		return 0;
	}

	/**
	 * 아이디/비밀번호 찾기
	 * */
	@Override
	public User idPwFind(int birth, String pwq, String pwa) throws SQLException {
		
		return null;
	}

}
