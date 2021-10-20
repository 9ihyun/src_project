package kosta.mvc.dao;

import java.sql.SQLException;
import java.util.List;

import kosta.mvc.dto.Study;
import kosta.mvc.dto.User;

/**
 * @author 홍전형
 */
public interface StudyDAO {

	/**
	 * 스터디 게시물 등록
	 */
	int insertStudy(Study study) throws SQLException;

	/**
	 * 스터디 게시물 수정
	 */
	int updateStudy(Study study) throws SQLException;

	/**
	 * 스터디 게시물 삭제 
	 */
	int deleteStudy(int studyNo) throws SQLException;

	/**
	 * 스터디 게시물 리스트 가져오기 
	 */
	List<Study> selectAllStudy() throws SQLException;
	
	/**
	 * 스터디 게시물 리스트 (페이징)
	 */
	List<Study> selectAllStudy(int pageNo) throws SQLException;

	/**
	 * 스터디 게시물 상태보기 
	 */
	Study viewStudy(int studyNo) throws SQLException;
	
	/**
	 * 스터디 게시물 신청자 리스트
	 */
	List<User> getUserList(int studyNo) throws SQLException;
	
	/**
	 * 스터디 게시물 작성자 아이디 가져오기
	 */
	String getDBUserId(int studyNo) throws SQLException;

	/**
	 * 스터디 게시물 수정 폼 이동
	 */
	Study updateStudyView(int studyNo) throws SQLException;
}
