package kosta.mvc.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import kosta.mvc.dto.Study;
import kosta.mvc.dto.User;
import kosta.mvc.util.DbUtil;

public class StudyDAOImpl implements StudyDAO {
	Properties proFile = new Properties();

	public StudyDAOImpl() {
		try {
			proFile.load(getClass().getClassLoader().getResourceAsStream("dbQuery.properties"));

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int insertStudy(Study study) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		int result=0;
		String sql = proFile.getProperty("study.insertStudy");
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, study.getTagNo());
			ps.setString(2, study.getUserId());
			ps.setInt(3, study.getStateNo());
			ps.setInt(4, study.getDayNo());
			ps.setInt(5, study.getStudyMaxnum());
			ps.setString(6, study.getStudyLocationSi());
			ps.setString(7, study.getStudyLocationGu());
			ps.setString(8, study.getStudyDuedate());
			ps.setString(9, study.getStudyTitle());
			ps.setString(10, study.getStudyContent());
			
			result = ps.executeUpdate();
			
		}finally {
			DbUtil.dbClose(ps, con);
		}
		
		return result;
	}
	

	@Override
	public int updateStudy(Study study) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		int result=0;
		String sql = proFile.getProperty("study.updateStudy");
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, study.getTagNo());
			ps.setString(2, study.getUserId());
			ps.setInt(3, study.getStateNo());
			ps.setInt(4, study.getDayNo());
			ps.setInt(5, study.getStudyMaxnum());
			ps.setString(6, study.getStudyLocationSi());
			ps.setString(7, study.getStudyLocationGu());
			ps.setString(8, study.getStudyDuedate());
			ps.setString(9, study.getStudyTitle());
			ps.setString(10, study.getStudyContent());
			ps.setInt(11, study.getStudyNo());
			
			result = ps.executeUpdate();
		}finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}

	@Override
	public int deleteStudy(int studyNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		int result=0;
		String sql = proFile.getProperty("study.deleteStudy");
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, studyNo);
			
			result = ps.executeUpdate();
		}finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}

	@Override
	public List<Study> selectAllStudy() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		List<Study> studyList = new ArrayList<>();
		String sql = proFile.getProperty("study.selectAll");
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Study study = new Study(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getInt(5),
						rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11),
						rs.getString(12));
				studyList.add(study);
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return studyList;
	}

	@Override
	public Study viewStudy(int studyNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Study study = null;
		String sql = proFile.getProperty("study.viewStudy");
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, studyNo);

			rs = ps.executeQuery();
			if (rs.next()) {
				study = new Study(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getInt(5),
						rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11),
						rs.getString(12));
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return study;
	}

	@Override
	public List<User> getUserList(int studyNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		List<User> userList = new ArrayList<>();
		String sql = proFile.getProperty("study.getUserList");
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				User user = new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), 
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8));
				
				userList.add(user);
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return userList;
	}

}
