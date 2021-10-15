package kosta.mvc.service;

import java.sql.SQLException;
import java.util.List;

import kosta.mvc.dto.Post;

/**
 * @author 성휘
 */
public interface PostService {
	
	
	/**
	 * 게시글 등록
	 */
	public void postInsert(Post post) throws SQLException;
	/**
	 * 게시글 수정
	 */
	public void postUpdate(Post post) throws SQLException;

	/**
	 * 게시글 삭제
	 */
	public void postDelete(int postNo) throws SQLException;

	/**
	 * 게시글 리스트
	 */
	public List<Post> selectAllPost() throws SQLException;

	/**
	 * 게시글 상세보기
	 */
	public Post Postview(int postNo) throws SQLException;
	/**
	 * 게시글 좋아요(따봉)
	 */
	public void postLike(int postNo) throws SQLException;

}
