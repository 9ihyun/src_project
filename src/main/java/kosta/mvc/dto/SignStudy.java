package kosta.mvc.dto;

public class SignStudy {
	private int studyNo;
	private String userId;
	private int signStateNo;

	public SignStudy() {
		super();
	}

	public SignStudy(int studyNo, String userId, int signStateNo) {
		super();
		this.studyNo = studyNo;
		this.userId = userId;
		this.signStateNo = signStateNo;
	}

	public int getStudyNo() {
		return studyNo;
	}

	public String getUserId() {
		return userId;
	}

	public int getSignStateNo() {
		return signStateNo;
	}

	public void setStudyNo(int studyNo) {
		this.studyNo = studyNo;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setSignStateNo(int signStateNo) {
		this.signStateNo = signStateNo;
	}

}
