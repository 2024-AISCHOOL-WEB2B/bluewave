package com.model;

import java.sql.Timestamp;

public class PostDTO {
	
	private int postIdx;
	private String postTitle;
	private String postContents;
	private String postFile;
	private	int postViews;
	private int postLikes;
	private Timestamp createdAt;
	private Timestamp updatedAt;
	private String userId;
	
	
	public PostDTO() {
		//기본생성자
	}
	public PostDTO(int postIdx, String postTitle, String postContents, String postFile, int postViews,
		 Timestamp createdAt, Timestamp updatedAt, String userId) {
		this.postIdx = postIdx;
		this.postTitle = postTitle;
		this.postContents = postContents;
		this.postFile = postFile;
		this.postViews = postViews;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.userId = userId;
	}
	public int getPostIdx() {
		return postIdx;
	}
	public void setPostIdx(int postIdx) {
		this.postIdx = postIdx;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public String getPostContents() {
		return postContents;
	}
	public void setPostContents(String postContents) {
		this.postContents = postContents;
	}
	public String getPostFile() {
		return postFile;
	}
	public void setPostFile(String postFile) {
		this.postFile = postFile;
	}
	public int getPostViews() {
		return postViews;
	}
	public void setPostViews(int postViews) {
		this.postViews = postViews;
	}
	public int getPostLikes() {
		return postLikes;
	}
	public void setPostLikes(int postLikes) {
		this.postLikes = postLikes;
	}
	public Timestamp getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
	public Timestamp getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Timestamp updatedAt) {
		this.updatedAt = updatedAt;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
	
}
