package kosta.mvc.dto;

public class PostReply {
	private int pReplyNo;
	private int postNo;
	private String userId;
	private String pReplyContent;
	private String pReplyDate;

	public PostReply() {
	}

	public PostReply(int postNo, String userId, String pReplyContent) {
		this.postNo = postNo;
		this.userId = userId;
		this.pReplyContent = pReplyContent;
	}

	public PostReply(int pReplyNo, int postNo, String userId, String pReplyContent, String pReplyDate) {
		this(postNo, userId, pReplyContent);
		this.pReplyNo = pReplyNo;
		this.pReplyDate = pReplyDate;
	}

	public int getpReplyNo() {
		return pReplyNo;
	}

	public void setpReplyNo(int pReplyNo) {
		this.pReplyNo = pReplyNo;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getpReplyContent() {
		return pReplyContent;
	}

	public void setpReplyContent(String pReplyContent) {
		this.pReplyContent = pReplyContent;
	}

	public String getpReplyDate() {
		return pReplyDate;
	}

	public void setpReplyDate(String pReplyDate) {
		this.pReplyDate = pReplyDate;
	}
}
