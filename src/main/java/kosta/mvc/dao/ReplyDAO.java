package kosta.mvc.dao;

import java.sql.SQLException;
import java.util.List;

import kosta.mvc.dto.PostReply;

public interface ReplyDAO {

	/**
	 * 댓글 등록
	 */
	int insertReply(PostReply reply) throws SQLException;

	/**
	 * 댓글 수정 
	 */
	int updateReply(PostReply reply) throws SQLException;

	/**
	 * 댓글 삭제 
	 */
	int deleteReply(int replyNo) throws SQLException;

	/**
	 * 댓글 리스트 가져오기 
	 */
	List<PostReply> selectAllReply(int postNo) throws SQLException;
	
	/**
	 * 댓글 좋아요
	 */
	int likeReply(int replyNo) throws SQLException;
}
