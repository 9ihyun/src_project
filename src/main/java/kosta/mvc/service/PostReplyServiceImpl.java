package kosta.mvc.service;

import java.sql.SQLException;
import java.util.List;

import kosta.mvc.dao.PostReplyDAO;
import kosta.mvc.dao.PostReplyDAOImpl;
import kosta.mvc.dao.StudyDAO;
import kosta.mvc.dao.StudyDAOImpl;
import kosta.mvc.dto.PostReply;

public class PostReplyServiceImpl implements PostReplyService {
	private PostReplyDAO replyDao = new PostReplyDAOImpl();

	@Override
	public void insertReply(PostReply reply) throws SQLException {
				
		if(replyDao.insertReply(reply) == 0) {
			throw new SQLException("댓글이 등록되지 않았습니다");
		}

	}

	@Override
	public void updateReply(PostReply reply) throws SQLException {
		String dbId = replyDao.getDBUserId(reply.getpReplyNo());
		if(!dbId.equals(reply.getUserId())) {
			throw new SQLException("본인이 작성한 댓글만 수정할 수 있습니다.");
		}
		
		if(replyDao.updateReply(reply) == 0) {
			throw new SQLException("댓글이 수정되지 않았습니다");
		}

	}

	@Override
	public void deleteReply(int replyNo, String userId) throws SQLException {
		String dbId = replyDao.getDBUserId(replyNo);
		if(!dbId.equals(userId)) {
			throw new SQLException("본인이 작성한 댓글만 수정할 수 있습니다.");
		}
		
		if(replyDao.deleteReply(replyNo) == 0) {
			throw new SQLException("댓글이 삭제되지 않았습니다");
		}

	}

	@Override
	public List<PostReply> selectAllReply(int postNo) throws SQLException {
		return replyDao.selectAllReply(postNo);
	}


}
