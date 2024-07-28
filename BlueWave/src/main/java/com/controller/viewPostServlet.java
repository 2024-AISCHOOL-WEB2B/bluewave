package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.PostDAO;
import com.model.PostDTO;

@WebServlet("/viewPostServlet")
public class viewPostServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostDAO dao =  new PostDAO();
		PostDTO dto =  new PostDTO();
		
		dto = dao.postSearch(dto.getPostIdx());
		
	}

}
