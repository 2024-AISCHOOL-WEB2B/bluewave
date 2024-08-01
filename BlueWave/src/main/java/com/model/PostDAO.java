package com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.DBUtil;

public class PostDAO {

    // 쿼리문 작성
    private static final String INSERT_POST_SQL = "INSERT INTO TBL_POST VALUES (post_idx_SEQ.nextval, ?, ?, ?,0, SYSDATE, SYSDATE, ?)";
    private static final String SELECT_POST_SQL = "SELECT * FROM TBL_POST WHERE POST_IDX = ? ";
    private static final String SELECT_POST_LIKE_SQL = "SELECT COUNT(*) FROM tbl_post_like WHERE post_idx = ? ";
    private static final String SELECT_ALL_POSTS_SQL = "SELECT * FROM tbl_post ORDER BY CREATED_AT DESC";

    // 게시물을 DB에 저장하는 메서드
    public int postDbSave(PostDTO post) {
        int result = 0;
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement psmt = connection.prepareStatement(INSERT_POST_SQL)) {

            psmt.setString(1, post.getPostTitle());
            psmt.setString(2, post.getPostContents());
            psmt.setString(3, post.getPostFile() != null ? post.getPostFile() : null);
            psmt.setString(4, post.getUserId());
            result = psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    // 게시물을 DB에서 조회(꺼내오는) 메서드
    public PostDTO postSearch(int post_idx) {
        PostDTO dto = null;
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement psmt = connection.prepareStatement(SELECT_POST_SQL);
             PreparedStatement pm = connection.prepareStatement(SELECT_POST_LIKE_SQL)) {

            psmt.setInt(1, post_idx);
            pm.setInt(1, post_idx);

            try (ResultSet result = psmt.executeQuery();
                 ResultSet resultt = pm.executeQuery()) {

                if (result.next()) {
                    String user_id = result.getString("user_id");
                    String post_title = result.getString("post_title");
                    String post_content = result.getString("post_content");
                    int post_views = result.getInt("post_views");
                    String post_file = result.getString("post_file");
                    java.sql.Timestamp created_at = result.getTimestamp("created_at");
                    java.sql.Timestamp updated_at = result.getTimestamp("updated_at");

                    dto = new PostDTO(post_idx, post_title, post_content, post_file, post_views, created_at, updated_at, user_id);
                }
                if (resultt.next()) {
                    int likecount = resultt.getInt(1);
                    dto.setPostLikes(likecount);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return dto;
    }

    // 커뮤니티 홈으로 글 목록 전체 불러오는 메서드
    public List<PostDTO> getAllPosts() {
        List<PostDTO> postList = new ArrayList<>();
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement psmt = connection.prepareStatement(SELECT_ALL_POSTS_SQL);
             ResultSet rs = psmt.executeQuery()) {

            while (rs.next()) {
                PostDTO post = new PostDTO();
                post.setPostIdx(rs.getInt("post_idx"));
                post.setUserId(rs.getString("user_id"));
                post.setPostTitle(rs.getString("post_title"));
                post.setPostContents(rs.getString("post_content"));
                post.setPostFile(rs.getString("post_file"));
                post.setCreatedAt(rs.getTimestamp("created_at"));
                post.setUpdatedAt(rs.getTimestamp("updated_at"));
                post.setPostViews(rs.getInt("post_views"));
                postList.add(post);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return postList;
    }
    
    
    // 가장 like가 높은 게시글 dto 가져오는 메서드
    public PostDTO getMostLikedPost() {
        PostDTO mostLikedPost = null;
        String SELECT_MOST_LIKED_POST_SQL = 
            "SELECT p.*, NVL(l.like_count, 0) as like_count " +
            "FROM TBL_POST p " +
            "LEFT JOIN (SELECT post_idx, COUNT(*) as like_count FROM tbl_post_like GROUP BY post_idx) l " +
            "ON p.post_idx = l.post_idx " +
            "WHERE ROWNUM = 1 " +
            "ORDER BY NVL(l.like_count, 0) DESC";

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement psmt = connection.prepareStatement(SELECT_MOST_LIKED_POST_SQL);
             ResultSet rs = psmt.executeQuery()) {

            if (rs.next()) {
                mostLikedPost = new PostDTO();
                mostLikedPost.setPostIdx(rs.getInt("post_idx"));
                mostLikedPost.setUserId(rs.getString("user_id"));
                mostLikedPost.setPostTitle(rs.getString("post_title"));
                mostLikedPost.setPostContents(rs.getString("post_content"));
                mostLikedPost.setPostFile(rs.getString("post_file"));
                mostLikedPost.setCreatedAt(rs.getTimestamp("created_at"));
                mostLikedPost.setUpdatedAt(rs.getTimestamp("updated_at"));
                mostLikedPost.setPostViews(rs.getInt("post_views"));
                mostLikedPost.setPostLikes(rs.getInt("like_count"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return mostLikedPost;
    }
}
