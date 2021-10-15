package kosta.mvc.dto;

public class Post {
	private int postNo;
	private int tagNo;
	private int boardNo;
	private String userId;
	private String postTitle;
	private String postDate;
	private String postContent;
	private int postUp;
	
	public Post(int postNo) {
		this.postNo=postNo;	
	}
	public Post(int postNo, int tagNo, int boardNo, String postTitle, String postContent) {
		this.postNo=postNo;
		this.tagNo=tagNo;
		this.boardNo=boardNo;
		this.postTitle=postTitle;
		this.postContent=postContent;
		
	}
	
	public Post(int postNo, int tagNo, int boardNo, String userId, String postTitle, String postContent) {
		this.postNo=postNo;
		this.tagNo=tagNo;
		this.boardNo=boardNo;
		this.userId=userId;
		this.postTitle=postTitle;
		this.postContent=postContent;
		
	}
	
	public Post(int postNo, int tagNo, int boardNo, String userId, String postTitle, String postDate,
			String postContent, int postUp) {
		this(postNo, tagNo, boardNo, userId, postTitle, postContent);
		this.postDate = postDate;
		this.postUp=postUp;
	}
	
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public int getTagNo() {
		return tagNo;
	}
	public void setTagNo(int tagNo) {
		this.tagNo = tagNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public String getPostDate() {
		return postDate;
	}
	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}
	public String getPostContent() {
		return postContent;
	}
	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	public int getPostUp() {
		return postUp;
	}
	public void setPostUp(int postUp) {
		this.postUp = postUp;
	}
}
