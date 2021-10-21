package kosta.mvc.service;

import java.sql.SQLException;
import java.util.List;

import kosta.mvc.dao.MyStudyDAO;
import kosta.mvc.dao.MyStudyDAOImpl;
import kosta.mvc.dto.Study;
import kosta.mvc.dto.StudyChat;

public class MyStudyServiceImpl implements MyStudyService {
	MyStudyDAO myStudyDAO = new MyStudyDAOImpl();
	
	/**
	 * 내가 찜한 스터디 보기
	 * */
	@Override
	public List<Study> viewWishStudy(String id) throws SQLException {
		return myStudyDAO.viewWishStudy(id);
	}

	/**
	 * 스터디 찜하기
	 * */
	@Override
	public int putWishStudy(String id, int studyNo) throws SQLException {
		return myStudyDAO.putWishStudy(id, studyNo);
	}
	
	/**
	 * 내가 신청한 스터디 보기
	 * */
	@Override
	public List<Study> viewSignStudy(String id) throws SQLException {
		return myStudyDAO.viewSignStudy(id);
	}

	/**
	 * 스터디 신청하기
	 * */
	@Override
	public int putSignStudy(String id, int studyNo) throws SQLException {
		return myStudyDAO.putSignStudy(id, studyNo);
	}
	
	/**
	 * 스터디 신청 상태 변경
	 * */
	@Override
	public int changeSignState(String id, int studyNo) throws SQLException {
		int result = myStudyDAO.changeSignState(id, studyNo);
		
		if(result == 0)
			throw new SQLException("스터디 신청 수락에 실패했습니다.");
		
		return result;
	}
	
	/**
	 * 스터디 신청 삭제
	 * */
	@Override
	public int removeSignStudy(String id, int studyNo) throws SQLException {
		int result = myStudyDAO.removeSignStudy(id, studyNo);
		
		if(result == 0)
			throw new SQLException("스터디 신청 삭제에 실패했습니다.");
		
		return result;
	}
	
	/**
	 * 내가 등록한 스터디 보기
	 * */
	@Override
	public List<Study> viewMyStudy(String id) throws SQLException {
		return myStudyDAO.viewMyStudy(id);
	}
	
	/**
	 * 참여중/종료 스터디 보기
	 * */
	@Override
	public List<Study> viewJoinStudy(String id) throws SQLException {
		return myStudyDAO.viewJoinStudy(id);
	}
	
	/**
	 * 스터디룸 대화 내용 불러오기
	 * */
	@Override
	public List<StudyChat> viewStudyRoomChat(int studyNo) throws SQLException {
		return myStudyDAO.viewStudyRoomChat(studyNo);
	}
	
	/**
	 * 스터디룸 대화 내용 입력
	 * */
	@Override
	public int putStudyRoomChat(StudyChat studyChat) throws SQLException {
		int result = myStudyDAO.putStudyRoomChat(studyChat);
		
		if(result == 0)
			throw new SQLException("대화 내용 입력에 실패했습니다.");
		
		return result;
	}
}
