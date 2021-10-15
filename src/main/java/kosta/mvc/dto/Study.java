package kosta.mvc.dto;

public class Study {
	
	private int studyNo;
	private int tagNo;
	private String userId;
	private int stateNo;
	private int dayNo;
	private int studyMaxnum;
	private String studyLocationSi;
	private String studyLocationGu;
	private String studyDuedate;
	private String studyTitle;
	private String studyContent;
	private String studyRegdate;
	
	private int signStateNo;
	
	public Study() {
		// TODO Auto-generated constructor stub
	}
	
	public Study(int studyNo, int tagNo, String userId, int stateNo, int dayNo, int studyMaxnum, String studyLocationSi,
			String studyLocationGu, String studyDuedate, String studyTitle, String studyContent, String studyRegdate) {
		this(studyNo, tagNo, userId, stateNo, dayNo, studyMaxnum, studyLocationSi,studyLocationGu,studyDuedate, studyTitle, studyContent);
		this.studyRegdate =studyRegdate;
		
	}

	public Study(int studyNo, int tagNo, String userId, int stateNo, int dayNo, int studyMaxnum, String studyLocationSi,
			String studyLocationGu, String studyDuedate, String studyTitle, String studyContent) {
		this(tagNo, userId, stateNo, dayNo, studyMaxnum, studyLocationSi,studyLocationGu,studyDuedate, studyTitle, studyContent);
		this.studyNo = studyNo;
	}
	
	public Study(int tagNo, String userId, int stateNo, int dayNo, int studyMaxnum, String studyLocationSi,
			String studyLocationGu, String studyDuedate, String studyTitle, String studyContent) {
		super();
		this.tagNo = tagNo;
		this.userId = userId;
		this.stateNo = stateNo;
		this.dayNo = dayNo;
		this.studyMaxnum = studyMaxnum;
		this.studyLocationSi = studyLocationSi;
		this.studyLocationGu = studyLocationGu;
		this.studyDuedate = studyDuedate;
		this.studyTitle = studyTitle;
		this.studyContent = studyContent;
	}

	public int getStudyNo() {
		return studyNo;
	}

	public void setStudyNo(int studyNo) {
		this.studyNo = studyNo;
	}

	public int getTagNo() {
		return tagNo;
	}

	public void setTagNo(int tagNo) {
		this.tagNo = tagNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getStateNo() {
		return stateNo;
	}

	public void setStateNo(int stateNo) {
		this.stateNo = stateNo;
	}

	public int getStudyMaxnum() {
		return studyMaxnum;
	}

	public void setStudyMaxnum(int studyMaxnum) {
		this.studyMaxnum = studyMaxnum;
	}

	public String getStudyLocationSi() {
		return studyLocationSi;
	}

	public void setStudyLocationSi(String studyLocationSi) {
		this.studyLocationSi = studyLocationSi;
	}

	public String getStudyLocationGu() {
		return studyLocationGu;
	}

	public void setStudyLocationGu(String studyLocationGu) {
		this.studyLocationGu = studyLocationGu;
	}

	public String getStudyDuedate() {
		return studyDuedate;
	}

	public void setStudyDuedate(String studyDuedate) {
		this.studyDuedate = studyDuedate;
	}

	public String getStudyTitle() {
		return studyTitle;
	}

	public void setStudyTitle(String studyTitle) {
		this.studyTitle = studyTitle;
	}

	public String getStudyContent() {
		return studyContent;
	}

	public void setStudyContent(String studyContent) {
		this.studyContent = studyContent;
	}

	public String getStudyRegdate() {
		return studyRegdate;
	}

	public void setStudyRegdate(String studyRegdate) {
		this.studyRegdate = studyRegdate;
	}

	public int getDayNo() {
		return dayNo;
	}

	public void setDayNo(int dayNo) {
		this.dayNo = dayNo;
	}

	public int getSignStateNo() {
		return signStateNo;
	}

	public void setSignStateNo(int signStateNo) {
		this.signStateNo = signStateNo;
	}	

}
