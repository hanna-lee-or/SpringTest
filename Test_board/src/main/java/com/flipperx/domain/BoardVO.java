package com.flipperx.domain;

import java.util.Date;

public class BoardVO {
// bno  int   not null  auto_increment,
// title  varchar(100) not null,
// content text   not null,
// writer varchar(30) not null,
// regDate timestamp default now(),
// viewCnt int   default 0,
// likeCnt int   default 0,
// commentCnt int   default 0,
// attachCnt int   default 0,

	private int boardNum;
	private String title;
	private String content;
	private String writer;
	private Date regDate;
	private int viewCnt;
	private int likeCnt;
	private int commentCnt;
	private int attachCnt;

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public int getLikeCnt() {
		return likeCnt;
	}

	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}

	public int getCommentCnt() {
		return commentCnt;
	}

	public void setCommentCnt(int commentCnt) {
		this.commentCnt = commentCnt;
	}

	public int getAttachCnt() {
		return attachCnt;
	}

	public void setAttachCnt(int attachCnt) {
		this.attachCnt = attachCnt;
	}

}
