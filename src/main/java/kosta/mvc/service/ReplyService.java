package kosta.mvc.service;

import java.sql.SQLException;
import java.util.List;

import kosta.mvc.dto.Study;
import kosta.mvc.dto.User;

public interface ReplyService {

	public void insertComment() throws SQLException;

	public void updateComment(Study study) throws SQLException;

	public void deleteComment(int studyNo) throws SQLException;

	public Study viewReply(int studyNo) throws SQLException;
	
	public List<User> getUserList() throws SQLException;
}
