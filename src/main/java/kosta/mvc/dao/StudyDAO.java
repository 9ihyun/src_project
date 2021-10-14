package kosta.mvc.dao;

import java.sql.SQLException;
import java.util.List;

import kosta.mvc.dto.Study;
import kosta.mvc.dto.User;

public interface StudyDAO {

	int insertStudy(Study study) throws SQLException;

	int updateStudy(Study study) throws SQLException;

	int deleteStudy(int studyNo) throws SQLException;

	List<Study> selectAllStudy() throws SQLException;

	Study viewStudy(int studyNo) throws SQLException;
	
	List<User> getUserList() throws SQLException;
}
