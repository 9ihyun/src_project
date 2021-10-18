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
		if (studyDao.insertStudy(study) == 0)
			throw new SQLException("스터디가 등록되지 않았습니다");

	}

	@Override
	public void updateStudy(Study study) throws SQLException {
		String dbId = studyDao.getDBUserId(study.getStudyNo());
		if(!dbId.equals(study.getUserId())) {
			throw new SQLException("본인이 작성한 스터디만 수정할 수 있습니다.");
		}
		
		if (studyDao.updateStudy(study) == 0) {
			throw new SQLException("스터디가 수정되지 않았습니다");
		}

	}

	@Override
	public void deleteStudy(int studyNo, String userId) throws SQLException {
		String dbId = studyDao.getDBUserId(studyNo);
		if(!dbId.equals(userId)) {
			throw new SQLException("본인이 작성한 스터디만 삭제할 수 있습니다.");
		}
		
		if( studyDao.deleteStudy(studyNo)==0)
			throw new SQLException("스터디가 삭제되지 않았습니다");

	}

	@Override
	public List<Study> selectAllStudy() throws SQLException {
		return studyDao.selectAllStudy();
	}
	
	@Override
	public List<Study> selectAllStudy(int pageNo) throws SQLException {
		return studyDao.selectAllStudy(pageNo);
	}

	@Override
	public Study viewStudy(int studyNo) throws SQLException {
		Study study = studyDao.viewStudy(studyNo);

		if (study == null)
			throw new SQLException("스터디를 조회할 수 없습니다");
		return study;
	}

	@Override
	public List<User> getUserList(int studyNo) throws SQLException {
		return studyDao.getUserList(studyNo);
	}

}
