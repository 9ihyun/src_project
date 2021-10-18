package kosta.mvc.dto;

public class StudyChat {
	private int chatNo;
	private int studyNo;
	private String id;
	private String nickname;
	private String chatContent;
	private String chatDate;
	
	public StudyChat() {}
	public StudyChat(int studyNo, String id, String chatContent) {
		this.studyNo = studyNo;
		this.id = id;
		this.chatContent = chatContent;
	}
	public StudyChat(int chatNo, int studyNo, String id, String chatContent, String chatDate) {
		this(studyNo, id, chatContent);
		this.chatNo = chatNo;		
		this.chatDate = chatDate;
	}
	
	public int getChatNo() {
		return chatNo;
	}
	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}
	public int getStudyNo() {
		return studyNo;
	}
	public void setStudyNo(int studyNo) {
		this.studyNo = studyNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getChatContent() {
		return chatContent;
	}
	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}
	public String getChatDate() {
		return chatDate;
	}
	public void setChatDate(String chatDate) {
		this.chatDate = chatDate;
	}
}
