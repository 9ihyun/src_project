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
		List<Study> wishList = myStudyDAO.viewWishStudy(id);
		
		if(wishList.size() == 0)
			throw new SQLException("찜한 스터디가 없습니다.");
		
		return wishList;
	}

	/**
	 * 스터디 찜하기
	 * */
	@Override
	public int putWishStudy(String id, int studyNo) throws SQLException {
		int result = myStudyDAO.putWishStudy(id, studyNo);
		
		if(result == 0)
			throw new SQLException("스터디 찜에 실패했습니다.");
		
		return result;
	}
	
	/**
	 * 내가 신청한 스터디 보기
	 * */
	@Override
	public List<Study> viewSignStudy(String id) throws SQLException {
		List<Study> signList = myStudyDAO.viewSignStudy(id);
		
		if(signList.size() == 0)
			throw new SQLException("신청한 스터디가 없습니다.");
		
		return signList;
	}

	/**
	 * 스터디 신청하기
	 * */
	@Override
	public int putSignStudy(String id, int studyNo) throws SQLException {
		int result = myStudyDAO.putSignStudy(id, studyNo);
		
		if(result == 0)
			throw new SQLException("스터디 신청에 실패했습니다.");
		
		return result;
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
		List<Study> myStudyList = myStudyDAO.viewMyStudy(id);
		
		if(myStudyList.size() == 0)
			throw new SQLException("등록한 스터디가 없습니다.");
		
		return myStudyList;
	}
	
	/**
	 * 스터디룸 대화 내용 불러오기
	 * */
	@Override
	public List<StudyChat> viewStudyRoomChat(int studyNo) throws SQLException {
		List<StudyChat> chatList = myStudyDAO.viewStudyRoomChat(studyNo);
		
		if(chatList.size() == 0)
			throw new SQLException("아직 스터디원들과 나눈 대화가 없습니다.");
			
		return chatList;
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
