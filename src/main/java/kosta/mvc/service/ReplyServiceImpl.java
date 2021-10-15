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
		// TODO Auto-generated method stub

	}

	@Override
	public void updateReply(PostReply reply) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteReply(int replyNo) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public List<PostReply> selectAllReply(int postNo) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}


}
