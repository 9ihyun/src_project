package kosta.mvc.service;

import java.sql.SQLException;
import java.util.List;

import kosta.mvc.dto.Post;


public interface PostService {
	
	public void postInsert(Post post) throws SQLException;

	public void postUpdate(Post post) throws SQLException;

	public void postDelete(int postNo) throws SQLException;

	public List<Post> selectAllPost() throws SQLException;

	public Post Postview(int postNo) throws SQLException;
	
	public void postLike(int postNo) throws SQLException;

}
