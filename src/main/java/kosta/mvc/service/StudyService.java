package kosta.mvc.service;

import java.sql.SQLException;

import java.util.List;

import kosta.mvc.dto.Study;
import kosta.mvc.dto.User;

/**
 * @author 홍전형
 */
public interface StudyService {
	/**
	 * 스터디 게시물 등록
	 */
	public void insertStudy(Study study) throws SQLException;

	/**
	 * 스터디 게시물 수정 
	 */
	public void updateStudy(Study study) throws SQLException;

	/**
	 * 스터디 게시물 삭제
	 */
	public void deleteStudy(int studyNo) throws SQLException;

	/**
	 * 스터디 게시물 리스트 가져오기
	 */
	public List<Study> selectAllStudy() throws SQLException;
	
	/**
	 * 스터디 게시물 리스트 (페이징)
	 */
	public List<Study> selectAllStudy(int pageNo) throws SQLException;

	/**
	 * 스터디 게시물 상세보기
	 */
	public Study viewStudy(int studyNo) throws SQLException;

	/**
	 * 스터디 신청자 리스트 가져오기
	 */
	public List<User> getUserList(int studyNo) throws SQLException;
}
