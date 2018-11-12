package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.Jdbc;

/**
 * Servlet implementation class UpdatePasswordServlet
 */
public class UpdatePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String answer =  request.getParameter("answer");
		
		PrintWriter out = response.getWriter();
		
		Jdbc x = new Jdbc();
		HttpSession ses = request.getSession();
		
		
		
		if(x.searchAnswer(answer))
		{
			
			
		ses.setAttribute("isAnswerCorrect", true);
		 	response.sendRedirect("ForgotPassword.jsp");

		}
		else
		{

			
			ses.setAttribute("isAnswerCorrect", false);
          //  out.println("<script language='javascript'>window.alert('Please enter correct answer');window.location.href='ForgotPassword.jsp';</script>");

			response.sendRedirect("ForgotPassword.jsp");

			
		}
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
