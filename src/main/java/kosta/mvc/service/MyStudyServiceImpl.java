package kosta.mvc.service;

import java.sql.SQLException;
import java.util.List;

import kosta.mvc.dto.Study;

public class MyStudyServiceImpl implements MyStudyService {

	/**
	 * 내가 찜한 스터디 보기
	 * */
	@Override
	public List<Study> viewWishStudy(String id) throws SQLException {
		
		return null;
	}

	/**
	 * 스터디 찜하기
	 * */
	@Override
	public void putWishStudy(String id, int studyNo) throws SQLException {
		

	}

	/**
	 * 내가 신청한 스터디 보기
	 * */
	@Override
	public List<Study> viewSignStudy(String id) throws SQLException {
		
		return null;
	}

	/**
	 * 스터디 신청하기
	 * */
	@Override
	public void putSignStudy(String id, int studyNo) throws SQLException {
		

	}

	/**
	 * 내가 모집한 스터디 보기
	 * */
	@Override
	public List<Study> viewMyStudy(String id) throws SQLException {
		
		return null;
	}

}
