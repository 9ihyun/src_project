package kosta.mvc.dao;

import java.sql.SQLException;
import java.util.List;

import kosta.mvc.dto.Post;



public interface PostDAO {
	
	/**
	 * 게시글 등록
	 */
	int postInsert(Post post) throws SQLException;
	
	/**
	 * 게시글 수정
	 */
	int postUpdate(Post post) throws SQLException;

	/**
	 * 게시글 삭제
	 */
	int postDelete(int postNo) throws SQLException;
	
	/**
	 * 게시글 리스트
	 */
	List<Post> selectAllPost() throws SQLException;

	/**
	 * 게시글 상세보기
	 */
	Post postView(int postNo) throws SQLException;
	
	/**
	 * 게시글 좋아요(따봉)
	 */
	List<Post> postLike(int postNo) throws SQLException;
	

}
