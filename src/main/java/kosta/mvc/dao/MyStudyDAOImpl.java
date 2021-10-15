package kosta.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import kosta.mvc.dto.Study;
import kosta.mvc.util.DbUtil;

public class MyStudyDAOImpl implements MyStudyDAO {
	Properties proFile = new Properties();
	
	public MyStudyDAOImpl() {
		try {
			proFile.load(getClass().getClassLoader().getResourceAsStream("dbQuery.properties"));
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 내가 찜한 스터디 보기
	 * */
	@Override
	public List<Study> viewWishStudy(String id) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = proFile.getProperty("myStudy.viewWishStudy");
		//select * from study where study_no in (select study_no from wish_study where user_id=?)
		List<Study> wishList = new ArrayList<Study>();
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Study study = new Study(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getInt(6),
						rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12));
				
				wishList.add(study);
			}
			
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return wishList;
	}

	/**
	 * 스터디 찜하기
	 * */
	@Override
	public int putWishStudy(String id, int studyNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = proFile.getProperty("myStudy.putWishStudy");
		//insert into wish_study values(?, ?)
		int result = 0;
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setInt(2, studyNo);
			result = ps.executeUpdate();
			
		}finally {
			DbUtil.dbClose(ps, con);
		}
		
		return result;
	}

	/**
	 * 내가 신청한 스터디 보기
	 * */
	@Override
	public List<Study> viewSignStudy(String id) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = proFile.getProperty("myStudy.viewSignStudy");
		//select * from study natural join studysign_state where study_no in (select study_no from sign_study where user_id=?)
		List<Study> signList = new ArrayList<Study>();
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				Study study = new Study(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getInt(6),
						rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12));
				study.setSignStateNo(rs.getInt(13));
				
				signList.add(study);
			}
			
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return signList;
	}

	/**
	 * 스터디 신청하기
	 * */
	@Override
	public int putSignStudy(String id, int studyNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = proFile.getProperty("myStudy.putSignStudy");
		//insert into sign_study values(?, ?, default)
		int result = 0;
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setInt(2, studyNo);
			result = ps.executeUpdate();
			
		}finally {
			DbUtil.dbClose(ps, con);
		}
		
		return result;
	}

	/**
	 * 내가 등록한 스터디 보기
	 * */
	@Override
	public List<Study> viewMyStudy(String id) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = proFile.getProperty("myStudy.viewMyStudy");
		//select * from study where user_id=?
		List<Study> myStudyList = new ArrayList<Study>();
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Study study = new Study(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getInt(6),
						rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12));
				
				myStudyList.add(study);
			}
			
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return myStudyList;
	}
	
}
