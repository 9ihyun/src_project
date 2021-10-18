package kosta.mvc.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kosta.mvc.dto.Post;
import kosta.mvc.util.DbUtil;


public class SearchServicelmpl implements SearchService{

	@Override
	public List<Post> searchByTitle(String postTitle) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Post post = null;
		List<Post> searchTitle = new ArrayList<Post>();
		String sql = "SELECT * FROM post WHERE post_title LIKE '?'";
		
		try {			
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, "%"+postTitle+"%");
			rs = ps.executeQuery();
			
			if(rs.next()) {
				post = new Post(rs.getInt(1), rs.getInt(2), rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7), rs.getInt(8));
				searchTitle.add(post);
			}
			
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
			
		return searchTitle;
	}

	@Override
	public List<Post> searchById(String userId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Post post = null;
		List<Post> search = new ArrayList<Post>();
		String sql = "SELECT * FROM post WHERE user_id LIKE '?'";
		
		try {			
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, "%"+userId+"%");
			rs = ps.executeQuery();
			
			if(rs.next()) {
				post = new Post(rs.getInt(1), rs.getInt(2), rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7), rs.getInt(8));
				search.add(post);
			}
			
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
			
		return search;
	}

	@Override
	public List<Post> searchByTag(int tagNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Post post = null;
		List<Post> search = new ArrayList<Post>();
		String sql = "SELECT * FROM post WHERE tag_no LIKE '?'";
		
		try {			
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, "%"+tagNo+"%");
			rs = ps.executeQuery();
			
			if(rs.next()) {
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
	public List<Post> searchByRecent() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Post post = null;
		List<Post> search = new ArrayList<Post>();
		String sql = "SELECT * FROM post order by post_date DESC";
		
		try {			
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			if(rs.next()) {
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
	public List<Post> searchByLikes(int postUp) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Post post = null;
		List<Post> search = new ArrayList<Post>();
		String sql = "SELECT * FROM post order by post_up DESC";
		
		try {			
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			if(rs.next()) {
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
	public List<Post> searchByContent(String postContent) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Post post = null;
		List<Post> search = new ArrayList<Post>();
		String sql = "SELECT * FROM post WHERE post_content LIKE '?'";
		
		try {			
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, "%"+postContent+"%");
			rs = ps.executeQuery();
			
			if(rs.next()) {
				post = new Post(rs.getInt(1), rs.getInt(2), rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7), rs.getInt(8));
				search.add(post);
			}
			
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
			
		return search;
	}
	
	
	
}