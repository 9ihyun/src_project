package kosta.mvc.dao;

import java.sql.SQLException;
import java.util.List;

import kosta.mvc.dto.Study;

public class MyStudyDAOImpl implements MyStudyDAO {

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
	public int putWishStudy(String id, int studyNo) throws SQLException {
		return 0;
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
	public int putSignStudy(String id, int studyNo) throws SQLException {
		return 0;
	}

	/**
	 * 내가 모집한 스터디 보기
	 * */
	@Override
	public List<Study> viewMyStudy(String id) throws SQLException {
		return null;
	}
	
}
