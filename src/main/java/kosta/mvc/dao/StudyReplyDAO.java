package kosta.mvc.dao;

import java.sql.SQLException;
import java.util.List;

import kosta.mvc.dto.PostReply;
import kosta.mvc.dto.StudyReply;

public interface StudyReplyDAO {

	/**
	 * 댓글 등록
	 */
	int insertReply(StudyReply reply) throws SQLException;

	/**
	 * 댓글 수정 
	 */
	int updateReply(StudyReply reply) throws SQLException;

	/**
	 * 댓글 삭제 
	 */
	int deleteReply(int replyNo) throws SQLException;

	/**
	 * 댓글 리스트 가져오기 
	 */
	List<StudyReply> selectAllReply(int studyNo) throws SQLException;

	/**
	 * 댓글  작성자 아이디 가져오기
	 */
	String getDBUserId(int replyNo) throws SQLException;
}
