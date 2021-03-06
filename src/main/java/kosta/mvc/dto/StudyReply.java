package kosta.mvc.dto;

public class StudyReply {
	private int sReplyNo;
	private int studyNo;
	private String userId;
	private String sReplyContent;
	private String sReplyDate;
	
	public StudyReply() {
		// TODO Auto-generated constructor stub
	}
	
	public StudyReply(int studyNo, String userId, String sReplyContent) {
		this.studyNo = studyNo;
		this.userId = userId;
		this.sReplyContent = sReplyContent;
	}

	public StudyReply(int sReplyNo, int studyNo, String userId, String sReplyContent, String sReplyDate) {
		this(studyNo, userId, sReplyContent);
		this.sReplyNo = sReplyNo;
		this.sReplyDate = sReplyDate;
	}

	public int getsReplyNo() {
		return sReplyNo;
	}

	public void setsReplyNo(int sReplyNo) {
		this.sReplyNo = sReplyNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getsReplyContent() {
		return sReplyContent;
	}

	public void setsReplyContent(String sReplyContent) {
		this.sReplyContent = sReplyContent;
	}

	public String getsReplyDate() {
		return sReplyDate;
	}

	public void setsReplyDate(String sReplyDate) {
		this.sReplyDate = sReplyDate;
	}

	public int getStudyNo() {
		return studyNo;
	}

	public void setStudyNo(int studyNo) {
		this.studyNo = studyNo;
	}
	
	

}
