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

public class ReplyDAOImpl implements ReplyDAO {
	Properties proFile = new Properties();

	
	public ReplyDAOImpl() {
		try {
			proFile.load(getClass().getClassLoader().getResourceAsStream("dbQuery.properties"));

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int insertReply(PostReply reply) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateReply(PostReply reply) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReply(int replyNo) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
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

}
