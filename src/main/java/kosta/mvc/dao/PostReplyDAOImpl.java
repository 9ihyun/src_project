package kosta.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import kosta.mvc.dto.PostReply;
import kosta.mvc.util.DbUtil;

public class PostReplyDAOImpl implements PostReplyDAO {
	Properties proFile = new Properties();

	
	public PostReplyDAOImpl() {
		try {
			proFile.load(getClass().getClassLoader().getResourceAsStream("dbQuery.properties"));

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int insertReply(PostReply reply) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		int result=0;
		String sql = proFile.getProperty("reply.insertReply");
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, reply.getPostNo());
			ps.setString(2, reply.getUserId());
			ps.setString(3, reply.getpReplyContent());
			

			result = ps.executeUpdate();
			
		}finally {
			DbUtil.dbClose(ps, con);
		}
		
		return result;
	}

	@Override
	public int updateReply(PostReply reply) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		int result=0;
		String sql = proFile.getProperty("reply.updateReply");
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, reply.getPostNo());
			ps.setString(2, reply.getUserId());
			ps.setString(3, reply.getpReplyContent());
			ps.setInt(4, reply.getpReplyNo());

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
		String sql = proFile.getProperty("reply.deleteReply");
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
	public List<PostReply> selectAllReply(int postNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<PostReply> replyList = new ArrayList<>();
		String sql = proFile.getProperty("reply.selectAllReply");
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, postNo);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				PostReply reply = new PostReply(rs.getInt(1), rs.getString(2), rs.getString(3));
				
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
		String sql = proFile.getProperty("reply.getDBUserId");
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
