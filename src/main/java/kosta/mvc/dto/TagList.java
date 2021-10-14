package kosta.mvc.dto;

public class TagList {
	
	private int tagNo;
	private String tagName;
	
	public TagList() {
		// TODO Auto-generated constructor stub
	}

	public TagList(int tagNo, String tagName) {
		super();
		this.tagNo = tagNo;
		this.tagName = tagName;
	}

	public int getTagNo() {
		return tagNo;
	}

	public void setTagNo(int tagNo) {
		this.tagNo = tagNo;
	}

	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}
	
	

}
