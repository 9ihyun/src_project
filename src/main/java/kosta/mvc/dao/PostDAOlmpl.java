package kosta.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import kosta.mvc.dto.Post;
import kosta.mvc.dto.Study;
import kosta.mvc.util.DbUtil;

public class PostDAOlmpl implements PostDAO {
	Properties proFile = new Properties();
	
	public PostDAOlmpl() {
		try {
			proFile.load(getClass().getClassLoader().getResourceAsStream("dbQuery.properties"));
		}catch (Exception e) {
			e.printStackTrace();
		}
	}	

	@Override
	public int postInsert(Post post) throws SQLException {
		Connection con=null;
		PreparedStatement ps =null;
		//ResultSet rs =null;
		int result=0;
	
		String sql="insert into post(tag_no, board_no, user_id, post_title, post_content) values(?, ?, ?, ?,?)";
		Post dbPost=null;
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setInt(1, post.getTagNo());
			ps.setInt(2, post.getBoardNo());
			ps.setString(3, post.getUserId());
			ps.setString(4, post.getPostTitle());
			ps.setString(5, post.getPostContent());
			
			
			//rs = ps.executeQuery();
			result = ps.executeUpdate();
			
			
			
		}finally {
			DbUtil.dbClose(ps, con);
		}
		return result; 
	}

	@Override
	public int postUpdate(Post post) throws SQLException {
		Connection con=null;
		PreparedStatement ps =null;
		ResultSet rs =null;
		int result=0;
		
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
			
			result = ps.executeUpdate();
			//rs = ps.executeQuery();
			if(rs.next()) {
				dbPost = new Post(rs.getInt(1), rs.getInt(2), rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7), rs.getInt(8));
			}
			
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return result; 
		
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
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		List<Post> postList = new ArrayList<>();
		String sql = proFile.getProperty("post.selectAll");
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Post post = new Post(rs.getInt(1), rs.getInt(2), rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7), rs.getInt(8));
				postList.add(post);
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return postList;
	}

	

	@Override
	public Post postView(int postNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Post post = null;
		String sql = proFile.getProperty("post.postView");
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, postNo);

			rs = ps.executeQuery();
			if (rs.next()) {
				post = new Post(rs.getInt(1), rs.getInt(2), rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7), rs.getInt(8));
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return post;
	}
	

	@Override
	public List<Post> postLike(int postNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		List<Post> postLike = new ArrayList<>();
		String sql = proFile.getProperty("post.like");
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Post post = new Post(rs.getInt(1), rs.getInt(2), rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7), rs.getInt(8));
				postLike.add(post);
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return postLike;
	}
	
	

}
