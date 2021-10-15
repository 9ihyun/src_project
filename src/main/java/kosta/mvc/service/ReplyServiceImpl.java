package kosta.mvc.service;

import java.sql.SQLException;
import java.util.List;

import kosta.mvc.dao.ReplyDAO;
import kosta.mvc.dao.ReplyDAOImpl;
import kosta.mvc.dto.PostReply;

public class ReplyServiceImpl implements ReplyService {
	private ReplyDAO replyDao = new ReplyDAOImpl();

	@Override
	public void insertReply(PostReply reply) throws SQLException {
		if(replyDao.insertReply(reply) == 0) {
			throw new SQLException("댓글이 등록되지 않았습니다");
		}

	}

	@Override
	public void updateReply(PostReply reply) throws SQLException {
		if(replyDao.updateReply(reply) == 0) {
			throw new SQLException("댓글이 수정되지 않았습니다");
		}

	}

	@Override
	public void deleteReply(int replyNo) throws SQLException {
		if(replyDao.deleteReply(replyNo) == 0) {
			throw new SQLException("댓글이 삭제되지 않았습니다");
		}

	}

	@Override
	public List<PostReply> selectAllReply(int postNo) throws SQLException {
		return replyDao.selectAllReply(postNo);
	}


}
