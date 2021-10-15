package kosta.mvc.service;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.mvc.dto.Study;
import kosta.mvc.dto.StudyChat;

public interface MyStudyService {
	/**
	 * 내가 찜한 스터디 보기
	 * */
	public List<Study> viewWishStudy(String id) throws SQLException;
	
	/**
	 * 내가 신청한 스터디 보기
	 * */
	public List<Study> viewSignStudy(String id) throws SQLException;
	
	/**
	 * 내가 등록한 스터디 보기
	 * */
	public List<Study> viewMyStudy(String id) throws SQLException;
	
	/**
	 * 스터디룸 대화 내용 불러오기
	 * */
	public List<StudyChat> viewStudyRoomChat(int studyNo) throws Exception;
}
