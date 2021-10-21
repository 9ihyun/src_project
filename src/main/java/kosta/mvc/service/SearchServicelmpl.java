package kosta.mvc.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import kosta.mvc.dto.Post;
import kosta.mvc.util.DbUtil;


public class SearchServicelmpl implements SearchService{
	
Properties proFile = new Properties();
	
	public SearchServicelmpl() {
		try {
			proFile.load(getClass().getClassLoader().getResourceAsStream("dbQuery.properties"));
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Post> searchByTitle(String postTitle, int boardNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Post post = null;
		List<Post> searchTitle = new ArrayList<Post>();
		String sql = "SELECT * FROM post WHERE post_title LIKE ? and board_no=?";
		
		try {			
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, "%"+postTitle+"%");
			ps.setInt(2, boardNo);
			
			rs = ps.executeQuery();
			
			while (rs.next()) {
				post = new Post(rs.getInt(1), rs.getInt(2), rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7), rs.getInt(8));
				searchTitle.add(post);
			}
			
			
			
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
			
		return searchTitle;
	}

	@Override
	public List<Post> searchById(String userId, int boardNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Post post = null;
		List<Post> search = new ArrayList<Post>();
		String sql = "SELECT * FROM post WHERE user_id LIKE ? and board_no=?";
		
		try {			
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, "%"+userId+"%");
			ps.setInt(2, boardNo);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				post = new Post(rs.getInt(1), rs.getInt(2), rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7), rs.getInt(8));
				search.add(post);
			}
			
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
			
		return search;
	}

	@Override
	public List<Post> searchByTag(int tagNo, int boardNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Post post = null;
		List<Post> search = new ArrayList<Post>();
		String sql = "SELECT * FROM post WHERE tag_no LIKE ? and board_no=?";
		
		try {			
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, "%"+tagNo+"%");
			ps.setInt(2, boardNo);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				post = new Post(rs.getInt(1), rs.getInt(2), rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7), rs.getInt(8));
				search.add(post);
			}
			
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
			
		return search;
	}
	/**
	 * 최근 게시글 보기
	 */
	@Override
	public List<Post> searchByRecent(int boardNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Post post = null;
		List<Post> search = new ArrayList<Post>();
		String sql = "SELECT * FROM post where board_no=? order by post_date DESC ";
		
		try {			
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, boardNo);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				post = new Post(rs.getInt(1), rs.getInt(2), rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7), rs.getInt(8));
				search.add(post);
			}
			
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
			
		return search;
	}
	/**
	 * 인기순 게시글 보기
	 */
	@Override
	public List<Post> searchByLikes(int boardNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Post post = null;
		List<Post> search = new ArrayList<Post>();
		//String sql = proFile.getProperty("post.postUp");
		String sql = "SELECT * FROM post where board_no=? order by post_up DESC ";
		
		try {			
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, boardNo);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				post = new Post(rs.getInt(1), rs.getInt(2), rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7), rs.getInt(8));
				search.add(post);
			}
			
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
			
		return search;
	}

	@Override
	public List<Post> searchByRegion(int postNo) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Post> searchByRecuit(int postNo) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Post> searchByContent(String postContent, int boardNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Post post = null;
		List<Post> search = new ArrayList<Post>();
		String sql = "SELECT * FROM post WHERE post_content LIKE ? and board_no=?";
		
		try {			
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, "%"+postContent+"%");
			ps.setInt(2, boardNo);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				post = new Post(rs.getInt(1), rs.getInt(2), rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7), rs.getInt(8));
				search.add(post);
			}
			
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
			
		return search;
	}
	
	
	
}