package kosta.mvc.dto;

public class WishStudy {
	int studyNo;
	String userId;

	public WishStudy() {
		super();
	}

	public WishStudy(int studyNo, String userId) {
		super();
		this.studyNo = studyNo;
		this.userId = userId;
	}

	public int getStudyNo() {
		return studyNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setStudyNo(int studyNo) {
		this.studyNo = studyNo;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

}
