package kosta.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kosta.mvc.dto.Post;
import kosta.mvc.dto.User;
import kosta.mvc.util.DbUtil;

public class PostDAOlmpl implements PostDao {

	@Override
	public Post postInsert(Post post) throws SQLException {
		Connection con=null;
		PreparedStatement ps =null;
		ResultSet rs =null;
	
		String sql="insert into post(post_no, tag_no, board_no, user_id, post_title, post_content) values(post_seq_seq.nextval, ?, ?, ?, ?,?)";
		Post dbPost=null;
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setInt(1, post.getTagNo());
			ps.setInt(2, post.getBoardNo());
			ps.setString(3, post.getUserId());
			ps.setString(4, post.getPostTitle());
			ps.setString(5, post.getPostContent());
			
			
			rs = ps.executeQuery();
			//rs = ps.executeUpdate();
			if(rs.next()) {
				dbPost = new Post(rs.getInt(1), rs.getInt(2), rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7), rs.getInt(8));
			}
			
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return dbPost; 
	}

	@Override
	public Post postUpdate(Post post) throws SQLException {
		Connection con=null;
		PreparedStatement ps =null;
		ResultSet rs =null;
		
		String sql="update post set tag_no=?, board_no=?, post_title=?, post_content=? where post_no=?";
		Post dbPost=null;
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setInt(1, post.getTagNo());
			ps.setInt(2, post.getBoardNo());
			ps.setString(4, post.getPostTitle());
			ps.setString(5, post.getPostContent());
			ps.setInt(6, post.getPostNo());
			
			
			rs = ps.executeQuery();
			if(rs.next()) {
				dbPost = new Post(rs.getInt(1), rs.getInt(2), rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7), rs.getInt(8));
			}
			
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return dbPost; 
		
	}
	public int postDelete(int postNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		int result=0;
		String sql="delete post where post_no=?";
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setInt(1, postNo);
			
			result = ps.executeUpdate();
			
		}finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}

	

	@Override
	public List<Post> selectAllPost() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Post Postview(int postNo) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Post> postLike(int postNo) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
