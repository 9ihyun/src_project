package kosta.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import kosta.mvc.dto.StudyReply;
import kosta.mvc.util.DbUtil;

public class StudyReplyDAOImpl implements StudyReplyDAO {
	Properties proFile = new Properties();

	
	public StudyReplyDAOImpl() {
		try {
			proFile.load(getClass().getClassLoader().getResourceAsStream("dbQuery.properties"));

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int insertReply(StudyReply reply) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		int result=0;
		String sql = proFile.getProperty("reply.insertStudyReply");
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, reply.getStudyNo());
			ps.setString(2, reply.getUserId());
			ps.setString(3, reply.getsReplyContent());
			

			result = ps.executeUpdate();
			
		}finally {
			DbUtil.dbClose(ps, con);
		}
		
		return result;
	}

	@Override
	public int updateReply(StudyReply reply) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		int result=0;
		String sql = proFile.getProperty("reply.updateStudyReply");
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, reply.getStudyNo());
			ps.setString(2, reply.getUserId());
			ps.setString(3, reply.getsReplyContent());
			ps.setInt(4, reply.getsReplyNo());

			result = ps.executeUpdate();
			
		}finally {
			DbUtil.dbClose(ps, con);
		}
		
		return result;
	}

	@Override
	public int deleteReply(int replyNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		int result=0;
		String sql = proFile.getProperty("reply.deleteStudyReply");
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, replyNo);
			
			result = ps.executeUpdate();
		}finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}

	@Override
	public List<StudyReply> selectAllReply(int studyNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<StudyReply> replyList = new ArrayList<>();
		String sql = proFile.getProperty("reply.selectAllStudyReply");
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, studyNo);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				StudyReply reply = new StudyReply(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5));
				
				replyList.add(reply);
			}
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return replyList;
	}

	/**
	 * 게시물 작성자의 아이디를 가져오는 메서드
	 */
	public String getDBUserId(int replyNo) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String id = null;
		String sql = proFile.getProperty("reply.getStudyDBUserId");
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, replyNo);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				id = rs.getString(1);
			}
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return id;
	}
}
