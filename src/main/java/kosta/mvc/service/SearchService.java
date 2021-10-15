package kosta.mvc.service;

import java.sql.SQLException;
import java.util.List;

import kosta.mvc.dto.Post;

public interface SearchService {
	
	/**
	 * 제목으로 검색
	 */
	public List<Post> searchByTitle(String postTitle) throws SQLException;
	/**
	 * id로 검색
	 */
	public List<Post> searchById(String userId) throws SQLException;

	/**
	 * 태그로 검색
	 */
	public List<Post> selectByTag(int tagNo) throws SQLException;

	/**
	 * 최근글 
	 */
	public List<Post> selectByRecent() throws SQLException;

	/**
	 * 인기글
	 */
	public List<Post> selectByLikes(int postUp) throws SQLException;
	/**
	 * 지역으로 검색
	 */
	public List<Post> selectByRegion(int postNo) throws SQLException;
	
	/**
	 * 모집여부 검색
	 */
	public List<Post> selectByRecuit(int postNo) throws SQLException;
	
	/**
	 * 내용 검색하기
	 */
	public List<Post> searchByContent(String postContent) throws SQLException;


}
