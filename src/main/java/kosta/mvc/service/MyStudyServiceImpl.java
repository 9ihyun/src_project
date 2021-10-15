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
	 * 내가 신청한 스터디 보기
	 * */
	@Override
	public List<Study> viewSignStudy(String id) throws SQLException {
		List<Study> signList = myStudyDAO.viewWishStudy(id);
		
		if(signList.size() == 0)
			throw new SQLException("신청한 스터디가 없습니다.");
		
		return signList;
	}

	/**
	 * 내가 등록한 스터디 보기
	 * */
	@Override
	public List<Study> viewMyStudy(String id) throws SQLException {
		List<Study> myStudyList = myStudyDAO.viewWishStudy(id);
		
		if(myStudyList.size() == 0)
			throw new SQLException("등록한 스터디가 없습니다.");
		
		return myStudyList;
	}
	
	/**
	 * 스터디룸 대화 내용 불러오기
	 * */
	@Override
	public List<StudyChat> viewStudyRoomChat(int studyNo) throws Exception {
		List<StudyChat> chatList = myStudyDAO.viewStudyRoomChat(studyNo);
		
		if(chatList.size() == 0)
			throw new SQLException("아직 스터디원들과 나눈 대화가 없습니다.");
			
		return chatList;
	}

}
