package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.PostDTO;
import com.model.PostLikeDAO;
import com.model.UserDTO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.util.Properties;

@WebServlet("/PostLikeService")
public class PostLikeService {

	//1. 게시물 번호를 가져오기
	PostDTO post = new PostDTO();
	int postIdx = post.getPostIdx(); //글번호
	
	//2. 회원 번호 가져오기
	UserDTO user = new UserDTO();
	String userId = user.getUserId(); //회원 번호
	
	//* postlikedao 객체 생성
	PostLikeDAO dao = new PostLikeDAO();  
	
	//3. db postlike 테이블에 있는지 확인
	//postlke dao에 좋아요확인 메서드 만들어서
	//좋아요 눌렀으면 (조회되면) 1 반환, 좋아요 안눌렀으면 (조회X) 0반환
	//안눌렀으면 이 파일에서 테이블like컬럼값 +1, 눌렀으면 변동없게끔 설정ㅔ
	 int result = PostLikeDAO.like(userId,postIdx);
	 
}
