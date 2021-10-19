package kosta.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import kosta.mvc.dto.User;
import kosta.mvc.util.DbUtil;

public class UserDAOImpl implements UserDAO {
	Properties proFile = new Properties();
	
	public UserDAOImpl() {
		try {
			proFile.load(getClass().getClassLoader().getResourceAsStream("dbQuery.properties"));
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 내 정보 가져오기
	 * */
	@Override
	public User myInfo(String id) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = proFile.getProperty("user.myInfo");
		User user = null;
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				double starPoint = pointAvg(con, id);
				user = new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5),
								rs.getString(6), rs.getString(7), starPoint);				
			}
			
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return user;
	}
	
	/**
	 * 별점 평균 구하기
	 * */
	private double pointAvg(Connection con , String id) throws SQLException{
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = proFile.getProperty("user.pointAvg");
		double starPoint = 0.0;
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			int sum = 0;
			int length = 0;
			while(rs.next()) {
				sum += rs.getInt(1);
				length++;
			}
			
			double avg = sum / (double)length;
			starPoint = (int)(avg * 10) / 10.0;
			
		}finally {
			DbUtil.dbClose(rs, ps, null);
		}
		
		return starPoint;
	}

	/**
	 * 별점 평가
	 * */
	@Override
	public int starPoint(String id, int point) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = proFile.getProperty("user.starPoint");
		int result = 0;
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setInt(2, point);
			result = ps.executeUpdate();
			
		}finally {
			DbUtil.dbClose(ps, con);
		}
		
		return result;
	}

	/**
	 * 내 정보 수정
	 * */
	@Override
	public int update(User user) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = proFile.getProperty("user.update");
		int result = 0;
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, user.getNickname());
			ps.setInt(2, user.getBirth());
			ps.setString(3, user.getPwq());
			ps.setString(4, user.getPwq());
			ps.setString(5, user.getUserId());
			result = ps.executeUpdate();
			
		}finally {
			DbUtil.dbClose(ps, con);
		}
		
		return result;
	}
	
	/**
	 * 비밀번호 변경
	 * */
	@Override
	public int pwChange(String id, String currPw, String newPw) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = proFile.getProperty("user.pwChange");
		int result = 0;
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, newPw);
			ps.setString(2, id);
			
			if(pwCheck(con, id, currPw))
				result = ps.executeUpdate();
					
		}finally {
			DbUtil.dbClose(ps, con);
		}
		
		return result;
	}
	
	/**
	 * 비밀번호 일치 여부 확인
	 * */
	private boolean pwCheck(Connection con, String id, String currPw) throws SQLException {
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = proFile.getProperty("user.pwCheck");
		boolean result = false;
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				if(currPw.equals(rs.getString(1)))
					result = true;
			}			
			
		}finally {
			DbUtil.dbClose(rs, ps, null);
		}
		
		return result;
	}
	

	/**
	 * 회원 탈퇴
	 * */
	@Override
	public int delete(String id) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = proFile.getProperty("user.delete");
		int result = 0;
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			result = ps.executeUpdate();
			
		}finally {
			DbUtil.dbClose(ps, con);
		}
		
		return result;
	}

}
