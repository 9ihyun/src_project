package kosta.mvc.dto;

public class User {
	private String userId;
	private String nickname;
	private String pw;
	private String birth;
	private String pwq;
	private String pwa;
	private String regdate;
	private int starPoint;
	
	public User() {}
	public User(String userId, String pw) {
		this.userId = userId;
		this.pw = pw;
	}
	public User(String userId, String nickname, String pw, String birth, String pwq, String pwa, String regdate, int starPoint) {
		this(userId, pw);
		this.nickname = nickname;
		this.birth = birth;
		this.pwq = pwq;
		this.pwa = pwa;
		this.regdate = regdate;
		this.starPoint = starPoint;
	}
	
	public String getUserId() {
		return userId;
	}
	public String getNickname() {
		return nickname;
	}
	public String getPw() {
		return pw;
	}
	public String getBirth() {
		return birth;
	}
	public String getPwq() {
		return pwq;
	}
	public String getPwa() {
		return pwa;
	}
	public String getRegdate() {
		return regdate;
	}
	public int getStarPoint() {
		return starPoint;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public void setPwq(String pwq) {
		this.pwq = pwq;
	}
	public void setPwa(String pwa) {
		this.pwa = pwa;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public void setStarPoint(int starPoint) {
		this.starPoint = starPoint;
	}
	
}
