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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateStudy(Study study) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteStudy(int studyNo) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
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
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11));
				studyList.add(study);
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return studyList;
	}

	@Override
	public Study viewStudy(int studyNo) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> getUserList() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
