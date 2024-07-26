package com.model;

import java.sql.Timestamp;

public class PostLikeDTO {

		private String likeId;
		private String postIdx;
		private String userId;
		private Timestamp likeDate;
		
		public PostLikeDTO(String likeId, String postIdx, String userId, Timestamp likeDate) {
			this.likeId = likeId;
			this.postIdx = postIdx;
			this.userId = userId;
			this.likeDate = likeDate;
		}

		public String getLikeId() {
			return likeId;
		}

		public void setLikeId(String likeId) {
			this.likeId = likeId;
		}

		public String getPostIdx() {
			return postIdx;
		}

		public void setPostIdx(String postIdx) {
			this.postIdx = postIdx;
		}

		public String getUserId() {
			return userId;
		}

		public void setUserId(String userId) {
			this.userId = userId;
		}

		public Timestamp getLikeDate() {
			return likeDate;
		}

		public void setLikeDate(Timestamp likeDate) {
			this.likeDate = likeDate;
		}
		
		
		

}
