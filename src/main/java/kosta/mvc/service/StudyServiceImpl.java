package kosta.mvc.service;

import java.sql.SQLException;
import java.util.List;

import kosta.mvc.dao.StudyDAO;
import kosta.mvc.dao.StudyDAOImpl;
import kosta.mvc.dto.Study;
import kosta.mvc.dto.User;

public class StudyServiceImpl implements StudyService {
	private StudyDAO studyDao = new StudyDAOImpl();

	@Override
	public void insertStudy(Study study) throws SQLException {
		if( studyDao.insertStudy(study) == 0 )
			  throw new SQLException("등록되지 않았습니다");

	}

	@Override
	public void updateStudy(Study study) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteStudy(int studyNo) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Study> selectAllStudy() throws SQLException {
		return studyDao.selectAllStudy();
	}

	@Override
	public Study viewStudy(int studyNo) throws SQLException {
		Study study = studyDao.viewStudy(studyNo);

		if (study == null)
			throw new SQLException("조회할 수 없습니다");
		return study;
	}

	@Override
	public List<User> getUserList() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
