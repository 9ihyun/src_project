package kosta.mvc.dto;

public class StudyRoom {
	private int chatNo;
	private int studyNo;
	private String nickName;
	private String chatContent;
	private String chatDate;
	
	public StudyRoom() {
		super();
	}

	public StudyRoom(int chatNo, int studyNo, String nickName, String chatContent, String chatDate) {
		super();
		this.chatNo = chatNo;
		this.studyNo = studyNo;
		this.nickName = nickName;
		this.chatContent = chatContent;
		this.chatDate = chatDate;
	}

	public int getChatNo() {
		return chatNo;
	}

	public int getStudyNo() {
		return studyNo;
	}

	public String getNickName() {
		return nickName;
	}

	public String getChatContent() {
		return chatContent;
	}

	public String getChatDate() {
		return chatDate;
	}

	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}

	public void setStudyNo(int studyNo) {
		this.studyNo = studyNo;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}

	public void setChatDate(String chatDate) {
		this.chatDate = chatDate;
	}
	
	
}
