package kosta.mvc.service;

import java.sql.SQLException;
import java.util.List;

import kosta.mvc.dao.PostDAO;
import kosta.mvc.dao.PostDAOlmpl;
import kosta.mvc.dto.Post;

public class PostServicelmpl implements PostService {
	private PostDAO postDao = new PostDAOlmpl();

	@Override
	public void postInsert(Post post) throws SQLException {
		if (postDao.postInsert(post) == 0)
			throw new SQLException("게시글이 등록되지 않았습니다");
		
	}

	@Override
	public void postUpdate(Post post) throws SQLException {
		if (postDao.postUpdate(post) == 0)
			throw new SQLException("게시글이 수정되지 않았습니다");
		
	}

	@Override
	public void postDelete(int postNo) throws SQLException {
		if (postDao.postDelete(postNo) == 0)
			throw new SQLException("게시글이 삭제되지 않았습니다");
		
	}

	@Override
	public List<Post> selectAllPost() throws SQLException {
		
		return postDao.selectAllPost();
	}
	@Override
	public List<Post> AllPost() throws SQLException {
		
		return postDao.AllPost();
	}

	@Override
	public Post postView(int postNo) throws SQLException {
		return postDao.postView(postNo);
	}

	@Override
	public void postLike(int postUp,int postNo ) throws SQLException {
		if (postDao.postLike(postUp,postNo) == 0)
			throw new SQLException("추천이 되지 않았습니다");
				//postDao.postLike(postNo);
		
		
	}
	
	

}

	
