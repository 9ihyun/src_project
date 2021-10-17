package kosta.mvc.dto;

public class StudyChat {
	private int chatNo;
	private int studyNo;
	private String nickname;
	private String chatContent;
	private String chatDate;
	
	public StudyChat() {}
	public StudyChat(int studyNo, String nickname, String chatContent) {
		this.studyNo = studyNo;
		this.nickname = nickname;
		this.chatContent = chatContent;
	}
	public StudyChat(int chatNo, int studyNo, String nickname, String chatContent, String chatDate) {
		this(studyNo, nickname, chatContent);
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
