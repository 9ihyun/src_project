package kosta.mvc.service;

import java.sql.SQLException;
import java.util.List;

import kosta.mvc.dto.Study;
import kosta.mvc.dto.StudyChat;
import kosta.mvc.dto.User;

public interface MyStudyService {
	/**
	 * 내가 찜한 스터디 보기
	 * */
	public List<Study> viewWishStudy(String id) throws SQLException;
	
	/**
	 * 스터디 찜하기
	 * */
	public int putWishStudy(String id, int studyNo) throws SQLException;
	
	/**
	 * 내가 신청한 스터디 보기
	 * */
	public List<Study> viewSignStudy(String id) throws SQLException;
	
	/**
	 * 스터디 신청하기
	 * */
	public int putSignStudy(String id, int studyNo) throws SQLException;
	
	/**
	 * 스터디 신청 상태 변경
	 * */
	public int changeSignState(String id, int studyNo) throws SQLException;
	
	/**
	 * 스터디 신청 삭제
	 * */
	public int removeSignStudy(String id, int studyNo) throws SQLException;
	
	/**
	 * 내가 등록한 스터디 보기
	 * */
	public List<Study> viewMyStudy(String id) throws SQLException;
	
	/**
	 * 참여중/종료 스터디 보기
	 * */
	public List<Study> viewJoinStudy(String id) throws SQLException;
	
	/**
	 * 스터디룸 대화 내용 불러오기
	 * */
	public List<StudyChat> viewStudyRoomChat(int studyNo) throws SQLException;
	
	/**
	 * 스터디룸 대화 내용 입력
	 * */
	public int putStudyRoomChat(StudyChat studyChat) throws SQLException;
}
