package kosta.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import kosta.mvc.dto.Study;
import kosta.mvc.dto.StudyChat;
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
	public int putWishStudy(String id, int studyNo) {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = proFile.getProperty("myStudy.putWishStudy");
		int result = 0;
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setInt(2, studyNo);
			result = ps.executeUpdate();
			
		}catch (SQLException e) {
			e.printStackTrace();
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
	public int putSignStudy(String id, int studyNo) {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = proFile.getProperty("myStudy.putSignStudy");
		int result = 0;
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setInt(2, studyNo);
			result = ps.executeUpdate();
			
		}catch (SQLException e) {
			e.printStackTrace();
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
	
	/**
	 * 스터디룸 대화 내용 불러오기
	 * */
	@Override
	public List<StudyChat> viewStudyRoomChat(int studyNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = proFile.getProperty("myStudy.viewStudyRoomChat");
		List<StudyChat> chatList = new ArrayList<StudyChat>();
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, studyNo);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				StudyChat studychat = new StudyChat(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5));
				chatList.add(studychat);
			}
			
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return chatList;
	}
	
	/**
	 * 스터디룸 대화 내용 입력
	 * */
	@Override
	public int putStudyRoomChat(StudyChat chat) {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = proFile.getProperty("myStudy.putStudyRoomChat");
		int result = 0;
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, chat.getStudyNo());
			ps.setString(2, chat.getNickname());
			ps.setString(3, chat.getChatContent());
			result = ps.executeUpdate();
			
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbUtil.dbClose(ps, con);
		}
		
		return result;
	}
}
