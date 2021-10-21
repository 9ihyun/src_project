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
import kosta.mvc.dto.User;
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
				
				study.setSignUserNo(getSignUserNo(con, rs.getInt(1)));
				study.setStudyCurrNo(getStudyCurrNo(con, rs.getInt(1)));
				
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
	public int putWishStudy(String id, int studyNo) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		String sql = proFile.getProperty("myStudy.putWishStudy");
		int result = 0;
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setInt(2, studyNo);
			
			if(checkWishDuplicate(con, id, studyNo)) {
				return -1;
			}			
			
			result = ps.executeUpdate();
			
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbUtil.dbClose(ps, con);
		}
		
		return result;
	}
	
	/**
	 * 사용자가 찜한 스터디개수 가져오기(중복체크)
	 */
	public boolean checkWishDuplicate(Connection con, String id, int studyNo) throws SQLException {
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select study_no from wish_study where user_id = ?";
		boolean result = false;
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				if(studyNo == rs.getInt(1)) {
					return true;
				}
			}
			
		} finally {
			DbUtil.dbClose(rs, ps, null);
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
				study.setSignUserNo(getSignUserNo(con, rs.getInt(1)));
				study.setStudyCurrNo(getStudyCurrNo(con, rs.getInt(1)));
				
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
	public int putSignStudy(String id, int studyNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = proFile.getProperty("myStudy.putSignStudy");
		int result = 0;
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setInt(2, studyNo);
			
			if(checkSignDuplicate(con, id, studyNo)){
				return -1;
			}
			
			result = ps.executeUpdate();
			
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbUtil.dbClose(ps, con);
		}
		
		return result;
	}
	
	/**
	 * 사용자가 신청한 스터디번호 가져오기(중복체크)
	 */
	public boolean checkSignDuplicate(Connection con, String id, int studyNo) throws SQLException {
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select study_no from sign_study where user_id = ?";
		boolean result = false;
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				if(studyNo == rs.getInt(1)) {
					return true;
				}
			}			
		} finally {
			DbUtil.dbClose(rs, ps, null);
		}
		return result;
	}
	
	
	/**
	 * 스터디 신청 상태 변경
	 * */
	@Override
	public int changeSignState(String id, int studyNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = proFile.getProperty("myStudy.changeSignState");
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
	 * 스터디 신청 삭제
	 * */
	@Override
	public int removeSignStudy(String id, int studyNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = proFile.getProperty("myStudy.removeSignStudy");
		int result = 0;
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setInt(2, studyNo);
			result = ps.executeUpdate();
			
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
				
				study.setSignUserNo(getSignUserNo(con, rs.getInt(1)));
				study.setStudyCurrNo(getStudyCurrNo(con, rs.getInt(1)));
				
				myStudyList.add(study);
			}
			
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return myStudyList;
	}
	
	/**
	 * 신청자 수 가져오기
	 * */
	private int getSignUserNo(Connection con, int studyNo) throws SQLException{
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = proFile.getProperty("myStudy.getSignUserNo");
		int result = 0;
		
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, studyNo);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
		}finally {
			DbUtil.dbClose(rs, ps, null);
		}
		
		return result;
	}
	
	/**
	 * 현재 모집 완료 인원 가져오기
	 * */
	private int getStudyCurrNo(Connection con, int studyNo) throws SQLException{
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = proFile.getProperty("myStudy.getStudyCurrNo");
		int result = 0;
		
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, studyNo);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1) + 1;
			}
			
		}finally {
			DbUtil.dbClose(rs, ps, null);
		}
		
		return result;
	}
	
	/**
	 * 참여중/종료 스터디 보기
	 * */
	@Override
	public List<Study> viewJoinStudy(String id) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = proFile.getProperty("myStudy.viewJoinStudy");
		List<Study> joinList = new ArrayList<Study>();
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, id);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Study study = new Study(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getInt(6),
						rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12));
				
				study.setStudyCurrNo(getStudyCurrNo(con, rs.getInt(1)));
				study.setUserList(getStudyMember(con, id, rs.getInt(1)));
				
				joinList.add(study);
			}
			
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return joinList;
	}
	
	/**
	 * 스터디 명단 가져오기
	 * */
	public List<User> getStudyMember(Connection con, String id, int studyNo) throws SQLException {
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = proFile.getProperty("myStudy.getStudyMember");
		List<User> userList = new ArrayList<User>();
		
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, studyNo);
			ps.setInt(2, studyNo);
			ps.setString(3, id);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				User user = new User();
				user.setUserId(rs.getString(1));
				user.setNickname(rs.getString(2));
				
				userList.add(user);
			}
			
		}finally {
			DbUtil.dbClose(rs, ps, null);
		}
		
		return userList;
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
				StudyChat chat = new StudyChat(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5));
				chat.setNickname(new UserDAOImpl().myInfo(rs.getString(3)).getNickname());
				chatList.add(chat);
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
			ps.setString(2, chat.getId());
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
