package kosta.mvc.dao;

import java.sql.SQLException;
import java.util.List;

import kosta.mvc.dto.Post;



public interface PostDao {
	
	
	Post postInsert(Post post) throws SQLException;

	Post postUpdate(Post post) throws SQLException;

	int postDelete(int postNo) throws SQLException;

	List<Post> selectAllPost() throws SQLException;

	Post Postview(int postNo) throws SQLException;
	
	List<Post> postLike(int postNo) throws SQLException;

}
