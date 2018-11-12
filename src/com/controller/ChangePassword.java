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
 * Servlet implementation class ChangePassword
 */
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		
		String pass = request.getParameter("password");
		
		PrintWriter out = response.getWriter();
		
		
		System.out.println("IN change pw servlet "+email+" "+pass);
		
		Jdbc x = new Jdbc();
		
		int i = x.updatePassword(email,pass);
		
		HttpSession ses = request.getSession();
		ses.invalidate();
		
		if(i>0)
		{
			
			out.println("<script language='javascript'>window.alert('Password updated successfully');window.location.href='index.jsp';</script>");

		//	response.sendRedirect("index.jsp");

		}
		else
		{
			out.println("<script language='javascript'>window.alert('Error updating the password');window.location.href='ForgotPassword.jsp';</script>");

		//	response.sendRedirect("ForgotPassword.jsp");

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
