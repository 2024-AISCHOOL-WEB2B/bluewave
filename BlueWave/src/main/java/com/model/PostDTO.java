package com.model;

import java.sql.Timestamp;

public class PostDTO {
	
	private String postIdx;
	private String postTitle;
	private String postContents;
	private String postFile;
	private String postViews;
	private String postLikes;
	private Timestamp createdAt;
	private Timestamp updatedAt;
	private String userId;
	
	
	public PostDTO() {
		//기본생성자
	}
	public PostDTO(String postIdx, String postTitle, String postContents, String postFile, String postViews,
			String postLikes, Timestamp createdAt, Timestamp updatedAt, String userId) {
		this.postIdx = postIdx;
		this.postTitle = postTitle;
		this.postContents = postContents;
		this.postFile = postFile;
		this.postViews = postViews;
		this.postLikes = postLikes;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.userId = userId;
	}
	public String getPostIdx() {
		return postIdx;
	}
	public void setPostIdx(String postIdx) {
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
	public String getPostViews() {
		return postViews;
	}
	public void setPostViews(String postViews) {
		this.postViews = postViews;
	}
	public String getPostLikes() {
		return postLikes;
	}
	public void setPostLikes(String postLikes) {
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
