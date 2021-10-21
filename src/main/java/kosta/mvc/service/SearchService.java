package kosta.mvc.service;

import java.sql.SQLException;
import java.util.List;

import kosta.mvc.dto.Post;

public interface SearchService {
	
	/**
	 * 제목으로 검색
	 */
	public List<Post> searchByTitle(String postTitle, int boardNo) throws SQLException;
	/**
	 * id로 검색
	 */
	public List<Post> searchById(String userId, int boardNo) throws SQLException;

	/**
	 * 태그로 검색
	 */
	public List<Post> searchByTag(int tagNo, int boardNo) throws SQLException;

	/**
	 * 최근글 
	 */
	public List<Post> searchByRecent(int boardNo) throws SQLException;

	/**
	 * 인기글
	 */
	public List<Post> searchByLikes(int boardNo) throws SQLException;
	/**
	 * 지역으로 검색
	 */
	public List<Post> searchByRegion(int postNo) throws SQLException;
	
	/**
	 * 모집여부 검색
	 */
	public List<Post> searchByRecuit(int postNo) throws SQLException;
	
	/**
	 * 내용 검색하기~
	 */
	public List<Post> searchByContent(String postContent, int boardNo) throws SQLException;


}
