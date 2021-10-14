package kosta.mvc.service;

import java.sql.SQLException;
import java.util.List;

import kosta.mvc.dto.Study;
import kosta.mvc.dto.User;

public interface StudyService {
	
	public void insertStudy(Study study) throws SQLException;

	public void updateStudy(Study study) throws SQLException;

	public void deleteStudy(int studyNo) throws SQLException;

	public List<Study> selectAllStudy() throws SQLException;

	public Study viewStudy(int studyNo) throws SQLException;
	
	public List<User> getUserList() throws SQLException;
}
