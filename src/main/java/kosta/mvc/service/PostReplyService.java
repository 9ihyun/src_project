package kosta.mvc.service;

import java.sql.SQLException;
import java.util.List;

import kosta.mvc.dto.User;
import kosta.mvc.dto.PostReply;

/**
 * @author 홍전형
 */
public interface PostReplyService {

	/**
	 * 댓글 등록
	 */
	public void insertReply(PostReply reply) throws SQLException;

	/**
	 * 댓글 수정 
	 */
	public void updateReply(PostReply reply) throws SQLException;

	/**
	 * 댓글 삭제 
	 */
	public void deleteReply(int replyNo, String userId) throws SQLException;

	/**
	 * 댓글 리스트 가져오기 
	 */
	public List<PostReply> selectAllReply(int postNo) throws SQLException;
	
}
