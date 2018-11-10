package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.Jdbc;

/**
 * Servlet implementation class ForgotPasswordServlet
 */
public class ForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotPasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Jdbc x = new Jdbc();
		
		String email = request.getParameter("email");
		String quest="";
		
		HttpSession ses = request.getSession();
		
		ses.setAttribute("emailid", email);
		
		
		if(x.searchEmail(email))
		{
			
			quest = x.searchQuestion(email);
			
			ses.setAttribute("question",quest);
			
			
			
			ses.setAttribute("isEmailCorrect", true);
			response.sendRedirect("ForgotPassword.jsp");
			
		}
		else
		{
			ses.setAttribute("isEmailCorrect", false);
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
