package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.PostDTO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.util.Properties;

@WebServlet("/PostLikeService")
public class PostLikeService {

	String userId; //회원 번호
	String postIdx; //글 번호
	Boolean isLike; //변수추가 좋아요 한 글인가?
	
	//1. 게시물 번호를 가져오기
	//2. 회원 번호 가져오기
	//3. db postlike 테이블에 있는지 확인한다.
	// * postlike 테이블의 like컬럼값을!!
	//4. 만약 있으면 like수는 변동X
	//5. 없으면 like +1
	
	
	PostDTO post = new PostDTO();
	
	
	
	
}
