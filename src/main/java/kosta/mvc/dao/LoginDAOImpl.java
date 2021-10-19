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
		Connection con = null;
		PreparedStatement ps = null;
		String sql = proFile.getProperty("login.register");
		int result = 0;
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			result = ps.executeUpdate();			
			
		}finally {
			DbUtil.dbClose(ps, con);
		}
		
		return result;
	}

	/**
	 * 아이디/비밀번호 찾기
	 * */
	@Override
	public User idPwFind(int birth, String pwq, String pwa) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = proFile.getProperty("login.idPwFind");
		User user = null;
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, birth);
			ps.setString(2, pwq);
			ps.setString(3, pwa);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				user = new User(rs.getString(1), rs.getString(2));
			}
			
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return user;
	}
	
	/**
	 * 아이디 중복 확인
	 * */
	@Override
	public boolean idCheck(String id) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = proFile.getProperty("user.idCheck");
		boolean result = false;
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			if(rs.next()) {
					result = true;
			}
			
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return result;
	}
	
	/**
	 * 닉네임 중복 확인
	 * */
	@Override
	public boolean nicknameCheck(String nickname) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = proFile.getProperty("user.nicknameCheck");
		boolean result = false;
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, nickname);
			rs = ps.executeQuery();
			
			if(rs.next()) {
					result = true;
			}
			
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return result;
	}

}
