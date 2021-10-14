package kosta.mvc.dto;

public class Board {
	private int boardNo;
	private String boardName;
	
	public Board() {}
	public Board(int boardNo, String boardName) {
		this.boardNo = boardNo;
		this.boardName = boardName;
	}
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}	
}
