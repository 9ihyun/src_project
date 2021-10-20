package kosta.mvc.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import kosta.mvc.dto.Post;
import kosta.mvc.dto.Study;
import kosta.mvc.dto.User;
import kosta.mvc.paging.PageCnt;
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
		Connection con=null;
		PreparedStatement ps=null;
		int result=0;
		String sql = proFile.getProperty("study.insertStudy");
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, study.getTagNo());
			ps.setString(2, study.getUserId());
			ps.setInt(3, study.getStateNo());
			ps.setInt(4, study.getDayNo());
			ps.setInt(5, study.getStudyMaxnum());
			ps.setString(6, study.getStudyLocationSi());
			ps.setString(7, study.getStudyLocationGu());
			ps.setString(8, study.getStudyDuedate());
			ps.setString(9, study.getStudyTitle());
			ps.setString(10, study.getStudyContent());
			
			result = ps.executeUpdate();
			
		}finally {
			DbUtil.dbClose(ps, con);
		}
		
		return result;
	}
	

	@Override
	public int updateStudy(Study study) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		int result=0;
		String sql = proFile.getProperty("study.updateStudy");
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, study.getTagNo());
			ps.setString(2, study.getUserId());
			ps.setInt(3, study.getStateNo());
			ps.setInt(4, study.getDayNo());
			ps.setInt(5, study.getStudyMaxnum());
			ps.setString(6, study.getStudyLocationSi());
			ps.setString(7, study.getStudyLocationGu());
			ps.setString(8, study.getStudyDuedate());
			ps.setString(9, study.getStudyTitle());
			ps.setString(10, study.getStudyContent());
			ps.setInt(11, study.getStudyNo());
			
			result = ps.executeUpdate();
		}finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}

	@Override
	public int deleteStudy(int studyNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		int result=0;
		String sql = proFile.getProperty("study.deleteStudy");
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, studyNo);
			
			result = ps.executeUpdate();
		}finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
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
						rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11),
						rs.getString(12));
				studyList.add(study);
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return studyList;
	}
	
	@Override
	public List<Study> selectAllStudy(int pageNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<Study> studyList = new ArrayList<>();
		String sql = proFile.getProperty("study.pagingSelect"); //where rnum <=? and rnum>=?
		try {
			
			//전체 레코드 수 구하기 
			int totalCount = this.getSelectTotalCount();
			
			int totalPage = totalCount%PageCnt.pagesize==0 ? totalCount/PageCnt.pagesize : (totalCount/PageCnt.pagesize)+1;
			
			//총 페이지수 구하기
			PageCnt pageCnt = new PageCnt();
			pageCnt.setPageCnt( totalPage ) ;
			PageCnt.setPageNo(pageNo);//사용자가 클릭한 페이지 번호로 설정
			
			
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, pageNo*PageCnt.pagesize); //최대 6 *5
			ps.setInt(2, (pageNo-1)*PageCnt.pagesize +1); //최소 (6-1)*5+1
			
			rs = ps.executeQuery();
			while(rs.next()) {
				Study study = new Study(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getInt(5),
						rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11),
						rs.getString(12));
				
				studyList.add(study);
			}
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return studyList;
	}
	
	/**
	 * 전체 게시물 개수 가져오기 
	 * */
	private int getSelectTotalCount() throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
	    int result=0;
		String sql = proFile.getProperty("study.totalCount"); //
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
			   result = rs.getInt(1);
			}
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return result;
	}

	@Override
	public Study viewStudy(int studyNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Study study = null;
		String sql = proFile.getProperty("study.viewStudy");
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, studyNo);

			rs = ps.executeQuery();
			if (rs.next()) {
				study = new Study(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11),
						rs.getString(12));
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return study;
	}

	@Override
	public List<User> getUserList(int studyNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		List<User> userList = new ArrayList<>();
		String sql = proFile.getProperty("study.getUserList");
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				User user = new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), 
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8));
				
				userList.add(user);
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return userList;
	}

	/**
	 * 게시물 작성자의 아이디를 가져오는 메서드
	 */
	public String getDBUserId(int studyNo) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String id = null;
		String sql = proFile.getProperty("study.getDBUserId");
		//select user_id from study where study_no = ?
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, studyNo);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				id = rs.getString(1);
			}
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return id;
	}

	@Override
	public Study updateStudyView(int studyNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Study study = null;
		String sql = proFile.getProperty("study.updateStudyView");
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, studyNo);

			rs = ps.executeQuery();
			if (rs.next()) {
				study = new Study(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getInt(5),
						rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11),
						rs.getString(12));
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return study;
	}
}
